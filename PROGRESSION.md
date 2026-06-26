# Progression: the skill spine of the course

> Not a schedule and not a syllabus. The week-by-week grid lives in `syllabus/calendar.md`;
> binding choices live in `DECISIONS.md`. **This** document defines the *conceptual* through-line:
> the capabilities the course builds, the order they must come in, and the two threads that make
> the agentic→evolutionary arc feel inevitable rather than bolted on.

## The capability ladder

Each rung presupposes the one before it. A student cannot *build* an agent they cannot *drive*,
cannot *orchestrate* what they cannot *build*, and cannot *evolve* what they cannot *evaluate*.

```
  operate & conceptualize ─► build ─────────► orchestrate & evaluate ─► evolve ──────────► transfer
   Tasks (week 1)            Challenges 1–2     Challenges 3–4            pivot + capstone   Project
   prompt/context eng.,      agentic coding;    retrieval; multi-agent   generate→eval→     own-domain
   automated context mgmt,   build a research   workflows; verification; select→mutate;     research
   API calls, versioning     agent; eval harness the eval harness reused fitness = the eval  system
                                                                         harness from C2
```

## The two spines (the connective tissue)

The arc holds together because **two threads start in week 1 as concepts and culminate in the
capstone as machinery.** Everything else hangs off these.

### Spine 1 — Evaluation becomes fitness
You cannot trust an agent you cannot score, and you cannot *evolve* an artifact you cannot score.
The **eval harness** is introduced when students first build an agent (Challenge 2), reused for
ablations under orchestration (Challenges 3–4), and then — the payoff — **becomes the fitness
function** in the evolutionary capstone. Students don't meet "evolution" as a new topic; they
discover that *once scoring is automatic, evolution is just scoring in a loop with a mutation
operator.*

### Spine 2 — Context engineering
Introduced conceptually in week 1 (**prompt engineering, context engineering, automated context
management**, D-015), this thread deepens unit by unit: prompting in practice (C1) → grounding an
agent with retrieval (C2–C3) → managing memory/state across an orchestration (C4) → injecting
**domain knowledge** into the search in the capstone. Context is the lever students learn to pull
at every rung.

A third, quieter thread: **generate→evaluate→select** is seeded as a workflow pattern under
orchestration (C4 — a generator with a critic), then revealed at the pivot to *be* the evolutionary
loop with mutation added. The foundations half pre-trains the evolutionary half without saying so.

## Unit-by-unit progression

| Unit | Capability added | Key skills (new) | Prerequisite |
|------|------------------|------------------|--------------|
| **Tasks** (wk 1) | *Operate the rig; hold the core concepts* | Prompt engineering, context engineering, automated context management; API calls; version control; permissions, plan mode, CLAUDE.md, sessions | — |
| **Challenge 1** | *Code with an agent, reproducibly* | The agentic-coding loop; prompting in practice; reproducible env; clean git history | Tasks |
| **Challenge 2** | *Build a research agent* | Tool definitions; the agent loop; structured outputs; **eval harness introduced**; first retrieval | C1 |
| **Challenge 3** | *Ground it in knowledge* | Retrieval-augmented research (RAG); context engineering at scale; eval harness **reused** | C2 |
| **Challenge 4** | *Orchestrate & make it reliable* | Multi-step / multi-agent workflows; critic/verification; retries; memory/state; logging; failure reporting; **generate→eval→select seeded** | C3 |
| **Pivot** (~wk 9) | *See evolution as eval-in-a-loop* | generate→evaluate→select→**mutate**; fitness design; explore/exploit; eval-hacking awareness; FunSearch / AlphaEvolve / OpenEvolve lineage; SR as vehicle | C2 (eval), C4 (the seed) |
| **Capstone / Project** | *Evolve, and transfer to your own research* | Fitness = the eval harness; population/selection; scoping; integration; build → evolve → write up; domain-knowledge-as-context | the whole ladder |

The **Tutorials** track (student-led presentations) runs in parallel as distributed reinforcement
— students teach each other tools/patterns (MCP, specific frameworks, retrieval techniques,
evolutionary variants), deepening rungs they've reached. **Quizzes** check that the conceptual
vocabulary (Spine 2 especially) is held, not just used. Both are assessment components (D-014),
detailed in `syllabus/assessment.md`.

## Dependency map

The default reading is the linear ladder. The non-obvious edges — what the evolutionary capstone
*actually* reaches back to — are made explicit here:

```
# progression-map
Tasks       -> Challenge1
Challenge1  -> Challenge2
Challenge2  -> Challenge3
Challenge3  -> Challenge4
Challenge2  -> Pivot        # evolution needs the EVAL HARNESS (spine 1), introduced in C2
Challenge4  -> Pivot        # ...and the generate->eval->select SEED, from C4
Pivot       -> Capstone
Challenge4  -> Capstone     # capstone integrates the full orchestration stack
Tasks       -> Capstone     # context engineering (spine 2) runs end-to-end
```

Note the two back-edges into **Pivot**: the evolutionary half is not a fresh start — it is
Challenge 2's evaluation and Challenge 4's loop, recombined. That is the spine made structural.

## How this document is used

- It is the **conceptual contract** the unit content (Challenges, Project) must honor: no unit may
  require a skill before its introducing rung.
- It is checked in the S12 coherence pass: every skill a Challenge brief assumes must appear at or
  before that Challenge here.
- When a unit's design changes a *concept* (not just wording), update this spine and log the why in
  `DECISIONS.md`.
