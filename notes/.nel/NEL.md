# nel — the authoring protocol

> **Engine-owned; do not edit.** This file is vendored from the engine to
> `.nel/NEL.md` and **overwritten by `scaffold.py update`** — that is how protocol
> fixes reach an existing project. Your paper's own instructions (the problem
> statement, your conventions) live in the project's `CLAUDE.md`, which imports
> this file with `@.nel/NEL.md` and is never overwritten. If you need to change
> the protocol for one paper, override it in `CLAUDE.md` *after* the import rather
> than editing here, where the next update will discard it.

You **author a mathematical paper** under an iterated review loop. The evolving
artifact is the sectionized LaTeX manuscript at the repo root, and the cycle is:
propose a change, evaluate it, read the critique, propose the next one.

This file is your spec **when you are running that loop unattended** — launched
by a human who started you and walked away. Follow it carefully
and persistently in that mode. When a human is sitting with you and asks how the
draft is doing, that is *not* the loop: use the **`critique`** skill, which reads
the manuscript and reports findings without recording an attempt or committing
anything.

One thing to be clear about, because the machinery's vocabulary can mislead:
this is not a search over a population. There is one manuscript, it is never
reverted to an earlier draft, and every version that clears the compile and
metrics gates is checkpointed. Improve the paper. Do not try to move a score.

**What the paper is about** — the problem, the contribution you are driving
toward — is stated under `## Problem` in the project's `CLAUDE.md`. Read it
first; this file tells you only *how* to work, never *what* to write.

## Artifact: the manuscript and its sidecars

The manuscript is a set of section **pairs** under `sections/`:

- `sections/<name>.tex` — the shipped, polished prose (the only thing the PDF
  sees), assembled by `main.tex` via `\input`.
- `sections/<name>.concepts.md` — the *sidecar*: scratch, the conceptual
  spine, theorem sketches, promising directions, and a decision log. Never
  `\input`; invisible to the build. (The name is typed —
  subject.register.format — so sibling registers can appear later; a bare
  `<name>.md` is the legacy spelling and still works. "The `.md`" below means
  the sidecar, whichever spelling this project uses.)

`templates/` (document class, preamble, macros) and `references.bib` are shared
infrastructure. Write prose to the **house style guide**: get its effective path
with `./nel resources --path STYLE.md` (your project's copy if it has one, else
the engine's — don't build the path by hand). `./nel resources --path exemplars`
gives you gold section pairs — read one before writing your first, and
`./nel resources` lists both layers with shadowing marked. Read
**`PROGRESSION.md`** — it defines the `.tex ↔ .md` sidecar
convention, the source-of-truth flip, and the exclusive zones. The key rule:

- In `.tex`, `% EVOLVE-BLOCK-START … % EVOLVE-BLOCK-END` bounds the prose you may
  edit; everything outside is fixed scaffolding.
- In `.md`, `<!-- EVOLVE-BLOCK-START --> … <!-- EVOLVE-BLOCK-END -->` bounds the
  **shareable spine** the evaluator and the archive export outward. The rest of
  the sidecar is private scratch you may still freely edit.

## Mode

The axis that matters is **whether a human is watching**:

- **Unattended** — you were launched to run the loop below until a stop
  condition, and nobody is reading each step as it happens.
- **Attended** — a human is driving and asking for one thing at a time. Do not
  run the loop; do what they asked and stop. To report on the draft, use the
  `critique` skill — it evaluates without recording an attempt or committing, so
  the decision about what to change, and whether to keep it, stays theirs.

You are a single worker. `BRANCH_ID` is normally unset (or `"solo"`), and
`NEL_LOG_DIR` defaults to `.nel/log`. Both exist so that several workers *could*
share one archive and one log mirror, but the engine ships no multi-worker
launcher today — so there are no sibling branches to read and no cross-branch
coordination to do.

## Loop (unattended)

On each iteration, do exactly the following:

1. **Pick your bias.** `.nel/prompts/strategies.txt` is a catalog of editorial
   angles (rigor-first, clarity-first, …). Choose one that fits what the
   feedback is asking for, and name it in your `--approach`.

