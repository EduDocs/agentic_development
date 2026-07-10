# evolutionary_frameworks — scratch

> Sidecar for `evolutionary_frameworks.tex`. Not part of the LaTeX build.
> The EVOLVE-BLOCK below is the shareable spine exported to reviewers and elites;
> everything outside it is private scratch you may freely edit.

## Purpose
Close the arc: GES + mutation = evolution. Formalize the loop, develop its
components, and trace the FunSearch → AlphaEvolve → OpenEvolve lineage.

<!-- EVOLVE-BLOCK-START -->
## Key points / spine
- **The pivot is one step**: the GES loop of Ch.8 plus a **mutation operator** is an evolutionary search. Framework tuple $(\Artifacts, \Fitness, \Mutate, \Select, \Population_0)$ with $\Population_{t+1} = \Select(\Population_t \cup \{\Mutate(a) : a \in \Select(\Population_t)\})$.
- **Mutation**: classical GP subtree/point/crossover is *blind*; the **LLM mutation operator** is *knowledge-guided* — it reads the best expression, the data, and retrieved domain context to propose a motivated variant.
- **Context engineering for the mutator** is where the two spines converge: evaluation-becomes-fitness (Spine 1) supplies the selection signal; context-engineering (Spine 2) supplies the mutator's proposals.
- Selection/population: elitism (best score monotonically non-increasing), tournament vs top-$k$, **population collapse** as the dominant student failure mode. Fitness landscapes, islands + migration, explore/exploit.
- **Lineage**: FunSearch (programs, automatic evaluator) → AlphaEvolve (full algorithms, scaled) → OpenEvolve (hackable reference impl for the capstone). SR is the vehicle (auto-evaluable, domain-portable, interpretable, baselined); the **baseline ladder** positions the agent honestly against linear regression and PySR.

## Directions
- **Fix cost-adjusted fitness.** As defined, $\tilde f(a) = f(a) + \alpha C$ with $C$ the *total run cost* is a constant shared by every artifact of a run, so it cannot reorder candidates *within* a run — yet the prose claims it "prefers a cheaper proposer." Either make $C = C(a)$ the **marginal** cost of producing/evaluating $a$, or explicitly scope $\tilde f$ to **cross-run/cross-model** comparison and say a shared additive $\alpha C$ does not reorder intra-run (baseline rigor + referee).
- **Give $\alpha$ the same calibration treatment $\lambda$ gets** in Ch.6: units, a default, and how it trades against the MSE scale — referee flagged the asymmetry between the two multi-objective knobs.
- **Replace the "1990s GP" strawman.** The real baseline students face is **PySR** (modern GP, already on the baseline ladder). Reframe the LLM advantage as *guided, domain-informed* mutation rather than a contrast with obsolete methods (baseline novelty).
- **Hedge the fast-moving results**: add one-clause venue/date qualifiers to the AlphaEvolve-2025 "beats Strassen" and FunSearch claims so no statement outruns its source (referee).
- **Add one end-to-end worked SR example** carried from the Ch.6 harness → Ch.8 GES → Ch.9 mutation, to make the "eval becomes fitness" hinge tangible rather than asserted (referee).

## Decisions
- 2026-07-10: the chapter deliberately presents evolution as "orchestration + mutation" so the pivot inherits every reliability lesson from Ch.8; the two-spines convergence is stated at the mutator, the conceptual climax of the book.
<!-- EVOLVE-BLOCK-END -->

## Open questions
- Is cost-aware search better as its own chapter section or folded into Fitness Design? Currently separate; the $\alpha$/$\lambda$ symmetry argues for cross-referencing at least.
