---
title: "Syllabus — Agentic Development in Research → Agentic Evolutionary Frameworks"
status: draft
updated: 2026-06-25
unit: syllabus
---

# Syllabus — Agentic Development in Research → Agentic Evolutionary Frameworks

A project-based graduate course on building agentic AI systems for research, culminating in
**agentic evolutionary frameworks** that automate discovery. You will move from operating a
professional agentic rig to *building* research agents, and finally to an evolutionary search that
discovers a model from data in your own field.

## Audience & prerequisites
Graduate students (mostly Ph.D.) across disciplines, mostly quantitative. You need **some Python**
and high general ability — but **no prior experience** with agents, git, the shell, or professional
tooling. Week 1 starts there.

## Format
Standard 3-credit course: **14 teaching weeks × 3 contact hours + a week-15 finals slot.** The
**capstone Project is the summative** (due week 15) — there is no separate exam. Full schedule:
[`calendar.md`](calendar.md).

| Weeks | Block | What runs |
|-------|-------|-----------|
| 1 | Onboarding | **Tasks** — concept-forward: prompt & context engineering, automated context management, API calls, version control |
| 1–8 | Foundations | **Challenges 1–4**: agentic coding → build a research agent → retrieval/grounding → orchestration & evaluation |
| ~9 | Pivot | **Evolutionary frameworks** introduced; **capstone launches** |
| ~9–14 | Capstone | The **Project** in your own domain: build → evolve → write up |
| 15 | Finals | **Project due — the summative** |
| throughout | Parallel | **Tutorials** (peer-teaching) and **quizzes** |

Boundaries are deliberately soft; the progression matters more than the grid.

## Learning outcomes
By the end, you can (full text + evidence map: [`outcomes.md`](outcomes.md),
[`assessment-map.md`](assessment-map.md)):

1. **LO1** Execute and direct an AI agent through a standardized, repeatable task sequence.
2. **LO2** Formulate prompts and structure contextual information to systematically improve the accuracy and relevance of AI outputs.
3. **LO3** Construct an end-to-end AI research agent equipped with external tools, an execution loop, and structured data outputs.
4. **LO4** Build a testing environment free from data contamination (data leakage) to evaluate and compare the performance of different models and prompting strategies.
5. **LO5** Design workflows where multiple specialized AI agents collaborate reliably, while transparently identifying and reporting system failures.
6. **LO6** Implement a search algorithm that uses principles of variation, evaluation, and diversity (mutation, fitness, cost) to discover optimal solutions.
7. **LO7** Define, build, refine, and evaluate an automated discovery tool tailored to research questions in your primary field.
8. **LO8** Present technical concepts to peers and document your methodology, data, and reproducible findings in a standard academic paper.
9. **LO9** Critically verify accuracy of AI outputs against reliable sources, disclose when and how AI was used, and explain where the model fails.

The course is built on two threads: **evaluation becomes fitness** (the harness you build in
Challenge 2 becomes the capstone's fitness function) and **context engineering** (a week-1 concept
that deepens into retrieval, memory, and domain knowledge). See [`../PROGRESSION.md`](../PROGRESSION.md).

## Course units
- **Tasks** ([`../tasks/`](../tasks/)) — week-1 onboarding; required, not graded.
- **Challenges 1–4** ([`../challenges/`](../challenges/)) — the biweekly build units.
- **Capstone Project** ([`../projects/capstone/`](../projects/capstone/)) — own-domain evolutionary
  research; the summative.
- **Tutorials** ([`../tutorials/`](../tutorials/)) — student-led peer-teaching (36 topics).

## Assessment
Distributed — there is no sit-down exam (full detail + policies: [`assessment.md`](assessment.md)):

| Component | Weight |
|-----------|------:|
| **Capstone Project** (the summative) | **40%** |
| **Challenges** (rubric + comparative leaderboard) | 20% |
| **Presentations** (pre-shared md + talk + Q&A) | 20% |
| **Quizzes** (periodic concept checks) | 20% |

Key policies: the leaderboard *informs but does not solely determine* Challenge grades
("honesty is graded"); team work scales from individual (C1) toward team (C4); and **every
submission discloses what AI did and where** — used critically and transparently, not as ethics.

## Materials & tools
The shared substrate is **scientific model discovery from data (symbolic regression)** with a
baseline ladder of linear regression → PySR → agentic/evolutionary search, scored by a shared
eval-harness/leaderboard ([`../benchmarks/`](../benchmarks/)). The course is **tool-plural** —
Claude (CLI, VS Code, Cowork), Codex, Gemini, and open-source tools, with an optional local
Hugging Face model — and runs on a **laptop + API access** (no GPU required). Week-1 tooling draws
on the vendored Claude Code workshop ([`../resources/claude-cli-workshop/`](../resources/claude-cli-workshop/)).

## For builders of this repo
The course is itself an agentic-development artifact. Identity and conventions live in
[`../CLAUDE.md`](../CLAUDE.md); the skill spine in [`../PROGRESSION.md`](../PROGRESSION.md); the
decision history in [`../DECISIONS.md`](../DECISIONS.md).
