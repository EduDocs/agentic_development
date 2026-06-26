# Challenge 2 — Build a Research Agent (the eval harness is born)

**Weeks:** ~3–4 · **Mode:** individual or team (set at S9) · **Substrate:** model discovery (Tier 0–1)

## The capability you're building
*Construct* an agent rather than just use one. Build something that does a real research move
end-to-end — ingest data, **propose candidate models**, fit them, **score them on held-out data**,
and report the best — with a reusable **evaluation harness** at its core. The harness is the
single most important object in the course: you reuse it in Challenges 3–4, and it **becomes the
fitness function** in the capstone (Spine 1). Build it cleanly; you'll live with it all term.

## What you'll make
A **research agent** that, given a dataset (Tier 0–1 from [`benchmarks/`](../../benchmarks/README.md)):

1. **proposes** several candidate model forms, guided by the data (e.g. polynomial, power-law,
   rational, exponential),
2. **fits** each and **scores** it with *your* eval harness — held-out predictive error **plus a
   parsimony term** (penalize complexity, so a slightly-worse-but-simpler model can win),
3. **selects** and reports the best model as a **structured output**: the expression, its score,
   and a short justification.

Then **benchmark it** (D-019): put your agent's discovered model up against (a) the **linear
baseline** from Challenge 1 and (b) **PySR** — classical symbolic regression. All three go on the
leaderboard.

## Deliverables
- The **research agent** (tool definitions · the agent loop · structured output) in a versioned repo.
- The **eval harness as a reusable module** — clean enough to `import` again in Challenges 3–4 and
  the capstone. Treat its interface as a contract.
- An **eval report**: your agent vs. linear vs. PySR on **≥2 datasets**, with the leaderboard table
  and a paragraph on what beat what, and *why* (where did the LLM's priors help or hurt?).

## How it's scored
Comparative leaderboard performance (your agent's best model vs. the baselines) **and** the
correctness/legibility of the eval harness and the report. A flashy score on a leaking harness
fails. (Rubric: S9.)

## Reading
- Workshop **Lesson 03** (tools, models, flags) — the machinery for giving an agent capability.
- [`benchmarks/README.md`](../../benchmarks/README.md) — the harness spec (error + parsimony), the
  baseline ladder, and PySR.

## How it connects
- **Spine 1 — the pivot in miniature:** the eval harness you build here is the *same object* that,
  with a mutation operator added, **is** the evolutionary loop in the capstone. Evolution will not
  feel like a new topic — it will feel like this Challenge in a `while` loop.
- **PySR previews the method:** PySR is itself evolutionary (genetic programming). Meeting it now as
  a baseline-to-beat previews the capstone's machinery before you build the LLM-driven version.
- **Previews generate→evaluate→select:** propose-many-then-score is the kernel of the pattern that
  Challenge 4 seeds in full — turning it into an orchestrated, verified loop.

## A note on eval hacking
Because the next half of the course *optimizes against this harness*, its weaknesses become
attack surfaces. Watch for: scoring on training data by accident, a parsimony term that's gamed by
trivial re-parameterization, or a metric that rewards overfitting. Designing a harness you'd trust
an optimizer to attack is the real lesson.
