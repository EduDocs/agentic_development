# The Pivot — From Orchestrated Loop to Evolutionary Search

**Week ~9 teaching module.** This is where Agentic Development becomes Agentic *Evolutionary*
Frameworks. It launches the capstone (the capstone package — proposal, milestones, rubric — lives
beside this file, authored at S8e).

## Where you already are
Across the foundations you built **drive → build → ground → orchestrate**. Challenge 4 left you
holding a loop — **generate → evaluate → select → repeat** — with the reusable **eval harness**
from Challenge 2 as its scorer. You have every piece of an evolutionary algorithm except one
operator.

## The one new idea: mutation
Add a **mutation operator** and selection becomes **evolution**:

```
        ┌─────────────────────────────────────────────┐
        │                                             ▼
   generate ──► evaluate (fitness) ──► select ──► mutate ──► (next generation)
```

Instead of proposing candidates from scratch each round, you **mutate the best survivors** — small,
structured edits to existing high-scoring artifacts. The population improves over generations
because good structure is **inherited and varied**, while the harness (fitness) keeps what works.
That is the entire conceptual leap. Everything else is engineering and taste.

## Why an LLM is a *good* mutation operator
Classical genetic programming mutates expression trees blindly — swap a node, perturb a constant.
An LLM mutates with **priors and intent**: it can read the current best model, the data, and the
domain notes (your Challenge 3 retrieval) and propose a *sensible* variation — *"this looks like
saturating growth; try a logistic form."* That difference — knowledge in the mutation operator — is
what separates FunSearch from 1990s GP.

This is also where your **two spines converge**:
- **Spine 1 (evaluation → fitness):** the Challenge 2 harness *is* the fitness function. You build
  nothing new — the object you've reused all term now closes its own loop.
- **Spine 2 (context):** the LLM mutator is most effective when you **engineer its context** —
  feeding it the lineage of what's been tried, the domain priors, the failures. Evolution is
  context engineering in a loop.

## The lineage (required reading)
- **FunSearch** (DeepMind, *Nature* 2023) — LLM-guided evolutionary search over *programs*, scored
  by an automatic evaluator; found new constructions in combinatorics (cap sets) and better
  online bin-packing heuristics. The template: *LLM as mutation operator, code as artifact,
  automatic score as fitness.*
- **AlphaEvolve** (DeepMind, 2025) — a Gemini-powered evolutionary coding agent that evolves whole
  algorithms; produced improved matrix-multiplication results and real data-center scheduling
  gains. Shows the idea scaling to substantial code with rich evaluators.
- **OpenEvolve** — an open-source reimplementation of the AlphaEvolve approach; your hackable
  reference (accessibility, D-017).
- *(Optional)* **The AI Scientist** (Sakana, 2024) — end-to-end automated research; more
  agentic-research than evolutionary, but a glimpse of the destination.

## What makes it work — and break
The loop is easy. The hard parts are the ones the capstone is graded on:
- **Fitness design** — multi-objective (accuracy vs. parsimony), and a fitness an optimizer will
  *attack*. Recall the Challenge 2 eval-hacking note — **now the attacker is real and tireless.**
- **Diversity** — populations collapse to one local optimum; islands / niching keep exploration alive.
- **Explore vs. exploit** — mutate the best (exploit) vs. preserve variety (explore).
- **Cost** — every fitness evaluation and mutation is an API call. Cost-aware search matters, and
  ties back to Challenge 4's model benchmarking — a cheaper proposer can win on cost-adjusted score.
- **Lineage / provenance** — track what mutated from what, so you can *see* and *report* the search.

## The capstone (launches now)
You hold the full stack. The capstone turns it on **your own research**:
1. bring a `(features → target)` dataset (or another automatically-scorable artifact) from your domain,
2. stand up **fitness = your harness** on it,
3. **build → evolve → write up**: an agentic evolutionary search that discovers a model in your field,
4. report it like a paper — this is the summative (D-012).

## In studio
- Walk **OpenEvolve** on a Tier-1 SR dataset; point to the mutation operator, the fitness, the
  population, the islands.
- **Convert your Challenge 4 orchestration into an evolutionary loop** by adding a mutation operator;
  run it; compare to your C4 best on the leaderboard. If evolution doesn't beat orchestration,
  diagnose why — that diagnosis is half the learning.
