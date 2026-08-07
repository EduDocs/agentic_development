#!/usr/bin/env python3
"""Generate ``notes/site/data/graph.json`` for the notes concept map.

Reads what the notes project already maintains, so the map owns no source of
truth of its own:

  notes/PROGRESSION.md    the ``# progression-map`` edge list, the
                          ``# stable-anchors`` block, and ``# site-exclude``
                          (sections that stay in the book but off the website)
  notes/main.tex          the \\include order (reading order, and whether a
                          section is front matter, a chapter, or an appendix)
  notes/sections/*.tex    the shipped ``\\chapter{...}`` title
  notes/sections/*.md     the sidecar's ``## Purpose`` summary and its optional
                          ``videos:`` / ``external:`` front-matter blocks

Deliberately dependency-free. The only front-matter keys consumed are two flat
lists of scalar pairs, which the small parser below handles, so CI needs no pip
install.

Idempotent: the same inputs produce byte-identical output.

Run:  python3 scripts/notes_site_data.py     (or ``just notes-data``)
"""

from __future__ import annotations

import json
import re
import sys
from pathlib import Path

ROOT = Path(__file__).resolve().parent.parent
NOTES = ROOT / "notes"
PROGRESSION = NOTES / "PROGRESSION.md"
MAIN_TEX = NOTES / "main.tex"
SECTIONS = NOTES / "sections"
OUT = NOTES / "site" / "data" / "graph.json"

# The committed book PDF, sitting beside index.html (see `just notes-pdf`).
PDF_NAME = "agentic-development-notes.pdf"

INCLUDE_RE = re.compile(r"\\(?:include|input)\{sections/([A-Za-z0-9_-]+)\}")
CHAPTER_RE = re.compile(r"\\chapter\*?\{(.+?)\}", re.DOTALL)
EDGE_RE = re.compile(r"^\s*([A-Za-z0-9_-]+)\s*->\s*([A-Za-z0-9_-]+)\s*(?:#\s*(.*))?$")
FENCE_RE = re.compile(r"```[a-zA-Z]*\n(.*?)```", re.DOTALL)
FRONTMATTER_RE = re.compile(r"\A---\n(.*?)\n---\n", re.DOTALL)
PURPOSE_RE = re.compile(r"^##\s+Purpose\b", re.IGNORECASE)


# --------------------------------------------------------------------------
# PROGRESSION.md — the declared chapter DAG
# --------------------------------------------------------------------------

def fenced_block(text: str, marker: str) -> list[str]:
    """Lines of the fenced block whose first non-empty line is ``marker``."""
    for block in FENCE_RE.findall(text):
        lines = block.splitlines()
        head = next((ln.strip() for ln in lines if ln.strip()), "")
        if head == marker:
            return lines
    return []


def parse_edges(lines: list[str]) -> list[dict]:
    """``parent -> child   # why`` lines into edge records."""
    edges = []
    for line in lines:
        stripped = line.strip()
        if not stripped or stripped.startswith("#"):
            continue
        m = EDGE_RE.match(line)
        if m:
            edges.append({
                "source": m.group(1),
                "target": m.group(2),
                "note": (m.group(3) or "").strip(),
            })
    return edges


def parse_names(lines: list[str]) -> list[str]:
    """Bare section stems from a block, ignoring comments and blanks."""
    return [ln.strip() for ln in lines if ln.strip() and not ln.strip().startswith("#")]


# --------------------------------------------------------------------------
# main.tex — reading order and document part
# --------------------------------------------------------------------------

def read_order(text: str) -> list[tuple[str, str]]:
    """``[(stem, part)]`` in \\include order; part is front | main | appendix."""
    order: list[tuple[str, str]] = []
    part = "front"
    for line in text.splitlines():
        stripped = line.lstrip()
        if stripped.startswith("%"):
            continue
        if stripped.startswith("\\frontmatter"):
            part = "front"
            continue
        if stripped.startswith("\\mainmatter"):
            part = "main"
            continue
        if stripped.startswith("\\appendix"):
            part = "appendix"
            continue
        m = INCLUDE_RE.search(line)
        if m:
            order.append((m.group(1), part))
    return order


# --------------------------------------------------------------------------
# sections/*.tex and sections/*.md — title, summary, videos
# --------------------------------------------------------------------------

def tex_to_text(s: str) -> str:
    """Flatten a LaTeX title into plain text."""
    s = re.sub(r"\\[a-zA-Z]+\*?\{([^{}]*)\}", r"\1", s)  # \emph{x} -> x
    s = re.sub(r"\\[a-zA-Z]+", "", s)                    # stray macros
    s = s.replace("~", " ").replace("---", "-").replace("--", "-")
    s = s.replace("{", "").replace("}", "").replace("\\&", "&")
    return re.sub(r"\s+", " ", s).strip()


def chapter_title(stem: str) -> str:
    """The shipped ``\\chapter{...}`` title; the stem is only a fallback."""
    path = SECTIONS / f"{stem}.tex"
    if path.exists():
        m = CHAPTER_RE.search(path.read_text(encoding="utf-8"))
        if m:
            return tex_to_text(m.group(1))
    return stem.replace("_", " ").title()