2. **Read state.**
   - If `${NEL_LOG_DIR}/state-${BRANCH_ID}.json` exists, read it
     (`{"attempts": <int>}`). If `attempts >= MAX_ATTEMPTS`, stop now — a resumed
     run that has exhausted its budget.
   - **Read your latest reviewer feedback** at
     `./.nel/log/feedback/branch-solo/latest.md`. This is the heart of the loop —
     the actionable critique you are responding to. Also skim the tail of your
     branch log `${NEL_LOG_DIR}/branch-${BRANCH_ID}.md`.
   - Skim `${NEL_LOG_DIR}/by-approach/*.md` for angles already tried, so you do
     not re-run one that did not move the paper. `./nel archive top` and
     `./nel archive show <attempt_id>` read the same history from the archive.
   - **Ground your ideation.** Consult `resources/CATALOG.md` and, for relevant
     papers, their `SYNOPSIS.md`, to pull in techniques, framings, and
     citations. Use `get-arxiv <id>` to ingest a new paper if you need one.
   - Read the current section pair(s) you intend to touch.

3. **Propose — choose your move.** Either is a legitimate step:
   - **Evolve the `.tex` prose** (crystallize/sharpen) — edit between the
     `% EVOLVE-BLOCK` markers. Use `/concepts2tex` to realize a settled sidecar spine
     into prose; use `/tex2concepts` to feed prose-led concept changes back.
   - **Evolve the `.md` spine** (a theorem sketch, a promising direction,
     restructured argument) — edit within the `<!-- EVOLVE-BLOCK -->` region.
     Run `/progression` to keep the cross-section spine coherent.

   Keep the manuscript compiling at every step. Edit only within EVOLVE-BLOCK
   markers in the section files; do not touch `templates/` or the `main.tex`
   plumbing (adding one `\input` line + a `progression-map` edge for a *new*
   section is the only allowed structural edit). To *see* the rendered result —
   figure layout, code-listing framing, page breaks — run `./nel build`, which
   writes a persistent `.nel/build/main.pdf` you can open; `./nel doctor --compile`
   only proves it builds and leaves no inspectable PDF.

4. **Evaluate and log.** Run:

   ```
   ./nel step "<2-3 line rationale>" --approach <kebab-case-name> [--register tex|md|both]
   ```

   `./nel step` runs the evaluator (which composes the manuscript + spine, compiles
   it, and gathers the reviewer panel), appends a structured entry to your
   branch log, files a one-liner under `by-approach/`, writes the full feedback
   under `feedback/branch-${BRANCH_ID}/`, **records the attempt in the shared
   archive** (attempt + lineage + provenance; a re-run of an unchanged
   manuscript is a cache hit that skips the panel), **commits whenever the draft
   clears the compile and metrics gates** (not only on a higher score — the
   manuscript is never reverted, so every valid draft is worth a checkpoint), and
   prints a JSON status line. Read that line — you'll need `attempt`, `score`,
   `cached`, and `feedback_path`. Then **open the feedback file** and
   let it drive your next proposal.
   - To credit an earlier draft you built on, pass `--parent <attempt_id>`
     (its id from `./nel archive top`); to record what grounded the proposal,
     pass `--context paper:<arxiv-id>` (repeatable).

5. **Stop** if any of:
   - `attempt >= max_attempts` (defined in `nel.toml`, `[project]`) — the run's
     budget, so an unattended launch terminates
   - a `STOP` file exists at `.nel/STOP` (or, pre-v3, the repo root)
   - **proof mode only** — the predicate closes: `./nel step` reports
     `"closed": true` *and* the last panel raised nothing you have not already
     addressed or consciously declined. A closed claim with rough prose is not
     done — polish until the panel goes quiet — but a closed claim plus a quiet
     panel is, regardless of how much budget remains.
   - the feedback has stopped telling you anything new: the last two panels
     raised no finding you have not already addressed or consciously declined.
     Say so in your final status and stop; burning the remaining budget on
     cosmetic edits makes the paper worse, not better.

   There is deliberately **no score threshold** to stop at (ADR 0010). The score
   is a mean of four uncalibrated 0–1 judgements that moves between runs on an
   unchanged draft; it is not a quantity you can aim at. Judge the *feedback*.

   Otherwise loop back to step 2.

## Evaluation

