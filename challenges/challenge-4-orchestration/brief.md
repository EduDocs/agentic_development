# Challenge 4 — Orchestration, Reliability & the Loop That Becomes Evolution

**Weeks:** ~7–8 · **Mode:** team (likely; set at S9) · **Substrate:** Tier 1

## The capability you're building
Turn a single agent into a **reliable, multi-step workflow** — and, in doing so, build the exact
loop the evolutionary half runs on. This Challenge is the on-ramp to the week-9 pivot.

## The loop (read this twice)
You'll orchestrate a **propose → fit → critique → select → repeat** cycle:
- **multiple proposers** generate candidate models (and here they can be *different models* —
  Claude, Gemini, an open-weights model — see Benchmarking),
- a **critic / verifier** pass checks candidates (dimensional sanity, overfitting smell, leakage),
- the **eval harness** (from C2) scores the survivors,
- you **select** the best and **iterate**, with **memory** of what's already been tried.

Name that pattern: **generate → evaluate → select**. At the pivot you'll add *one* thing — a
**mutation operator** — and this becomes an evolutionary algorithm. You're building the engine now
and meeting its name later.

## Reliability is the other half
Agentic pipelines fail in the dark unless you build for the light. Add **retries** with sensible
backoff, **logging** of every run, **reproducibility** (seeds, pinned env, recorded configs), and
an **honest failure report** — what didn't work, surfaced rather than buried. A long evolutionary
search in the capstone is only trustworthy if you learned this here.

## Benchmarking (D-019, D-020)
This Challenge is the home of **model benchmarking**: run the *same* orchestration with different
models as the **proposal operator** and compare them on the leaderboard. Which model proposes
better candidates, for which datasets, at what cost? This teaches evaluation rigor and exercises
the tool plurality (D-017).

## Deliverables
- An orchestrated, reliable pipeline (multi-proposer · critic · retries · memory · logging).
- A **component ablation**: what does each part (critic, retries, multi-proposer) actually buy, on
  the leaderboard?
- A **model-benchmark table**: ≥2 models as proposers, compared on score and cost.
- A short, honest **failure log**.

## How it's scored
Leaderboard performance of the full pipeline; the rigor of the ablation and model-benchmark; and
the reliability engineering — does it log, retry, reproduce, and report failure honestly? (S9.)

## Reading
- Workshop **Lesson 04** (MCP, sub-agents, agent teams, headless, worktrees).
- [`benchmarks/README.md`](../../benchmarks/README.md) — harness, baselines, model plurality.

## How it connects
- **The pivot:** generate→evaluate→select **+ mutation = evolution**. Per
  [`PROGRESSION.md`](../../PROGRESSION.md), C4 → Pivot is the spine's structural hinge — this
  Challenge is the foundations half's payoff and the evolutionary half's prerequisite.
- **Spine 1:** orchestration is judged by the harness; reliability is what lets you trust a long
  run — and, soon, a long evolutionary search.
