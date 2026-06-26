---
title: "Capstone Rubric"
status: draft
updated: 2026-06-25
unit: capstone
outcomes: [LO1, LO3, LO4, LO6, LO7, LO8, LO9]
---

# Capstone Rubric

> A Project rubric and a Teamwork rubric, **modernized for build → evolve → write up**.
> Each criterion ties to a course outcome (S3) and to the assessment components (D-014). The
> capstone is the summative (D-012). Per-criterion scales and weights are set at S5.

## Project rubric

- **Problem Formulation** — The problem is described clearly; it is meaningful and well-posed *for
  model discovery*. The report includes the background needed to understand the domain and why a
  discovered model matters.
- **Method & Evolutionary Search** *(new dimension)* — The **fitness** is sound and hard to hack;
  the **evolutionary loop** (artifact, mutation operator, population, diversity, explore/exploit,
  cost) is well-designed and justified. Baselines (linear, PySR, the orchestrated agent) are present
  and the evolved result is **honestly compared** to them.
- **Analysis** — Accurate analysis of the proposed solution. Evaluation criteria are well-motivated
  and described; performance results are convincing; the **search dynamics** (what improved, what
  stalled, and why) are examined.
- **Originality** — Significant evidence of originality and inventiveness — in the problem, the
  fitness, or the method. Prior art (FunSearch / AlphaEvolve / OpenEvolve and the domain literature)
  is credited. Rationale or intuition for the chosen approach is provided.
- **Organization** — The report is well structured; the organization establishes a natural
  progression from problem → method → results → analysis.
- **Presentation** — Ideas are conveyed clearly, with proper writing; supported by diagrams and
  figures where appropriate; the system is **reproducible**, with logged runs and lineage.

## Teamwork rubric *(if a team)*

- Effort and Quality
- Resourcefulness and Creativity
- Participation and Interactions
- Deliverables and Timeliness
- Communication and Respect of Peers

## Grading notes

- **Honesty is graded.** A search that *failed* to beat the baseline, diagnosed clearly, can score
  well on Analysis and Originality. A flashy result on a **leaking** fitness fails Method &
  Evolutionary Search — the harness you'd trust an optimizer to attack is the whole point.
- The capstone also feeds the **Presentations** component (D-014) via the final presentation.
