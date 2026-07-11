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
- (no open prose directions; the eval-becomes-fitness hinge is now shown by a worked example — see Decisions)

## Decisions
- 2026-07-10: the chapter deliberately presents evolution as "orchestration + mutation" so the pivot inherits every reliability lesson from Ch.8; the two-spines convergence is stated at the mutator, the conceptual climax of the book.
- 2026-07-10 (realized in prose): cost-adjusted fitness now uses the marginal $\mathrm{cost}(a)$ (renamed from $C$ to avoid clashing with complexity $C$), with prose explaining why a run-shared constant cannot reorder intra-run candidates; $\alpha$ given the same units/default/tradeoff treatment as $\lambda$.
- 2026-07-10 (realized in prose): **"1990s GP" strawman replaced.** The LLM-mutation advantage is now framed against the real ladder baseline — mature GP libraries such as **PySR**, whose variation operators remain essentially blind tree edits — rather than against obsolete methods; the contrast is *guided, domain-informed* mutation vs blind tree edits. AlphaEvolve ("beating Strassen \emph{in certain settings}", DeepMind 2025) and FunSearch now carry venue/date tags and the settings hedge, so the fast-moving-results ask is satisfied.
- 2026-07-10 (realized in prose, clarity): added a closing **§What You Have Built** before Further Reading — names the nine components the student has assembled and frames the capstone as "these components pointed at your own research problem," so the arc lands rather than trailing off into a reading list.
- 2026-07-10 (realized in prose): added the **end-to-end worked SR example** at the two-spines convergence — one artifact (`x0*exp(-x1)`, MSE 0.0045/C 5/score 0.0055) flows out of the Ch.6 harness, through Ch.8 GES selection, into the mutation prompt, and the returned variant (`x0*exp(-x1/x2)`, score 0.0035) is re-scored by the *same* harness and kept. Shows "one harness, one score, two roles" concretely rather than asserting the hinge.
- 2026-07-10 (realized in prose, rigor nits): §EvolutionaryLoop now **opens by citing Def.~GenEvalSel** ("already in place; this chapter adds the one missing ingredient"); the mutation example's `x0 * exp(-x1)` is **recounted to complexity 5** under Ch.6's node-count rule (x0, *, exp, unary-minus, x1) with the score line annotated $\Score = \mathrm{MSE} + \lambda C$, $\lambda = 0.0002$; Def.~SymbolicRegression's **cross-reference corrected** to eq~CompositeScore for the composite score, keeping the harness-tuple reference only for $\mathcal{D}_{\mathrm{test}}$; FunSearch's **Nature year aligned to 2024 (online 2023)** in both the Lineage prose and Further Reading.
<!-- EVOLVE-BLOCK-END -->

## Open questions
- Is cost-aware search better as its own chapter section or folded into Fitness Design? Currently separate; the $\alpha$/$\lambda$ symmetry argues for cross-referencing at least.
