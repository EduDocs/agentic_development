# Course notes — agent instructions

The evolving artifact is the sectionized LaTeX manuscript at **this project's
root** (`notes/`, the directory holding `nel.toml`) — not the course repo one
level up. There is one manuscript; it is never reverted, and every draft that
clears the gates is checkpointed. Improve the notes; do not try to move a
score.

The authoring protocol — the section-pair convention, the unattended loop, how
to read evaluation output, what not to touch — is imported at the bottom of
this file from `.nel/NEL.md`. That file is engine-owned and re-vendored on
`scaffold.py update`, which is how protocol fixes reach this project. Read
both: this file says *what* the notes are, the protocol says *how* to work.

## Problem

> **EDIT THIS SECTION FOR THIS PROJECT.**

This is not a research paper — it is the **course notes** (a `\documentclass{book}`)
for a graduate course, *Agentic Development in Research → Agentic Evolutionary
Frameworks*. `main.tex` is the original hand-written manuscript (moved in
place, not wrapped); the ten chapters under `sections/` (preface,
agentic_paradigm, agentic_rig,
context_engineering, agentic_coding, agent_loop, evaluation, retrieval,
orchestration, evolutionary_frameworks) are the evolving artifact. This
project was **adopted** from a pre-existing hand-written manuscript (ADR 0004
in the engine repo), so every `sections/<name>.concepts.md` sidecar started as
an empty stub — there is no pre-existing spine to read; you are originating it
as you go, chapter by chapter.

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
