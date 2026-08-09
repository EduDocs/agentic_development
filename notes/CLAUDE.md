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

<!-- >>> nel protocol (scaffold.py) >>> -->
## The nel authoring protocol

@.nel/NEL.md

The line above imports the section-pair convention, the unattended loop, and how
to read evaluation output. It is engine-owned and re-vendored by
`scaffold.py update`; everything else in this file is yours and is never
overwritten. Describe *this paper* — its problem and what you are driving toward
— above, and the agent will have both halves.
<!-- <<< nel protocol <<< -->
