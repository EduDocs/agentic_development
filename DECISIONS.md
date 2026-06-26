# Decisions Ledger

> Append-only governance log for the course build. Each binding decision is one numbered
> block. This is the **governance** record (what we chose and why); `PROGRESSION.md` is the
> **conceptual** spine (skills and their dependencies); `CLAUDE.md` is the identity + pointer.
>
> Entries are numbered in the order they were logged; the session tags (SX) may appear out of
> numeric order because sessions were executed non-sequentially (e.g. unit build-out before
> finalizing outcomes and weights).
>
> Block format:
> ```
> ## D-0NN  <short title>   [YYYY-MM-DD, Session SX]
> Decision: <one or two sentences>
> Supersedes: <D-0MM or —>
> Touches: <paths/areas affected>
> ```

---

## D-001  Course identity & format   [2026-06-25, ideation]
Decision: A project-based, 3-credit graduate course — "Agentic Development in Research →
Agentic Evolutionary Frameworks" — running **14 weeks × 3 contact hours plus a final exam**.
Audience: mostly-PhD, cross-disciplinary, mostly-quantitative students.
Supersedes: —
Touches: CLAUDE.md, syllabus/

## D-002  Two themes, taught sequentially (foundations first)   [2026-06-25, ideation]
Decision: Part I = Agentic Development in Research (the foundations weeks); Part II = Agentic
Evolutionary Frameworks, introduced later and concurrent with the capstone. Precise week
placement is set in S1/S2.
Supersedes: —
Touches: syllabus/calendar.md, PROGRESSION.md

## D-003  Evolutionary frameworks = evolutionary search of artifacts; SR is the vehicle   [2026-06-25, ideation]
Decision: The evolutionary half means agents that evolve artifacts via
generate→evaluate→select→mutate (FunSearch / AlphaEvolve / OpenEvolve lineage). The teaching
vehicle is **symbolic regression / model-discovery-from-data** (clean automatic fitness,
re-skins across quantitative disciplines).
Supersedes: —
Touches: benchmarks/, challenges/, projects/

## D-004  Cohort starts from zero tooling   [2026-06-25, ideation]
Decision: Assume *some* Python and high general ability, but **no** prior experience with
agents, git, the shell, or professional tooling. Week-1 onboarding installs the rig, git, and
shell from scratch.
Supersedes: —
Touches: tasks/, CLAUDE.md

## D-005  Grounding: shared early → own domain at the capstone   [2026-06-25, ideation]
Decision: Tasks and Challenges use shared scaffolding / common datasets so the cohort can
compare; the Project (capstone) moves to each student's own dissertation domain.
Supersedes: —
Touches: challenges/, projects/, benchmarks/

## D-006  Foundations tooling source = vendored Claude Code workshop   [2026-06-25, ideation]
Decision: Week-1+ tooling content draws from the vendored workshop in
`resources/claude-cli-workshop/` (upstream `../../claude-cli`, commit `dd479ab`). Tasks wrap
its lessons/appendices; drift is tracked in that folder's `PROVENANCE.md`.
Supersedes: —
Touches: resources/claude-cli-workshop/, tasks/

## D-007  Adopt the Tasks → Challenges → Project → Tutorials skeleton   [2026-06-25, S0]
Decision: Use a proven project-based structural vocabulary — **Tasks → Challenges → Project →
Tutorials** — and conventions (GitHub as source of truth, Markdown rubrics, roster CSV,
per-student/per-team folders, biweekly cadence), re-skinning content for agentic development.
The original "4×2-week projects + 1×5-week capstone" maps to **Challenges + Project**.
Supersedes: —
Touches: whole repo layout, CLAUDE.md

## D-008  Tutorials peer-teaching track included and graded   [2026-06-25, S0]
Decision: Include a student-led Tutorials track (peer-taught talks on agent patterns / tools),
graded as participation, distributed across the term.
Supersedes: —
Touches: tutorials/, syllabus/assessment.md, syllabus/calendar.md

## D-009  Modernization swap: leaderboard scoring   [2026-06-25, S0]
Decision: Use a **shared eval-harness / internal leaderboard** for objective scoring of agent and
SR outputs (rather than an external competition platform). Concrete harness finalized at S7.
Supersedes: —
Touches: benchmarks/, challenges/

## D-010  Final exam included (net-new)   [2026-06-25, S0]
Decision: The course has a **final exam** — a net-new addition. Its purpose, format, and weight
are open and decided at S5; the instrument is built at S11. *(Later resolved by D-012: the
capstone is the summative; there is no separate exam.)*
Supersedes: —
Touches: syllabus/assessment.md, syllabus/exam.md

