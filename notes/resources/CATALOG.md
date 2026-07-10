# Local arXiv Library — Catalog

Annotated registry of papers ingested under `resources/` via the `get-arxiv` skill. This is the
**triage layer** of a three-tier navigation scheme that grounds the authoring agent's ideation
in expert-curated articles:

1. **Triage — this file (`CATALOG.md`).** Scan the table to pick the relevant paper(s) by topic,
   tags, and role, without opening anything else.
2. **Synopsis — each paper's `SYNOPSIS.md`.** Read one paper's reading note for the gist, key
   claims, and "Citable as" pointers into `sections/*.tex`.
3. **Deep dive — the paper folder.** Open the actual `.tex`/figures (`00README.json` names the
   top-level file) only when you need the detail.

**Agents: start here.** Triage from this table first; open a `SYNOPSIS.md` only for the papers
that survive triage; crack a folder only for a deep dive. Do **not** read every synopsis to decide
relevance — that is what this table is for. Cite a paper from the manuscript by adding it to
`references.bib` and using `\cite{}`.

Each paper lives in its own `arXiv-<id>v<ver>/` mini-project (original top-level `.tex` + `.bbl`,
figures, a `justfile`, `CLAUDE.md` build notes, and a `SYNOPSIS.md`).

> The paper folders are gitignored (large/binary); only this catalog and [`WATCH.md`](WATCH.md)
> are tracked, so the registry travels with the repo while the sources stay local. `just resources`
> lists what is actually on disk right now.
>
> `CATALOG.md` is what the library **has**; [`WATCH.md`](WATCH.md) is what it **wants** — the
> `/check-arxiv` profile that suggests relevant new papers not yet ingested.

## Papers (0)

| Folder | arXiv | Title | Year | Tags | Role in the manuscript |
| ------ | ----- | ----- | ---- | ---- | ---------------------- |
| _(none yet — ingest one with the `get-arxiv` skill)_ | | | | | |

## Maintenance
- `get-arxiv` adds a row here on ingest; keep the table curated and sorted as it grows.
- **Tags** are the source of triage. They live in each paper's `SYNOPSIS.md` YAML header
  (`tags:`) and are surfaced here as a column — the header is the source of truth, this column is
  the view. Reuse existing tag words rather than coining near-duplicates.
- Keep rows lean: title, tags, and a one-line role. Depth lives once, in each `SYNOPSIS.md`.
- Bump the `## Papers (N)` count on each ingest.
