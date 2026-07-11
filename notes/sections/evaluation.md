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
- (no open prose directions for this chapter; the rigor/novelty/referee items flagged at baseline are realized — see Decisions)

## Decisions
- 2026-07-10: sign convention "lower is better" fixed in this chapter and carried through elitism (Ch.9) — rigor panel confirmed the manuscript is internally consistent on the convention, so do not disturb it.
- 2026-07-10 (realized in prose): complexity now defined once as node count (with the $f_1{=}3$/$f_2{=}9$ counting shown); the "trivial re-parameterization" exploit restated correctly as node count undercounting fitted-constant degrees of freedom (the false "$c$ and $2x$ are the same model" claim is gone).
- 2026-07-10 (realized in prose): **Goodhart credited** at Principle~GoodhartsLaw — an attribution sentence names Charles Goodhart (1975, the policy-target collapse) and Strathern (1997, the compact "measure under optimization" formulation). **Sculley citation repaired** — the mis-titled "Challenging Common Assumptions..." reference is replaced by Sculley, Snoek, Wiltschko & Rahimi, "Winner's Curse? On Pace, Progress, and Empirical Rigor" (ICLR Workshop 2018), a correctly-titled, on-topic call for evaluation discipline.
<!-- EVOLVE-BLOCK-END -->

## Open questions
- Should $\lambda$ calibration guidance live here or in Ch.9's Fitness Design? Currently here (Remark); Ch.9 should mirror the *same* treatment for its cost knob $\alpha$.