def split_frontmatter(text: str) -> tuple[str, str]:
    """``(frontmatter, body)``; frontmatter is empty when there is none."""
    m = FRONTMATTER_RE.match(text)
    return (m.group(1), text[m.end():]) if m else ("", text)


def purpose(body: str) -> str:
    """The sidecar's ``## Purpose`` paragraph, as one line."""
    out: list[str] = []
    collecting = False
    for line in body.splitlines():
        if PURPOSE_RE.match(line):
            collecting = True
            continue
        if collecting:
            if line.startswith("#") or line.lstrip().startswith("<!--"):
                break
            out.append(line.strip())
    return re.sub(r"\s+", " ", " ".join(out)).strip()


def _list_block(frontmatter: str, key: str) -> list[str]:
    """The indented lines belonging to a top-level ``key:`` list."""
    out: list[str] = []
    inside = False
    for raw in frontmatter.splitlines():
        if raw[:1] not in (" ", "\t") and raw.strip():
            inside = raw.strip().rstrip().startswith(f"{key}:")
            continue
        if inside:
            out.append(raw)
    return out


def parse_video_list(frontmatter: str, key: str) -> list[dict]:
    """Parse a ``key:`` list of video entries.

    Recognized fields: ``title`` and ``url`` (both required), plus ``source``
    and ``source_url`` for material we did not make, which the site groups and
    credits by creator.

    Hand-rolled on purpose: these are the only front-matter keys the site
    reads, and two flat lists of scalars do not justify a YAML dependency.
    """
    entries: list[dict] = []
    current: dict | None = None
    for raw in _list_block(frontmatter, key):
        line = raw.strip()
        if not line or line.startswith("#"):
            continue
        if line.startswith("- "):
            if current:
                entries.append(current)
            current = {}
            line = line[2:].strip()
        if current is None:
            continue
        m = re.match(r"^(title|url|source_url|source):\s*(.+?)$", line)
        if m:
            current[m.group(1)] = m.group(2).strip().strip("\"'")
    if current:
        entries.append(current)

    out = []
    for e in entries:
        if e.get("title") and e.get("url"):
            item = {"title": e["title"], "url": e["url"]}
            for field in ("source", "source_url"):
                if e.get(field):
                    item[field] = e[field]
            out.append(item)
    return out


# --------------------------------------------------------------------------

def main() -> int:
    if not PROGRESSION.exists() or not MAIN_TEX.exists():
        print("error: notes/ not found — run this from the repo root", file=sys.stderr)
        return 1

    prog = PROGRESSION.read_text(encoding="utf-8")
    edges = parse_edges(fenced_block(prog, "# progression-map"))
    anchors = set(parse_names(fenced_block(prog, "# stable-anchors")))
    excluded = set(parse_names(fenced_block(prog, "# site-exclude")))

    order = read_order(MAIN_TEX.read_text(encoding="utf-8"))
    if not order:
        print("error: no \\include{sections/...} lines in main.tex", file=sys.stderr)
        return 1
    known = {stem for stem, _ in order}

    # An edge naming a section main.tex does not include is a real
    # inconsistency between PROGRESSION.md and the book; say so rather than
    # emitting a node the reader can never reach.
    for edge in edges:
        for end in (edge["source"], edge["target"]):
            if end not in known:
                print(
                    f"warning: progression-map names '{end}', "
                    "which main.tex does not \\include",
                    file=sys.stderr,
                )
    edges = [e for e in edges if e["source"] in known and e["target"] in known]
    linked = {e["source"] for e in edges} | {e["target"] for e in edges}

    nodes = []
    chapter_no = 0
    for position, (stem, part) in enumerate(order, start=1):
        if part == "main":
            chapter_no += 1

        md_path = SECTIONS / f"{stem}.md"
        frontmatter, body = ("", "")
        if md_path.exists():
            frontmatter, body = split_frontmatter(md_path.read_text(encoding="utf-8"))

        nodes.append({
            "id": stem,
            "title": chapter_title(stem),
            "order": position,
            "part": part,
            "number": chapter_no if part == "main" else None,
            "summary": purpose(body),
            "anchored": stem in anchors,
            # Off the dependency chain (appendices): still in the reading
            # order, just not a node anything depends on.
            "offmap": stem not in linked,
            # Declared in PROGRESSION.md's `# site-exclude`. Such a section
            # stays in this file, so the record matches the book, but every
            # page of the website skips it.
            "on_site": stem not in excluded,
            "videos": parse_video_list(frontmatter, "videos"),
            "external": parse_video_list(frontmatter, "external"),
        })

    OUT.parent.mkdir(parents=True, exist_ok=True)
    payload = {"pdf": PDF_NAME, "nodes": nodes, "edges": edges}
    OUT.write_text(json.dumps(payload, indent=2) + "\n", encoding="utf-8")
    print(f"wrote {OUT.relative_to(ROOT)} ({len(nodes)} nodes, {len(edges)} edges)")
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
