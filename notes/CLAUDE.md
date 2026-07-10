# nano-evolve (LaTeX paper authoring)

You are one branch (or in solo mode, the only worker) of an evolutionary
search that **authors a mathematical paper**. The evolving artifact is the
sectionized LaTeX manuscript at the repo root. This file is your only spec.
Follow it carefully and persistently.

## Problem

> **EDIT THIS SECTION FOR YOUR PAPER.** Leave the rest of the file alone
> unless you have a specific reason to change it.

This is not a research paper — it is the **course notes** (a `\documentclass{book}`)
for a graduate course, *Agentic Development in Research → Agentic Evolutionary
Frameworks*. `main.tex` is the original hand-written manuscript (moved in
place, not wrapped); the ten chapters under `sections/` (preface,
agentic_paradigm, agentic_rig,
context_engineering, agentic_coding, agent_loop, evaluation, retrieval,
orchestration, evolutionary_frameworks) are the evolving artifact. This
project was **adopted** from a pre-existing hand-written manuscript (ADR 0004
in the engine repo), so every `sections/<name>.md` sidecar started as an empty
stub — there is no pre-existing spine to read; you are originating it as you
go, chapter by chapter.

Your goal is to **raise each chapter's quality and pedagogical clarity** as
judged by a panel of expert-persona reviewers (see "Evaluation" below) —
rigor of the technical content, clarity for a cross-disciplinary graduate
audience with no assumed background in agents, novelty/currency relative to
the field, and honest self-consistency (a "referee" check that claims made
are actually backed up in-chapter). This course's own top-level `CLAUDE.md`,
`PROGRESSION.md`, and `DECISIONS.md` (one directory up) are the authoritative
record of course scope and pedagogical decisions — treat them as background
context, not something this loop edits.

## Artifact: the manuscript and its sidecars

The manuscript is a set of section **pairs** under `sections/`:

- `sections/<name>.tex` — the shipped, polished prose (the only thing the PDF
  sees), assembled by `main.tex` via `\input`.
- `sections/<name>.md` — the *sidecar*: scratch, the conceptual spine, theorem
  sketches, promising directions, and a decision log. Never `\input`; invisible
  to the build.

`templates/` (document class, preamble, macros) and `references.bib` are shared
infrastructure. Write prose to the **house style guide**: `resources/STYLE.md`
in this project if present, else the engine's copy (the path in `.nel-engine`
plus `/resources/STYLE.md`); the engine's `resources/exemplars/` holds gold
section pairs — read one before writing your first. `./nel resources` lists
both layers. Read **`PROGRESSION.md`** — it defines the `.tex ↔ .md` sidecar
convention, the source-of-truth flip, and the exclusive zones. The key rule:

- In `.tex`, `% EVOLVE-BLOCK-START … % EVOLVE-BLOCK-END` bounds the prose you may
  edit; everything outside is fixed scaffolding.
- In `.md`, `<!-- EVOLVE-BLOCK-START --> … <!-- EVOLVE-BLOCK-END -->` bounds the
  **shareable spine** the evaluator and the archive export outward. The rest of
  the sidecar is private scratch you may still freely edit.

## Mode

- **Parallel mode** — `run.sh` launched you. `BRANCH_ID` is `1..N`.
  Your strategy bias is on that line of `prompts/strategies.txt`.
  the shared archive (the coordination substrate) is where you see what your
  siblings have done; `NEL_LOG_DIR` is a shared human-readable mirror.
- **Solo mode** — `BRANCH_ID` is unset (or `"solo"`). You're the only
  worker. There are no sibling branches, no `frontier.md`, no
  `next-direction.md`. The "diversity rules" and `elites/`
  cross-pollination sections do not apply.

## Loop

On each iteration, do exactly the following:

1. **Identify yourself.** In parallel mode, read `BRANCH_ID` and your strategy
   bias from line `BRANCH_ID` of `prompts/strategies.txt`. Solo: a no-op.

2. **Read state.**
   - If `${NEL_LOG_DIR}/state-${BRANCH_ID}.json` exists, read it
     (`{"best": <score>, "attempts": <int>}`). If `attempts >= MAX_ATTEMPTS`,
     stop now — a resumed run that has exhausted its budget.
   - **Read your latest reviewer feedback** at
     `${NEL_LOG_DIR}/feedback/branch-${BRANCH_ID}/latest.md` (solo:
     `./log/feedback/branch-solo/latest.md`). This is the heart of the loop —
     the actionable critique you are responding to. Also skim the tail of your
     branch log `${NEL_LOG_DIR}/branch-${BRANCH_ID}.md`.
   - In parallel mode: skim `${NEL_LOG_DIR}/by-approach/*.md` for what
     siblings have tried, and query the shared archive (the coordination
     substrate) for the strongest candidates across branches:
     `./nel archive best` and `./nel archive show <candidate_id>`
     for a sibling's manuscript + feedback.
   - If `${NEL_LOG_DIR}/next-direction.md` addresses your branch, treat it
     as a hint, not a command.
   - **Ground your ideation.** Consult `resources/CATALOG.md` and, for relevant
     papers, their `SYNOPSIS.md`, to pull in techniques, framings, and
     citations. Use `get-arxiv <id>` to ingest a new paper if you need one.
   - Read the current section pair(s) you intend to touch.

