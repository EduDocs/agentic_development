# Agentic Development in Research — Graduate Course

A project-based graduate course on building agentic AI systems for research, culminating
in **agentic evolutionary frameworks** that automate discovery. The course is itself an
agentic-development artifact: the repo is structured so that Claude (and students) author,
critique, and evolve course material the same way they build the systems they study.

> **Binding decisions live in [`DECISIONS.md`](DECISIONS.md)** (the governance ledger).
> The skill through-line lives in `PROGRESSION.md` (the conceptual spine, authored at S6).
> The build is run as a sequence of co-ideation sessions, each recorded in `DECISIONS.md`.

## Course Identity

- **Title:** Agentic Development in Research → Agentic Evolutionary Frameworks
- **Format:** project-based, 3-credit — **14 weeks × 3 contact hours + a week-15 finals slot**.
  The **capstone Project is the summative** (due week 15) — there is no separate exam (D-012).
  Units follow a **Tasks → Challenges → Project → Tutorials** skeleton (D-007). The original
  "4 × 2-week projects + 1 × 5-week capstone" maps to **four
  Challenges + the Project** (no 5th Challenge, D-013). The calendar is in `syllabus/calendar.md`.
- **Audience:** graduate students, mostly Ph.D., **across disciplines**. Mostly quantitative
  fields. *Some* Python experience and high general ability, but no assumed background in
  agents, git, the shell, or professional tooling — the course starts there.
- **Stance:** students progress from *operating* a professional agentic rig (early) to *building*
  agentic research systems (later). Tools are the on-ramp, not the ceiling.

## The Arc (foundations first, evolution near the capstone)

Foundations come first — the early weeks build agentic-development competence from zero
tooling — and the agentic **evolutionary framework** is introduced later, concurrent with the
capstone. Precise week placement is set in `syllabus/calendar.md` (S1–S2); the shape is:

```
   Part I · Agentic Development in Research          Part II · Agentic Evolutionary Frameworks
   Tasks ──► Challenges 1–4 ──────────────────────────► evolution pivot ──► Project (capstone)
  (onboard)  (rig→build→orchestrate research agents)   (SR: generate→eval→select→mutate)  (own domain,
        └─────────────── Tutorials: student-led peer-teaching, throughout ──────────────┘  the summative)
```

- **Part I — Agentic Development in Research.** Tasks onboard the rig/git/shell from zero;
  Challenges ramp from rig-driven coding to designing, building, orchestrating, and evaluating
  agents that do real research work.
- **Part II — Agentic Evolutionary Frameworks.** Agents that *evolve artifacts* — code, models,
  designs — via generate→evaluate→select→mutate. Lineage: FunSearch, AlphaEvolve, OpenEvolve.
  **Symbolic regression / model-discovery-from-data is the teaching vehicle** (clean automatic
  fitness, re-skins across quantitative disciplines).
- **Project (capstone) — the summative.** Each student applies the full stack to a problem in
  their **own dissertation domain**: build → evolve → write up. Due week 15, it serves as the
  final (D-012); there is no separate exam. Assessment is distributed across Presentations,
  Quizzes, Challenges, and the Capstone (D-014, `syllabus/assessment.md`).

## Cohort Assumptions

- **Coding:** *some* Python, high general ability — but the course starts from **zero on
  professional tooling**. Onboarding (Tasks) installs the Claude rig (Claude Code/CLI + IDE),
  the terminal, and git/versioning. No prior experience with agents, the shell, or git is
  assumed. Students reach "build an agent from an SDK" in the later Challenges, not on day one.
  Default stack favors the most capable current Claude models.
- **Domains:** cross-disciplinary but **mostly quantitative**. Examples must not assume a CS
  background; a biologist, economist, and physicist should each see a path to their own work.
- **Grounding (shared → own):** Tasks and Challenges use **shared scaffolding and common
  datasets/tasks** so the cohort can compare results and collaborate. The **Project (capstone)**
  moves to each student's own research problem.

## Repo Structure