## D-011  Build process: tight sessions, open co-ideation, structure-first   [2026-06-25, S0]
Decision: Converge via ~14 tight sessions, each producing one artifact; default mode is open
co-ideation (assistant brings a thinking scaffold, not a finished draft); design discipline is
structure-first (calendar before outcomes), with outcomes+assessment locked before unit
content. Decisions are logged here in `DECISIONS.md`.
Supersedes: —
Touches: process (the build protocol is recorded in this ledger)

## D-012  The final Project IS the summative; calendar carries slack   [2026-06-25, S1]
Decision: The course runs **14 teaching weeks + a week-15 finals slot**; the **final Project is
due in week 15 and serves as the summative ("final exam")** — there is no separate exam
instrument. The calendar is kept deliberately loose (Challenge boundaries are soft); the
progression is protected over the exact grid. Term shape: Tasks (wk 1) → Challenges 1–4
foundations (wks 1–8) → evolution pivot + capstone launch (~wk 9) → Project (~wks 10–14, due
wk 15); Tutorials throughout.
Refines: D-010 (exam now = the Project, not a net-new instrument), D-001 (term shape)
Touches: syllabus/calendar.md, projects/, syllabus/assessment.md; collapses old S11 into S10

## D-013  Four Challenges + capstone; evolution lives in the pivot + capstone; overlapping cadence   [2026-06-25, S1]
Decision: **Four foundations Challenges + one capstone Project** (no 5th Challenge). Agentic
**evolutionary frameworks are taught in the pivot lectures and practiced inside the capstone**,
not as a separate Challenge. Units may **overlap** — the capstone can launch ~week 9 and run
concurrently with the tail of foundations rather than strictly after.
Refines: D-012; resolves the "Challenge 5" question (dropped)
Touches: syllabus/calendar.md, challenges/, projects/, PROGRESSION.md

## D-014  Assessment is distributed across four components (no sit-down exam)   [2026-06-25, S1]
Decision: Because agentic development makes a traditional exam ill-fitting, assessment is
distributed across: **(1) Presentations** (the student-led Tutorials track), **(2) Quizzes**
(periodic concept/reading checks), **(3) Comparative performance** (objective leaderboard
scoring on Challenges/Project), and **(4) the Capstone Project** (the summative final, D-012).
Weights are open and set at S5.
Refines: D-008 (Tutorials = the Presentations component), D-009 (leaderboard = the Comparative
component), D-010/D-012 (capstone = the final)
Touches: syllabus/assessment.md, tutorials/, assessment/, benchmarks/

## D-015  Week-1 onboarding is concept-forward, not just setup   [2026-06-25, S1]
Decision: Week-1 onboarding (Tasks) leads with **concepts** — **prompt engineering, context
engineering, automated context management** — as the key notions, with **mechanics** (API
calls, version control / git, rig install) as supporting scaffolding. The conceptual vocabulary
of the course is established in week 1, not deferred to later Challenges.
Refines: D-004, D-006
Touches: tasks/, PROGRESSION.md

