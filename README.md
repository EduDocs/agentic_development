# Agentic Development in Research → Agentic Evolutionary Frameworks

A project-based graduate course on building agentic AI systems for research, culminating in
**agentic evolutionary frameworks** that automate discovery. Students move from operating a
professional agentic rig, to *building* research agents, to an evolutionary search that discovers
a model from data in their own field.

- **Format:** 3-credit, 14 weeks × 3h + a week-15 finals slot. Project-based; the capstone is the
  summative (no separate exam).
- **Audience:** graduate students (mostly Ph.D.) across disciplines, mostly quantitative — some
  Python, no assumed background in agents, git, or the shell.

## Start here

- **[syllabus/README.md](syllabus/README.md)** — the student-facing syllabus (outcomes, calendar,
  assessment, materials).
- **[PROGRESSION.md](PROGRESSION.md)** — the skill spine: the capability ladder and the two threads
  (evaluation→fitness, context engineering) that hold the course together.

## Repository layout

| Path | What's in it |
|------|--------------|
| `syllabus/` | Outcomes, the 14-week calendar, the outcome→evidence map, assessment & weights |
| `tasks/` | Week-1 onboarding (rig, git, shell, prompting, context) — required, not graded |
| `challenges/` | The four biweekly build units (agentic coding → research agent → retrieval → orchestration) |
| `projects/capstone/` | The capstone package + the evolutionary-frameworks pivot module |
| `tutorials/` | 36 student-led peer-teaching briefs (the Presentations track) |
| `benchmarks/` | The shared substrate (symbolic regression), baseline ladder, and scoring harness |
| `assessment/` | Rubrics (Project, Teamwork, Tutorial) and grading infrastructure |
| `resources/` | Reading library, incl. the vendored Claude Code workshop |

## For maintainers

- **[CLAUDE.md](CLAUDE.md)** — course identity, conventions, and how the repo is organized.
- **[DECISIONS.md](DECISIONS.md)** — the append-only governance ledger (what was chosen and why).

The course is itself an agentic-development artifact: markdown is the source of truth, and the
material is built and evolved the same way the systems it teaches are.
