# Challenge 3 — Retrieval & Grounding (Context Engineering at Scale)

**Weeks:** ~5–6 · **Mode:** individual or team (set at S9) · **Substrate:** Tier 1

## The capability you're building
Ground the agent in *domain knowledge* so it proposes **better** models. You'll give the agent
retrieval over the reference corpus and use what it finds to **constrain the model search** — the
moment context engineering (Spine 2) graduates from "write a `CLAUDE.md`" to "construct the right
context, on demand, from a knowledge base."

## Why retrieval has a real job here
In most tutorials RAG is toy question-answering. Here it earns its keep. The reference corpus holds
**units, common functional forms, and dimensional constraints** per domain. Dimensional analysis
can *rule out* candidate forms before you fit a single one; a known functional form can *seed* a
far better proposal. Retrieval becomes a **search-space constraint**, not a lookup — which is
exactly why grounding should move the leaderboard.

## What you'll make
Extend your Challenge 2 research agent so it:
1. **retrieves** relevant domain notes for the dataset at hand (units, typical forms, constraints),
2. **constructs context** that constrains its proposals (e.g. "the target is a rate, so the model
   must be dimensionally consistent with 1/time"),
3. proposes, fits, and **scores with the same eval harness** (reused unchanged from C2),
4. **cites** which retrieved facts shaped which proposals.

## Deliverables
- The retrieval-augmented agent (reusing the C2 harness).
- An **ablation**: grounded vs. ungrounded agent on **≥2 Tier-1 datasets**, on the leaderboard.
- A short analysis: where did domain priors help, where did they mislead, and why?

## How it's scored
Comparative leaderboard performance — does grounding **measurably** beat the ungrounded C2 agent? —
plus the quality of the retrieval design and the honesty of the ablation. (Rubric: S9.)

## Reading
- Workshop **Lesson 02** revisited at depth (context, instruction layers) + **Lesson 04** intro.
- [`benchmarks/README.md`](../../benchmarks/README.md) — the reference corpus and the harness.

## How it connects
- **Spine 2 (context engineering):** this is its center of gravity — retrieval as deliberate
  context construction, judged by whether it improves results.
- **Spine 1:** the harness is reused unchanged; grounding earns its keep only on *its* numbers.
- **Capstone:** in your own domain you'll bring your own priors and literature — this is the
  rehearsal for grounding a search in knowledge you, not we, supply.
