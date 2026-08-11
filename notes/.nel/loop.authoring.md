# The authoring loop

> **Engine-owned; do not edit.** Vendored to `.nel/loop.authoring.md` and
> overwritten by `scaffold.py update`. Read `.nel/NEL.md` first — it holds the
> artifact convention, the evaluation pipeline, and what not to touch. This file
> is only the loop.

This is the loop for a project with **no declared verifier**: there is no
checkable claim and no honest scalar. The reviewer panel is the only judge, and
what you are driving toward is prose that stops attracting criticism.

If `nel.toml` has an `[evaluation.verifier]` table, you are in the wrong file —
read `.nel/loop.proof.md` instead.

## The loop (unattended)

On each iteration, do exactly the following.

**1. Pick your bias.** `.nel/prompts/strategies.txt` is a catalog of editorial
angles (rigor-first, clarity-first, …). Choose one that fits what the feedback is
asking for, and name it in your `--approach`.

**2. Read state.**

- **Your latest reviewer feedback** at `.nel/log/feedback/branch-solo/latest.md`.
  This is the heart of the loop — the actionable critique you are responding to.
  Also skim the tail of your branch log `${NEL_LOG_DIR}/branch-${BRANCH_ID}.md`.
- `${NEL_LOG_DIR}/by-approach/*.md` for angles already tried, so you do not
  re-run one that did not move the paper. `./nel archive top` and
  `./nel archive show <attempt_id>` read the same history from the archive.
- **Ground your ideation.** Consult `resources/CATALOG.md` — resolve its path
  with `./nel resources --path CATALOG.md` — and, for relevant papers, their
  `SYNOPSIS.md`, to pull in techniques, framings and citations. Use `get-arxiv
  <id>` to ingest a new paper if you need one.
- The current section pair(s) you intend to touch.

**3. Propose.** Either is a legitimate step:

- **Evolve the `.tex` prose** — edit between the `% EVOLVE-BLOCK` markers. Use
  `/concepts2prose` to realize a settled sidecar spine into prose; use
  `/prose2concepts` to feed prose-led concept changes back.
- **Evolve the `.md` spine** — a restructured argument, a promising direction —
  inside the `<!-- EVOLVE-BLOCK -->` region. Run `/progression` to keep the
  cross-section spine coherent.

Keep the manuscript compiling at every step. To *see* the rendered result —
figure layout, page breaks — run `./nel build`, which writes a persistent
`.nel/build/main.pdf`; `./nel doctor --compile` only proves it builds.

If a sub-problem will not yield, `./nel consult "<question>"` before committing
to a move. It records nothing.

**4. Evaluate and log.**

```
./nel step "<2-3 line rationale>" --approach <kebab-case-name> [--register tex|md|both]
```

This runs the evaluator, appends to your branch log, files a one-liner under
`by-approach/`, writes the full feedback under `feedback/`, records the attempt
in the archive, **commits whenever the draft clears the compile and metrics
gates** (not only on a higher score — the manuscript is never reverted, so every
valid draft is worth a checkpoint), and prints a JSON status line. Read that
line — you need `attempt`, `score`, `cached`, `feedback_path` — then **open the
feedback file** and let it drive your next proposal.

To credit an earlier draft you built on, pass `--parent <attempt_id>`; to record
what grounded the proposal, pass `--context paper:<arxiv-id>` (repeatable).

**5. Stop** if any of:

- **you have run `./nel step` `max_attempts` times in THIS run.** Count your own
  calls in this session; do not read a count from disk. The default is
  `[project].max_attempts` in `nel.toml`, and **the prompt that launched you
  wins** if it named a number. The bound is per launch: it does not accumulate
  across runs (ADR 0018). The status line's `attempt` field is a lifetime
  counter for the log — not this budget.
- a `STOP` file exists at `.nel/STOP`.
- **the feedback has stopped telling you anything new**: the last two panels
  raised no finding you have not already addressed or consciously declined. Say
  so in your final status and stop. Burning the remaining budget on cosmetic
  edits makes the paper worse, not better.

Otherwise loop back to step 2.

## Don't circle

The failure mode of an unattended authoring run is proposing variants of one
idea until the budget is gone. Before each proposal, check `by-approach/*.md` and
`./nel archive history` for angles already spent. If the last two attempts were
the same kind of move and the feedback did not shift, that line of revision is
exhausted — say so in your rationale and pivot to a different entry in
`.nel/prompts/strategies.txt`.

`./nel archive top` and `./nel archive show <attempt_id>` let you re-read an
earlier draft that scored well and its feedback. Adapting an idea from a past
attempt is legitimate; record the debt with `--parent <attempt_id>`.

Note this rule is specific to authoring. In proof mode, repetition is not
evidence of exhaustion, and `.nel/loop.proof.md` deliberately omits it.
