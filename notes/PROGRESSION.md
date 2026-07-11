# Section Progression: from sidecar scratch to shipped prose

> How each section is authored across its lifecycle, using a paired `.tex` / `.md`
> "sidecar," and how concepts move between the two. The folder layout lives in `CLAUDE.md`.
> This file is read by the `md2tex`, `tex2md`, and `progression` skills.

This project separates **thinking** from **authoring** by pairing every LaTeX section file
with a same-named Markdown *sidecar*, and treats a section as something that **progresses**
through stages rather than something written once.

## The pairing

| File         | Register / layer | Role                                                              |
| ------------ | ---------------- | ----------------------------------------------------------------- |
| `<name>.tex` | Authoring        | The polished prose that ships in the compiled PDF.                |
| `<name>.md`  | Thinking         | The design log: scratch, ideas, the conceptual spine, decisions.  |

The sidecar is **never** `\input` by `main.tex`, so it is invisible to the LaTeX build and can
never leak into the PDF. Both files are tracked in git.

## EVOLVE-BLOCK markers mean different things per register

This is an *evolutionary* template: a branch edits only between EVOLVE-BLOCK markers. The
markers serve a different purpose in each register:

- **`.tex` — editable region.** `% EVOLVE-BLOCK-START … % EVOLVE-BLOCK-END` bounds the prose a
  branch may rewrite. Everything outside (the `\section`/`\label`, and the `templates/` +
  `main.tex` plumbing) is fixed scaffolding.
- **`.md` — shareable spine.** `<!-- EVOLVE-BLOCK-START --> … <!-- EVOLVE-BLOCK-END -->` bounds
  the **conceptual spine** that the composer exports to the reviewer "direction" view and to
  `elites/`. The *rest* of the sidecar (Purpose, Open questions, Notes — the private scratch) is
  still yours to edit freely; it simply is not shared outward. Put settled claims, theorem
  statements, proof strategies, and concrete promising directions **inside** the block; keep
  half-formed scratch, rejected alternatives, and open questions **outside** it.

## The progression (and the source-of-truth flip)

Which file *leads* changes as the work matures.

```
   early                                                          late
   |  think in the .md  ──►  harmonize concepts  ──►  author into the .tex  ──► push in the .tex
   |  (scratch, ideas)       (the conceptual spine)    (/md2tex realizes)        (/tex2md feeds back)
   |  .md LEADS ───────────────────────────────────────────────► .tex LEADS
```

1. **Think in the `.md` first.** Rough out purpose, key points, open questions before prose.
2. **Harmonize the concepts.** The sidecar settles into a coherent spine (inside the block).
3. **Realize into the `.tex` (`/md2tex`).** Translate *settled* spine into polished prose.
4. **Push happens in the `.tex` (`/tex2md`).** Sharpen in prose; feed concept changes back so
   the spine stays honest.

Either move is a legitimate evolutionary step: sometimes the best iteration crystallizes an idea
into `.tex` prose; sometimes it evolves the `.md` spine (a theorem sketch, a promising direction)
*before* committing to prose. Tell `step.py` which with `--register tex|md|both`.

## What lives where (exclusive zones + the shared spine)

- **`.md`-only (never copy into the `.tex`):** scratch, rejected alternatives, open questions,
  design rationale, author-preference notes, pointers back into the prose.
- **`.tex`-only (never overwrite from the `.md`):** the exact published wording and voice,
  citations, and the actual figure/table/math LaTeX.
- **Shared spine (the only thing that syncs, and the only `.md` content shared outward):** the
  concepts, claims, framing, theorem statements/strategies, and order of argument.

`/md2tex` **realizes** (settled spine → polished prose, ignoring the `.md`'s exclusive zones).
`/tex2md` **distills** (prose-led concept change → updated spine + decision log; never pastes
prose verbatim). Both are surgical, additive, and ask before writing.

## Sidecar skeleton

```markdown
# <Section> — scratch

> Scratch/ideas only. The shipped prose lives in `<name>.tex`. Not part of the LaTeX build.

## Purpose
What this section must accomplish for the reader.

<!-- EVOLVE-BLOCK-START -->
## Key points / spine
-

## Decisions
-
<!-- EVOLVE-BLOCK-END -->

## Open questions
-

## Notes & references
-
```

## Tooling

- **`/md2tex`** — realize settled sidecar concepts into shipped `.tex` prose (one pair).
- **`/tex2md`** — feed prose-led concept changes back into the sidecar (one pair).
- **`/progression`** — audit conceptual coherence of the sidecars *across* sections.
- **`/format-tex`, `/format-md`** — keep each register's source tidy and diff-friendly.

## Progression map

Default reading order is the `\input{sections/<name>}` sequence in `main.tex`. Declared as a
`parent -> child` edge list for `/progression`; node names match the section file stems.

```
# progression-map
introduction -> main_result    # the introduction motivates and forward-points to the theorem
main_result  -> conclusion     # the conclusion recaps the result and names future work
```

### Off-map files
- **`abstract`** — front-matter summary of the whole note, not a node in the dependency chain.
- **`rig_reference`** — appendix reference manual for the Claude Code CLI (leaf off `agentic_rig`); a deliberate product-surface snapshot, outside the conceptual dependency chain.

## Git

Sidecars are **tracked** — valuable design history, not disposable scratch.