Folder names are **lowercase** (D-021). The unit folders carry the course's unit vocabulary
(tasks, challenges, projects, tutorials). Each folder carries a README stub stating its role and
the session that fills it; content is written as we go, not scaffolded speculatively.

```
AgenticDevelopmentCourse/
├── CLAUDE.md                  # This file — identity, arc, conventions (+ pointer to DECISIONS.md)
├── DECISIONS.md               # Append-only governance ledger (what we chose and why)
├── PROGRESSION.md             # Conceptual spine: skills + dependencies (authored at S6)
├── syllabus/                  # outcomes · calendar · assessment-map · assessment · README
├── tasks/                     # Week-1 onboarding (rig/git/shell) — fed by the vendored workshop
├── challenges/                # The core biweekly unit (4): brief · data · rubric · submission
├── projects/                  # The capstone: proposal · milestones · rubric · report template
├── tutorials/                 # Student-led peer-teaching: roster · topic menu · presenter guide
├── assessment/                # Cross-unit rubrics (Tutorial) · roster CSV · peer-review templates
├── resources/                 # Reading library + vendored curriculum sources — transferable
│   └── claude-cli-workshop/   #   VENDORED Claude Code workshop = tasks/foundations source;
│                              #   lessons/ + slides/ + PROVENANCE.md (drift-tracked, commit-pinned)
├── benchmarks/                # Shared substrate + SR vehicle + eval-harness/leaderboard (S7)
└── scratch/                   # Ephemeral working area (ideation, drafts, coherence report)
```

## Unit Anatomy

- **Task** (`tasks/Ntask.md`) — a one-time onboarding step: goal, steps, a done-check. Required,
  not graded.
- **Challenge** (`challenges/<slug>/`) — `brief.md` (problem, deliverables, constraints) ·
  data/`starter/` scaffold · `rubric.md` (ties to outcomes) · submission template · an objective
  score via the shared eval-harness/leaderboard. Mix of individual and team.
- **Project** (`projects/capstone/`) — proposal template · milestone schedule · `rubric.md`
  (Project + Teamwork rubrics) · report template. Own-domain, build → evolve → write up.
- **Tutorial** (`tutorials/`) — a student-led talk from the topic menu, graded as participation.

## Design Principles

- **Project-first.** Every concept is introduced because a unit needs it. No topic ships
  without a place it gets used.
- **Build, then evolve.** Students implement a working agent before they evolve one; the
  evolutionary half presupposes the development half.
- **Discipline-portable.** Shared benchmarks are chosen so each can be re-skinned to a student's
  field; the Project makes that transfer explicit.
- **Evaluation is first-class.** Agentic and evolutionary systems are only as good as their eval
  loop — eval harnesses are taught early and reused throughout.
- **Reproducible & honest.** Pinned environments, logged runs, reported failures. The course
  models the research hygiene it asks students to practice.

## Working Approach (for this repo)

- The curriculum is developed **iteratively** as co-ideation sessions: ideate in `scratch/`,
  log binding choices in `DECISIONS.md`, settle the through-line in `PROGRESSION.md`, then
  realize student-facing specs in the unit folders.
- Treat `PROGRESSION.md` as the conceptual spine (skills/topics and their dependencies); treat
  `challenges/*/brief.md` and `projects/*` as the shipped, student-facing surface.
- Keep Part I (foundations) and Part II (evolution) coherent: each evolutionary capability
  should trace back to a foundations skill it builds on.

## Status (the backbone is built)

Resolved and on disk: learning outcomes (`syllabus/outcomes.md`), the loose 14-week calendar
(`syllabus/calendar.md`), the outcome→evidence map (`syllabus/assessment-map.md`), assessment
weights & policies (`syllabus/assessment.md`), the skill spine (`PROGRESSION.md`), the substrate
(`benchmarks/`), and all unit content (`tasks/`, `challenges/`, `projects/capstone/`, 36
`tutorials/`). See `DECISIONS.md` for the full ledger.

**Remaining:** the four per-Challenge rubrics (S9), and ongoing coherence upkeep.