## D-016  Progression locked: two spines + 4-Challenge decomposition   [2026-06-25, S6]
Decision: The course is organized around **two spines** — (1) *evaluation becomes fitness* (the
eval harness built in Challenge 2 becomes the capstone's fitness function) and (2) *context
engineering* (week-1 concept → retrieval → memory → domain-knowledge-as-context). Foundations
decompose as **C1 agentic coding → C2 build a research agent (eval harness born) → C3
retrieval/grounding → C4 orchestration & reliability (seeds generate→eval→select)**; the
evolutionary pivot reaches back to C2 (eval) and C4 (the loop). Captured in `PROGRESSION.md`.
Supersedes: —
Touches: PROGRESSION.md, challenges/, projects/

## D-017  Tool- and model-plural, for accessibility and didactics   [2026-06-25, S7]
Decision: The course teaches **transferable** agentic-development concepts across **multiple
tools and models**, not a single vendor. In play: Claude (CLI, VSCode extension, Cowork), Codex
(+ VSCode extension), Gemini (API), and **open-source agentic tools** (e.g. OpenCode, Hermes)
chosen for accessibility so no student is gated by paid access. **Optional:** download an
open-weights model from Hugging Face and run it locally (accessibility + understanding the
stack). Tool/model plurality doubles as **benchmarking targets** (D-019).
Supersedes: refines D-004 ("most capable current Claude models" → default, not exclusive)
Touches: benchmarks/, tasks/, challenges/, tutorials/

## D-018  Substrate = single SR task; easy data first; baseline ladder   [2026-06-25, S7]
Decision: One shared substrate — **scientific model discovery from data (symbolic regression)**,
spanning foundations → capstone. Begin with **easy, intuitive datasets** and grow. Methods are a
**baseline ladder**: (1) **linear regression** (trivial, defines "fitness") → (2) **PySR /
classical symbolic regression** (genetic programming — itself evolutionary, previews the
capstone; the baseline to beat) → (3) **agentic/evolutionary** (LLM-as-mutation + Agent SDK).
Supersedes: makes D-003 concrete
Touches: benchmarks/, challenges/, projects/

## D-019  Include a model-benchmarking activity   [2026-06-25, S7]
Decision: The course includes a **benchmarking activity** where students compare **methods**
(linear → PySR → agentic) and/or **models/agents** (Claude vs Gemini vs open-weights as the
proposal/mutation operator) on the shared substrate, scored by the eval harness/leaderboard.
Produces the leaderboard data behind the **comparative-performance** grade (D-014) and exercises
Spine 1. Exact placement in the 4-Challenge sequence: open (S8/S9).
Supersedes: —
Touches: benchmarks/, challenges/, syllabus/assessment.md

## D-020  Benchmarking placement: methods in C2, models in C4   [2026-06-25, S8b/c]
Decision: Resolves D-019's open placement. **Method benchmarking** (linear → PySR → agentic) lives
in **Challenge 2**, where the eval harness is born. **Model benchmarking** (different LLMs/agents
as the proposal operator, on score and cost) lives in **Challenge 4**, where multi-proposer
orchestration already exists — a natural, cheap home that also exercises tool plurality (D-017).
Refines: D-019
Touches: challenges/challenge-2-research-agent/, challenges/challenge-4-orchestration/

## D-021  Folder names are lowercase   [2026-06-25, S8]
Decision: All top-level course folders are **lowercase** (`tasks`, `challenges`, `projects`,
`tutorials`, `assessment`, `resources`, `benchmarks`, `syllabus`, `scratch`). Path references and
links use lowercase; **unit-type names in prose** (the Tasks, Challenges, the Project, Tutorials)
remain capitalized as proper nouns.
Supersedes: the capitalized-folder rationale in D-007 (vocabulary kept; casing dropped)
Touches: whole repo, CLAUDE.md

## D-022  Objectives + 9 measurable learning outcomes   [2026-06-25, S3]
Decision: Four course objectives (A research-instrument, B evaluation-centered, C
development→discovery bridge, D transferable/reproducible/tool-plural) and **nine measurable
learning outcomes** (LO1–LO9), each with an observable verb and gradeable evidence, mapped to the
capability ladder and the two spines. **LO9 = critical use and transparency** (judge / verify /
disclose / name failure modes) — framed as critical thinking, *not* ethics, at the instructor's
direction. Captured in `syllabus/outcomes.md`.
Supersedes: —
Touches: syllabus/outcomes.md, syllabus/assessment-map.md (S4), rubrics (S9–S10)

## D-023  Presentations broadened: pre-shared md + Q&A, certifies conceptual grasp   [2026-06-25, S5]
Decision: The Presentations component's deliverable is a **tutorial markdown file shared with the
cohort ahead of time**, plus a ~15-min talk and **open Q&A in which the presenter fields questions
beyond the prepared material**. The rubric is broadened to assess **conceptual mastery** and honest
question-handling, mapping the component to LO2 and LO9 (not just LO8). Rubric at
`assessment/rubric-tutorials.md`.
Refines: D-008, D-022
Touches: tutorials/, assessment/rubric-tutorials.md, syllabus/assessment.md, syllabus/assessment-map.md

## D-024  Assessment weights & policies   [2026-06-25, S5]
Decision: Weights — **Capstone 40% · Challenges (comparative) 20% · Presentations 20% · Quizzes 20%**
(= 100%). Capstone is the dominant single weight; the three supporting components are equal at 20%
each (leaderboard kept from dominating; quizzes given real stakes; presentations broadened).
Policies: individual/team scaling (quizzes & presentations individual or
pair; Challenges C1 individual → C4 team; capstone team-or-individual); the leaderboard *informs but
does not solely determine* Challenge grades (rubric weighs correctness, reproducibility, honest
analysis); **AI-use disclosure required on every submission** and scored in the capstone (LO9),
framed as transparency/critical-thinking, not ethics.
Refines: D-014; resolves the S4 weighting observations
Touches: syllabus/assessment.md

## D-025  Severed the external reference — the course is standalone   [2026-06-25, S12]
Decision: Now that the harvested structure is fully internalized, **all references to the external
prior course are removed** from the repo. The unit vocabulary (Tasks → Challenges → Project →
Tutorials), the rubrics, and the conventions remain — they are now simply the course's own, with no
external attribution or path dependency. The two projects are separated completely.
Refines: drops the external attribution in D-007, D-009, D-010, D-021
Touches: whole repo

