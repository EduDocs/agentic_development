# Outcome → Evidence Matrix

> Checks, in both directions, that every learning outcome ([`outcomes.md`](outcomes.md)) is
> developed and graded somewhere, and that every unit and assessment component
> ([`assessment.md`](assessment.md)) is motivated by an outcome. Built at S4; feeds the weights
> (S5) and the per-unit rubrics (S9–S10).

Legend: **●** primary — introduced and graded here · **○** reinforced / developed (formative).
**Tasks are required-not-graded** (onboarding), so Task marks are formative only.

## Outcome × Unit

| LO | Tasks | C1 | C2 | C3 | C4 | Capstone | Tutorials | Quizzes |
|----|:----:|:--:|:--:|:--:|:--:|:--------:|:---------:|:-------:|
| **LO1** operate rig | ○ | ● | ○ |   |   | ○ |   |   |
| **LO2** prompt/context eng | ○ | ○ | ○ | ● |   | ○ | ○ | ● |
| **LO3** build a research agent |   | ○ | ● | ○ | ○ | ○ |   |   |
| **LO4** eval harness + compare |   | ○ | ● | ○ | ● | ○ |   |   |
| **LO5** orchestrate reliably |   |   |   |   | ● | ○ |   |   |
| **LO6** evolutionary search |   |   |   |   | ○ | ● |   |   |
| **LO7** transfer to own domain |   |   |   |   |   | ● |   |   |
| **LO8** teach + report |   |   |   |   |   | ● | ● |   |
| **LO9** critical use + transparency | ○ |   | ○ |   | ● | ● | ○ | ○ |

**Every outcome has a ●** — no unassessed outcome. **Every column ties to ≥1 outcome** — no orphan
unit (Tasks → LO1/2/9 formatively; Quizzes → LO2/9; Tutorials → LO8).

## Outcome × Assessment component (D-014)

| LO | Presentations | Quizzes | Comparative perf. | Capstone |
|----|:-------------:|:-------:|:-----------------:|:--------:|
| LO1 |   |   | ● | ○ |
| LO2 | ○ | ● | ● |   |
| LO3 |   |   | ● | ○ |
| LO4 |   |   | ● | ○ |
| LO5 |   |   | ● | ○ |
| LO6 |   |   |   | ● |
| LO7 |   |   |   | ● |
| LO8 | ● |   |   | ● |
| LO9 | ○ | ○ | ○ | ● |

**Every component is used; every outcome is graded by ≥1 component.** Coverage is complete.

## Observations for S5 (weighting)

- **Comparative performance is the workhorse** — it carries LO1–LO5 and part of LO9. Its weight must
  be large enough to honor that breadth, but **capped** so the leaderboard doesn't dominate grading
  (and so a student who reasons well but scores mid-pack isn't sunk — recall "honesty is graded").
- **Presentations map narrowly to LO8.** ✅ *Resolved (D-023):* broadened — a pre-shared md + open
  Q&A beyond the talk now certify conceptual grasp (LO2) and honest question-handling (LO9), shown
  by the new ○ marks above.
- **Quizzes are the primary check on LO2's conceptual *vocabulary*** (alongside the Challenges, which
  grade LO2 *in use*) and a touchpoint for LO9. That argues for a small-but-nonzero quiz weight rather
  than dropping them.
- **The Capstone is the sole grader of LO6 and LO7** (evolve + transfer). As the summative, it should
  carry the largest single weight — consistent with D-012.
- **LO9 is diffuse** (Quizzes ○, Comparative ○, Capstone ●). ✅ *Resolved:* the capstone's AI-use
  disclosure + honest-failure analysis is its anchor and the capstone rubric scores it explicitly
  (S10).

*Weighting resolved at S5 (D-024): Capstone 40% (dominant) · Challenges (comparative) 20% ·
Presentations 20% · Quizzes 20% — sums to 100%.*
