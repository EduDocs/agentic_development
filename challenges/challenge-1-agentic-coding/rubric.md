---
title: "Challenge 1 — Rubric"
status: draft
updated: 2026-06-25
unit: challenge
outcomes: [LO1, LO2, LO4]
---

# Challenge 1 — Rubric

> Grades *coding with an agent, reproducibly*. Criteria tie to course outcomes
> ([`../../syllabus/outcomes.md`](../../syllabus/outcomes.md)) and to the **Challenges** component
> (20% overall, D-024). The leaderboard *informs* the grade, but on Tier-0 data a linear fit is
> trivial — **the weight here is on process**, not score.

| Criterion | What earns top marks | Outcome |
|-----------|----------------------|---------|
| **Reproducibility** *(primary)* | Pinned environment; a true **one-command run** that works on a clean machine; a clean, checkpointed git history (not one giant commit). | LO1 |
| **Correctness** | Loader → linear fit → scorer produces a valid **held-out** score and a well-formed leaderboard entry. | LO1, LO4 (seed) |
| **Agentic workflow & context** | Evidence of *driving* the agent well — legible prompts, a useful project `CLAUDE.md`, sensible commit-before-you-act hygiene. | LO1, LO2 |
| **Clarity** | A `README` that says plainly what the tool does and how to run it. | LO8 |

## Notes
- **Mode:** individual.
- **Leaderboard:** a required entry, but standing barely matters on trivial data — getting it
  *reproducible and legible* is the point.
- This challenge builds the **scorer** that Challenge 2 grows into the reusable eval harness
  (Spine 1) — grade it as the seed it is.
