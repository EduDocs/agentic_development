---
title: "Challenge 2 — Rubric"
status: draft
updated: 2026-06-25
unit: challenge
outcomes: [LO3, LO4, LO9]
---

# Challenge 2 — Rubric

> Grades *building a research agent and the eval harness at its core*. Criteria tie to course
> outcomes ([`../../syllabus/outcomes.md`](../../syllabus/outcomes.md)) and to the **Challenges**
> component (20%, D-024). The harness is the single most reused object in the course (Spine 1) —
> it weighs the most.

| Criterion | What earns top marks | Outcome |
|-----------|----------------------|---------|
| **Eval harness** *(primary)* | An **automatic, leakage-resistant** harness — held-out predictive error **+ a parsimony term** — packaged as a clean, reusable module with a stable interface. | LO4 |
| **Agent functionality** | Tool definitions, a working agent loop, and structured outputs that take a dataset from proposal → fit → score → reported best, end-to-end. | LO3 |
| **Comparative performance** | The agent benchmarked against the **linear baseline** and **PySR** on ≥2 datasets, on the leaderboard. | LO4 |
| **Analysis & honesty** | An eval report that explains *what beat what and why*, names where the LLM's priors helped or hurt, and shows no sign of gaming the metric. | LO4, LO9 |

## Notes
- **Mode:** individual or team (per S-level policy).
- **Honesty is graded:** a flashy score on a **leaking** harness fails the primary criterion — the
  harness you'd trust an optimizer to attack is the whole point (it becomes the capstone's fitness).
- The leaderboard *informs* but does not *determine* the grade; a correct, legible harness with a
  modest score outranks a high score you can't trust.