`evaluate.py` does not return a bare number. It composes the manuscript and the
sidecar spine, runs a **compile gate** (a manuscript that does not build scores
0 with the LaTeX error as feedback — fix that first), then a **quantitative
metrics gate** (undefined references/citations, duplicate labels, TODO markers
left in shipped prose — the gated list is `[evaluation.metrics]` in
`nel.toml`; a violation scores 0 with the metrics report as feedback, and
the panel never sees the draft — fix those next), then — in proof mode — the
project's **declared verifier** (see "Proof mode" below), then dispatches a
panel of expert-persona reviewers (`.nel/prompts/reviewers/*.md`) to external
backends for **actionable, textual feedback**. The metrics report is always prepended to the
panel feedback, so watch it even when you pass. Each reviewer scores realized prose
(`prose_score`) and the promise of your spine (`direction_score`) separately, so
a sidecar-led step that sketches a strong direction is credited even before it
is prose. The `score` is the mean reviewer rubric — a light signal for
bookkeeping; the **feedback text is the point**. Respond to it specifically.

## Proof mode (a declared verifier)

If `nel.toml` has an `[evaluation.verifier]` table, this paper carries a
**checkable claim** — a construction, a bound, an identity — and the project
ships a deterministic check for it (a script, a CAS call, a proof-assistant
build). That verifier is run inside every evaluation: exit 0 means **the claim
closes**, its output is prepended to your feedback, and the reviewers see its
verdict. `./nel step`'s status line gains `"closed": true|false` — that
predicate, not the score, is the fact the run is driving toward (ADR 0013).

Work differently in this mode:

- **Iterate on the claim through `./nel verify`.** It runs *only* the verifier —
  no compile, no panel, nothing recorded — and prints
  `{"closed": ..., "exit": ..., "report": ...}` in well under a second for a
  script-based check. Use it after every substantive edit to the construction or
  argument. Spend `./nel step` when the manuscript around the claim has moved,
  not to ask the verifier a question `./nel verify` answers for free.
- **Read the verifier report before the panel prose.** While the claim is open,
  the report says *what failed* — that is your next edit, and reviewer style
  notes can wait. `stage: "verifier-gate"` (a project that sets `gate = true`)
  means exactly this: the draft was rejected before the panel read it.
- **The stop condition is the predicate** (see step 5): closed claim + quiet
  panel. `max_attempts` remains the outer bound.
- **Never touch the verifier.** Its manifest entry and the script/toolchain it
  names are the problem definition, exactly like the rubrics — and both are
  hashed into `evaluator_version`, so editing them visibly forks the evaluation
  history. Do not weaken tolerances, special-case inputs, or reduce coverage to
  make the claim close. If you believe the verifier itself is wrong, write that
  in the sidecar and in your final status, and leave it for the human.
- `stage: "verifier-error"` means the check could not *run* (missing toolchain,
  timeout) — infrastructure, not a verdict. The draft still checkpoints; fix or
  report the environment rather than editing the manuscript in response.

## Don't circle

The failure mode of an unattended run is proposing variants of one idea until
the budget is gone. Before each proposal, check `by-approach/*.md` and
`./nel archive history` for angles you have already spent. If the last two
attempts were the same kind of move and the feedback did not shift, that line of
revision is exhausted — say so in your rationale and pivot to a different one
from `.nel/prompts/strategies.txt`.

`./nel archive top` and `./nel archive show <attempt_id>` let you re-read an
earlier draft that scored well and its feedback. Adapting an idea from a past
attempt is legitimate; record the debt with `--parent <attempt_id>`.

## What not to do

- Do not edit outside the EVOLVE-BLOCK regions of `sections/*.{tex,md}` (except
  adding a section slot in `main.tex` + `PROGRESSION.md`). `step.py` handles all
  log writes — do not open `branch-solo.md`, `by-approach/*.md`, or `feedback/`
  for writing yourself.
- Do not modify `templates/`, the preamble, or the EVOLVE-BLOCK markers.
- Do not modify the evaluator, the reviewer rubrics, `max_attempts`, or — in
  proof mode — the `[evaluation.verifier]` entry and the script it names. These
  are the problem definition, not variables you tune. Do not pad the spine with
  speculative sketches to inflate `direction_score` — the editor persona checks
  whether promises get realized.
- Do not let `.md` scratch leak into the `.tex` (respect the exclusive zones in
  `PROGRESSION.md`).
- Do not call out to the network except via the sanctioned skills
  (`get-arxiv`/`check-arxiv`) for the resource library.
- Do not stop early because you "don't see an obvious improvement." Log the
  attempt with `step.py` and try a different direction. The budget exists to
  outlast local plateaus.
