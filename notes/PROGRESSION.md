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

The optional YAML front matter is read by the notes website (`scripts/notes_site_data.py`),
which attaches each chapter's videos to its node in the concept map. Two lists, kept apart on
purpose: `videos` is our own material (rendered under **Videos**), `external` is a curated list
of pertinent material we did **not** make (rendered under **Related viewing**). Both are
optional, and a chapter may carry any number of entries in either.

Attribution for `external` entries is the point of the split, so give every one a `source`, and
a `source_url` pointing at the creator's own channel or page wherever you can. The site groups
consecutive entries sharing a `source` and prints that credit **once, above the group**, linked:
one clear acknowledgment reads as real credit where the same name repeated in small type under
seven titles reads as noise. Nothing is embedded; every link leaves for the creator's page, so
the view is theirs. A standing note under the list records that the material is linked rather
than hosted, carries its own terms rather than this book's, and that inclusion is our
recommendation and not the creator's endorsement.

```markdown
---
videos:
  - title: <our video's title>
    url: https://www.youtube.com/watch?v=...
external:
  - title: <someone else's video>
    url: https://...
    source: <creator or channel — credited above their group>
    source_url: <link to their channel; optional but strongly preferred>
---

# <Section> — scratch

> Scratch/ideas only. The shipped prose lives in `<name>.tex`. Not part of the LaTeX build.

## Purpose
What this section must accomplish for the reader.
The website also uses this paragraph as the chapter's summary in the concept map.

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
# Linear backbone (reading order), minus the off-map appendices.
how_we_got_here      -> agentic_paradigm   # the history motivates the vocabulary it hands off to
agentic_paradigm     -> agentic_rig
agentic_rig          -> context_engineering
context_engineering  -> agentic_coding
agentic_coding       -> agent_loop
agent_loop           -> evaluation
evaluation           -> retrieval
retrieval            -> orchestration
orchestration        -> evolutionary_frameworks   # evolution = the GES loop (Def.~GenEvalSel) + a mutation operator
# Non-obvious convergence edges — what the evolutionary capstone reaches back to.
# (The backbone edge from orchestration above is the fourth such reach-back; it is
#  declared once, up there, rather than repeated here.)
agentic_paradigm     -> evolutionary_frameworks   # the two spines are introduced here and converge at the capstone
context_engineering  -> evolutionary_frameworks   # Spine 2: context engineering feeds the LLM mutation operator
evaluation           -> evolutionary_frameworks   # Spine 1: the eval harness becomes the fitness function
```

### Excluded from the website

A section named in the `# site-exclude` block below is dropped from the website entirely: it
appears neither as a node on the concept map nor in the chapter list on the landing page. It
remains fully part of the book, compiled in its place in the reading order. Use this for
sections that orient the reader rather than teach a concept. An **empty** block (or no block at
all) puts every section on the site.

```
# site-exclude
preface
```

## Stable anchors

Some chapters have been carefully reviewed and are trusted as **ground truth**; loose,
still-evolving chapters must not drag them out of alignment. The `# stable-anchors` block below
names those chapters by section stem. `/progression` treats an anchored sidecar as authoritative:
when a cross-section defect spans an anchored and a non-anchored section, the fix is proposed on
the **non-anchored** side, and an anchored sidecar is only ever *flagged* in the report, never
offered for edit. The trusted chapters become a fixed point that loose chapters harmonize toward,
not the reverse.

Edit this list as chapters harden (or soften). An **empty** block disables the protection and
restores uniform treatment. Anchoring binds the `.md` spine `/progression` audits; it does not by
itself freeze the `.tex` prose (that is always safe from `/progression`, which never touches the
`.tex`), but it does stop a loose sidecar from seeding a later `/md2tex` that would.

```
# stable-anchors
how_we_got_here
agentic_paradigm
evaluation
```

### Off-map files
- **`abstract`** — front-matter summary of the whole note, not a node in the dependency chain.
- **`preface`** — front matter: it orients the reader to the book rather than teaching a concept. Named in `# site-exclude` above, so the website omits it entirely; it remains in the book and in the reading order.

Formerly off-map, now on the backbone:
- **`how_we_got_here`** — the opening chapter: a high-level, cited history of the field (word2vec → Transformer → pretraining → scale → RAG → agents). It was originally treated as a pure prologue that only *forward-references* the ladder chapters. It now carries a backbone edge into `agentic_paradigm`: the history is what motivates the vocabulary that chapter establishes, so a reader arrives at the paradigm having been given the reason it exists. It remains a stable anchor.
- **`rig_reference`** — appendix reference manual for the Claude Code CLI (leaf off `agentic_rig`); a deliberate product-surface snapshot, outside the conceptual dependency chain.
- **`cowork_reference`** — concept-level appendix on delegated agentic environments (Cowork, Codex); a leaf that draws on the capability ladder, the specify–review loop (`agentic_coding`), and Spine 1 (evaluation-becomes-fitness), but adds no new dependency the chapters rely on. A dated product-surface snapshot like `rig_reference`.

## Git

Sidecars are **tracked** — valuable design history, not disposable scratch.
