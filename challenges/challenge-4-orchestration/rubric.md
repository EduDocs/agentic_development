---
title: "Challenge 4 — Rubric"
status: draft
updated: 2026-06-25
unit: challenge
outcomes: [LO4, LO5, LO9]
---

# Challenge 4 — Rubric

> Grades *reliable orchestration and the loop that becomes evolution*. Criteria tie to course
> outcomes ([`../../syllabus/outcomes.md`](../../syllabus/outcomes.md)) and to the **Challenges**
> component (20%, D-024). This is the on-ramp to the pivot, so the loop and the reliability both
> count.

| Criterion | What earns top marks | Outcome |
|-----------|----------------------|---------|
| **Orchestration & the loop** *(primary)* | A working **propose → fit → critique → select → repeat** cycle with multiple proposers, a critic/verifier pass, and memory of what's been tried. | LO5 |
| **Reliability engineering** | Retries with sensible backoff, logged runs, reproducibility (seeds, pinned config), and an **honest failure report**. | LO5, LO9 |
| **Component ablation** | A clean account of what each part (critic, retries, multi-proposer) actually *buys*, on the leaderboard. | LO4 |
| **Model benchmarking** | ≥2 models compared as the **proposal operator** on score **and cost** (D-019/D-020). | LO4 |

## Notes
- **Mode:** team (likely).
- **Honesty is graded:** a logged, well-diagnosed failure outscores an undocumented "it worked."
- Name the pattern: this **generate → evaluate → select** loop becomes the evolutionary algorithm at
  the pivot once a mutation operator is added — grade it as the engine it is.
