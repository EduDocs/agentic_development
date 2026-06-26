---
title: "Course Objectives & Learning Outcomes"
status: draft
updated: 2026-06-25
unit: syllabus
---

# Course Objectives & Learning Outcomes

> Objectives are the broad aims (the *why*); learning outcomes are **measurable** statements of
> what a student can do by the end (the *what*, each assessable). Outcomes are derived from the
> capability ladder in [`../PROGRESSION.md`](../PROGRESSION.md) and mapped to the assessment
> components in [`assessment.md`](assessment.md). The outcome→evidence matrix lives in
> [`assessment-map.md`](assessment-map.md).

## Objectives

The course aims to:

- **A. Make agentic AI a research instrument.** Move students from *operating* AI tools to
  *building* agentic systems they can trust and direct as part of real research.
- **B. Put evaluation at the center.** Treat automatic, honest evaluation as the foundation of
  every trustworthy agentic and evolutionary system — the course's first spine.
- **C. Bridge development to discovery.** Carry students from building agents to **evolutionary
  search**, where an evaluation harness becomes a fitness function and agents discover models.
- **D. Build transferable, reproducible, tool-plural practice.** Habits and methods that each
  student can apply to their own field, across tools, with results others can reproduce.

## Learning outcomes

By the end of the course, a student can:

| # | Outcome (measurable) | Bloom | Evidence | Ladder / spine |
|---|----------------------|-------|----------|----------------|
| **LO1** | **Set up and operate** a professional agentic rig — CLI/IDE, shell, version control, and API access — to **drive** an agent through a reproducible task. | Apply | Tasks, C1 | operate |
| **LO2** | **Design** prompts and **engineer** context (instruction files, retrieval, automated context management) that *measurably* improve an agent's performance. | Apply / Analyze | C1–C3, quizzes | Spine 2 |
| **LO3** | **Implement** a research agent with tool definitions, a control loop, and structured outputs that completes a research task end-to-end. | Create | C2 | build |
| **LO4** | **Design** an automatic, leakage-resistant **evaluation harness** and **use** it to compare methods and models on held-out data. | Create / Evaluate | C2–C4, leaderboard | Spine 1 |
| **LO5** | **Compose** reliable multi-step / multi-agent workflows with verification, retries, memory, and logging, and **report** failures honestly. | Create | C4 | orchestrate |
| **LO6** | **Implement** an agentic **evolutionary search** that extends an evaluation loop with a mutation operator to evolve artifacts, managing fitness design, diversity, and cost. | Create | capstone | evolve (Spine 1 ✕ 2) |
| **LO7** | **Scope, build, evolve, and critically analyze** a discovery system on a problem in the student's **own research domain**. | Create / Evaluate | capstone | transfer |
| **LO8** | **Teach** an agentic-development topic to peers and **document** reproducible results in a paper-style report. | Create / Evaluate | Tutorials, capstone report | communicate |
| **LO9** | **Use AI critically and transparently**: **judge** when to trust an agent's output, **verify** its claims against ground truth, **disclose** AI's role in the work, and recognize and name failure modes. | Evaluate | C2–C4 verification, honest failure reports, AI-use disclosure, quizzes | cross-cutting |

## Measurability & assessment

Each outcome is phrased with an observable verb and is evidenced by a concrete artifact, so it can
be graded rather than merely asserted:

- **LO1, LO3, LO5, LO6, LO7** are evidenced by *working systems* (reproducible repos, agents,
  pipelines, the evolutionary capstone).
- **LO4** is evidenced by an eval harness plus *comparative leaderboard* results — the
  comparative-performance component (D-014).
- **LO2** is reinforced by *quizzes* that check the conceptual vocabulary, not just its use.
- **LO8** is evidenced by a *presentation* (Tutorials) and the *capstone report*.
- **LO9** is evidenced by *verification work* and *honest failure reporting* (C4, capstone) plus the
  *AI-use disclosure* required on submissions (policy set at S5).

The outcome→evidence matrix ([`assessment-map.md`](assessment-map.md)) checks that every outcome is
covered and every assessment is motivated; per-unit rubrics (S9–S10) trace each criterion back to an
outcome here.

## Notes
- LO4 absorbs **model benchmarking** (D-019) and **tool plurality** (D-017): comparing methods and
  models is how evaluation is exercised.
- LO6 is where the **two spines converge** — the harness from LO4 becomes fitness, and the context
  engineering from LO2 feeds the mutation operator.
- LO9 is framed as **critical use and transparency** — judging, verifying, and disclosing — *not*
  as ethics; it ties to the AI-use disclosure policy (S5).