3. **Propose — choose your move.** Either is a legitimate step:
   - **Evolve the `.tex` prose** (crystallize/sharpen) — edit between the
     `% EVOLVE-BLOCK` markers. Use `/md2tex` to realize a settled sidecar spine
     into prose; use `/tex2md` to feed prose-led concept changes back.
   - **Evolve the `.md` spine** (a theorem sketch, a promising direction,
     restructured argument) — edit within the `<!-- EVOLVE-BLOCK -->` region.
     Run `/progression` to keep the cross-section spine coherent.

   Keep the manuscript compiling at every step. Edit only within EVOLVE-BLOCK
   markers in the section files; do not touch `templates/` or the `main.tex`
   plumbing (adding one `\input` line + a `progression-map` edge for a *new*
   section is the only allowed structural edit).

4. **Evaluate and log.** Run:

   ```
   ./nel step "<2-3 line rationale>" --approach <kebab-case-name> [--register tex|md|both]
   ```

   `./nel step` runs the evaluator (which composes the manuscript + spine, compiles
   it, and gathers the reviewer panel), appends a structured entry to your
   branch log, files a one-liner under `by-approach/`, writes the full feedback
   under `feedback/branch-${BRANCH_ID}/`, **records the attempt in the shared
   archive** (candidate + lineage + provenance; a re-run of an unchanged
   manuscript is a cache hit that skips the panel), commits on improvement, and
   prints a JSON status line. Read that line — you'll need `attempt`, `score`,
   `new_best`, `cached`, and `feedback_path`. Then **open the feedback file** and
   let it drive your next proposal.
   - To credit a sibling you seeded from, pass `--parent <candidate_id>` (its id
     from `./nel archive best`); to record what grounded the proposal, pass
     `--context paper:<arxiv-id>` / `--context elite:<branch>` (repeatable).

5. **Stop** if any of:
   - `score >= target_score` (defined in `project.toml`, `[project]`)
   - `attempt >= max_attempts` (defined in `project.toml`, `[project]`)
   - a `STOP` file exists at the repo root

   Otherwise loop back to step 2.

## Evaluation

`evaluate.py` does not return a bare number. It composes the manuscript and the
sidecar spine, runs a **compile gate** (a manuscript that does not build scores
0 with the LaTeX error as feedback — fix that first), then a **quantitative
metrics gate** (undefined references/citations, duplicate labels, TODO markers
left in shipped prose — the gated list is `[evaluation.metrics]` in
`project.toml`; a violation scores 0 with the metrics report as feedback, and
the panel never sees the draft — fix those next), then dispatches a panel of
expert-persona reviewers (`prompts/reviewers/*.md`) to external backends for
**actionable, textual feedback**. The metrics report is always prepended to the
panel feedback, so watch it even when you pass. Each reviewer scores realized prose
(`prose_score`) and the promise of your spine (`direction_score`) separately, so
a sidecar-led step that sketches a strong direction is credited even before it
is prose. The `score` is the mean reviewer rubric — a light signal for
bookkeeping; the **feedback text is the point**. Respond to it specifically.

## Diversity rules (parallel mode only)

You are competing with sibling branches. Convergence is the failure mode. Before
each proposal, ask: *has another branch already tried this?* Read
`by-approach/*.md`. If yes, pick a different angle within your bias.

If you keep proposing variants of the same idea, run `step.py` once with the
rationale `"exhausted local neighborhood"` and pivot to a different sub-family.

### Seeding from sibling elites

When your local family stalls, query the shared archive — `./nel archive best`
to find the strongest sibling candidates, then `./nel archive show
<candidate_id>` to read one's manuscript and feedback — and *adapt* an idea to
your bias (record the debt with `--parent <candidate_id>` on your next
`step.py`). Do not blind-copy; the point of multiple branches is divergent
exploration. The **archive is the only sanctioned cross-branch channel**; do not
read or write other workers' checkouts.

## What not to do

- Do not edit outside the EVOLVE-BLOCK regions of `sections/*.{tex,md}` (except
  adding a section slot in `main.tex` + `PROGRESSION.md`). `step.py` handles all
  log writes — do not open `branch-N.md`, `by-approach/*.md`, or `feedback/`
  for writing yourself.
- Do not modify `templates/`, the preamble, or the EVOLVE-BLOCK markers.
- Do not modify the evaluator, the reviewer rubrics, or `target_score` /
  `max_attempts` (in `project.toml`) to make your score look better. These are the problem
  definition. Do not pad the spine with speculative sketches to inflate
  `direction_score` — the referee persona checks whether promises get realized.
- Do not let `.md` scratch leak into the `.tex` (respect the exclusive zones in
  `PROGRESSION.md`).
- Do not call out to the network except via the sanctioned skills
  (`get-arxiv`/`check-arxiv`) for the resource library.
- Do not stop early because you "don't see an obvious improvement." Log the
  attempt with `step.py` and try a different direction. The budget exists to
  outlast local plateaus.
