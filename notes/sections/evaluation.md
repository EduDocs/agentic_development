# evaluation — scratch

> Sidecar for `evaluation.tex`. Not part of the LaTeX build.
> The EVOLVE-BLOCK below is the shareable spine exported to reviewers and elites;
> everything outside it is private scratch you may freely edit.

## Purpose
Build the harness that scores an artifact honestly — the object that becomes the
fitness function in Ch.9. Establish leakage-resistance and eval-hacking defenses.

<!-- EVOLVE-BLOCK-START -->
## Key points / spine
- **Harness = $(\mathcal{D}, \Score)$** with a sealed train/test partition (Def.~EvalHarness); the test split is inviolable (Principle~TestSplitInviolable).
- Automatic evaluation earns three properties the evolutionary half requires: speed, consistency, composability. A good score is faithful, discriminating, leakage-resistant, stable.
- **Leakage** taxonomy (scoring on train; feature construction from the full set; adaptive re-splitting) and the **closure-based leakage-resistant design** (the scorer is a closure over sealed test data).
- Scoring: MSE, **parsimony/complexity**, composite $\Score = \mathrm{MSE} + \lambda C$ (lower is better). **Eval hacking / Goodhart**: any metric pointed at by a persistent optimizer is attacked.
- **Harness as a contract** `(score, report)` — stable across Challenges 2–4 and reused unchanged as the Ch.9 fitness function. This is the mechanical realization of Spine 1.

## Directions
- **Settle a single complexity measure.** The text currently offers two ("nodes in the expression tree" *or* "operations to evaluate") and then asserts the $f_1{=}2$, $f_2{=}5$ example without a counting rule. Pick **node count**, define it once where "complexity" first appears, and show the node counts that yield 2 and 5 (baseline rigor).
- **Fix the "Trivial re-parameterization" exploit.** Replacing $2\cdot x$ with a fitted constant $c$ is *not* "the same model" — $c$ is constant in $x$, $2x$ is not. Restate as: a fitted coefficient $c\cdot x$ vs a literal $2\cdot x$ differ in node count under the parsimony term, so the metric rewards the re-parameterization even though the *function class* is unchanged (baseline rigor — this is a genuine logical error).
- **Credit Goodhart** (Goodhart 1975 / Strathern 1997) at Principle~GoodhartsLaw — named and indexed but uncredited (novelty).
- **Repair the Sculley 2014 citation** — its title ("Challenging Common Assumptions in the Unsupervised Pretraining...") does not support "a classic treatment of evaluation pitfalls." Replace with a correct leakage/reproducibility reference; Kapoor & Narayanan 2023 already carries the leakage claim (baseline referee).

## Decisions
- 2026-07-10: sign convention "lower is better" fixed in this chapter and carried through elitism (Ch.9) — rigor panel confirmed the manuscript is internally consistent on the convention, so do not disturb it.
- 2026-07-10 (realized in prose): complexity now defined once as node count (with the $f_1{=}3$/$f_2{=}9$ counting shown); the "trivial re-parameterization" exploit restated correctly as node count undercounting fitted-constant degrees of freedom (the false "$c$ and $2x$ are the same model" claim is gone). Still open: Goodhart citation, Sculley 2014 replacement.
<!-- EVOLVE-BLOCK-END -->

## Open questions
- Should $\lambda$ calibration guidance live here or in Ch.9's Fitness Design? Currently here (Remark); Ch.9 should mirror the *same* treatment for its cost knob $\alpha$.
