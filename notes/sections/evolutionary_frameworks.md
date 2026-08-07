---
videos:
  - title: Evolutionary Frameworks
    url: https://youtu.be/2yIudqkJb6U
---

# evolutionary_frameworks — scratch

> Sidecar for `evolutionary_frameworks.tex`. Not part of the LaTeX build.
> The EVOLVE-BLOCK below is the shareable spine exported to reviewers and elites;
> everything outside it is private scratch you may freely edit.

## Purpose
Close the arc: GES + mutation = evolution. Formalize the loop, develop its
components, and trace the FunSearch → AlphaEvolve → OpenEvolve lineage.

<!-- EVOLVE-BLOCK-START -->
## Key points / spine
- **The pivot is one step**: the GES loop of Ch.~Orchestration plus a **mutation operator** is an evolutionary search. Framework tuple $(\Artifacts, \Fitness, \Mutate, \Select, \Population_0)$ with $\Population_{t+1} = \Select(\Population_t \cup \{\Mutate(a) : a \in \Select(\Population_t)\})$.
- **Mutation**: classical GP subtree/point/crossover is *blind*; the **LLM mutation operator** is *knowledge-guided* — it reads the best expression, the data, and retrieved domain context to propose a motivated variant.
- **Context engineering for the mutator** is where the two spines converge: evaluation-becomes-fitness (Spine 1) supplies the selection signal; context-engineering (Spine 2) supplies the mutator's proposals. `figure:TwoSpinesConverge` makes this the book's visual climax: Spine 1 *becomes* the Fitness node, Spine 2 *drives* the Mutate node, the two dashed spine-arrows feeding the solid evolutionary loop.
- Selection/population: elitism (best score monotonically non-increasing), tournament vs top-$k$, **population collapse** as the dominant student failure mode. Fitness landscapes, islands + migration, explore/exploit.
- **Lineage**: FunSearch (programs, automatic evaluator) → AlphaEvolve (full algorithms, scaled) → OpenEvolve (hackable reference impl for the capstone). SR is the vehicle (auto-evaluable, domain-portable, interpretable, baselined); the **baseline ladder** positions the agent honestly against linear regression and PySR.

## Directions
- (no open prose directions; the eval-becomes-fitness hinge is now shown by a worked example — see Decisions)

## Decisions
- 2026-07-10: the chapter deliberately presents evolution as "orchestration + mutation" so the pivot inherits every reliability lesson from Ch.~Orchestration; the two-spines convergence is stated at the mutator, the conceptual climax of the book.
- 2026-07-10 (realized in prose): cost-adjusted fitness now uses the marginal $\mathrm{cost}(a)$ (renamed from $C$ to avoid clashing with complexity $C$), with prose explaining why a run-shared constant cannot reorder intra-run candidates; $\alpha$ given the same units/default/tradeoff treatment as $\lambda$.
- 2026-07-10 (realized in prose): **"1990s GP" strawman replaced.** The LLM-mutation advantage is now framed against the real ladder baseline — mature GP libraries such as **PySR**, whose variation operators remain essentially blind tree edits — rather than against obsolete methods; the contrast is *guided, domain-informed* mutation vs blind tree edits. AlphaEvolve ("beating Strassen \emph{in certain settings}", DeepMind 2025) and FunSearch now carry venue/date tags and the settings hedge, so the fast-moving-results ask is satisfied.
- 2026-07-10 (realized in prose, clarity): added a closing **§What You Have Built** before Further Reading — names the nine components the student has assembled and frames the capstone as "these components pointed at your own research problem," so the arc lands rather than trailing off into a reading list.
- 2026-07-10 (realized in prose): added the **end-to-end worked SR example** at the two-spines convergence — one artifact (`x0*exp(-x1)`, MSE 0.0045/C 5/score 0.0055) flows out of the Ch.~Evaluation harness, through Ch.~Orchestration GES selection, into the mutation prompt, and the returned variant (`x0*exp(-x1/x2)`, score 0.0035) is re-scored by the *same* harness and kept. Shows "one harness, one score, two roles" concretely rather than asserting the hinge.
- 2026-07-11 (realized in prose, visual): **split the conflated `Generate / Mutate` node** in `figure:EvolutionaryLoop` into distinct **Generate** (seeded once by $\Population_0$) and **Mutate** (fed the survivors from Select) nodes, both flowing into Evaluate — so the chapter's *one new ingredient* is visible in the figure, not erased. The figure is now **summoned by `Figure~\ref`** at its introducing sentence (it previously floated, labelled but uncited), and the caption names Mutate as the node absent from the GES loop of Ch.~\ref{chapter:Orchestration}.
- 2026-07-10 (realized in prose, rigor nits): §EvolutionaryLoop now **opens by citing Def.~GenEvalSel** ("already in place; this chapter adds the one missing ingredient"); the mutation example's `x0 * exp(-x1)` is **recounted to complexity 5** under Ch.~Evaluation's node-count rule (x0, *, exp, unary-minus, x1) with the score line annotated $\Score = \mathrm{MSE} + \lambda C$, $\lambda = 0.0002$; Def.~SymbolicRegression's **cross-reference corrected** to eq~CompositeScore for the composite score, keeping the harness-tuple reference only for $\mathcal{D}_{\mathrm{test}}$; FunSearch's **Nature year aligned to 2024 (online 2023)** in both the Lineage prose and Further Reading.
- 2026-07-11 (realized in prose, engineering-blog pass): added an **eval-awareness / sandboxed-fitness** Remark to Fitness Design — a tool-enabled optimizer can recognize the eval and locate answer keys, so run fitness in a sandbox with no route to the sealed split or open web (2026); Further Reading on eval-awareness and AI-resistant-evals.
- 2026-07-11 (realized in prose, practitioner-thread pass): added a **'why an outer loop when the model can think?'** Remark at the chapter opening — extended thinking internalizes some search, but the loop stays irreducible because the evaluator is an external oracle (Spine 1) and rugged combinatorial search exceeds bounded per-call compute; try internal deliberation as a baseline first.
- 2026-07-14 (panel attempt-17, visual): added **`figure:TwoSpinesConverge`** at the two-spines convergence — the reviewer's top visual ask (the stated conceptual climax had no visual object). Evaluation Harness *becomes* the Fitness node (Spine 1), Context Engineering *drives* the Mutate node (Spine 2); dashed spine-arrows feed the solid loop (candidates → scored → survivors). Built on the shared `concept-style.tex`. Separately, migrated `figure:EvolutionaryLoop` to source `concept-style.tex` (box→conceptbox, arr→conceptflow; standardized to the 2.4cm base) as part of the cross-chapter conceptual-figure unification — mechanical, not a spine change.
- 2026-08-06 (de-course-ification): Challenge references scrubbed — the mutator's retrieved context now points at Ch.~Retrieval, the population-collapse diagnostic at the GES loop of Ch.~Orchestration, the baseline ladder drops the "Challenge~1" tag on linear regression, the cost-adjusted-fitness tie-in points at Ch.~Orchestration's multi-model benchmarking, and `figure:EvolutionaryLoop`'s caption sources fitness from Ch.~Evaluation rather than "the harness built in Challenge~2". Part of the repo-wide pass that also hit Ch.~Evaluation / Ch.~Retrieval / Ch.~Orchestration.
- 2026-08-06 (visual, single-column fit): `figure:EvolutionaryLoop` re-laid out from a narrow two-column stack (which used about a third of the measure) into a wide left-to-right loop — Generate→Evaluate→Select along one row, Mutate beneath Evaluate closing the cycle clockwise, and the $\Population_0$ seed kept off the cycle on the left. The two diagonal edges into Evaluate are gone (all-orthogonal now) and the return path is routed off node anchors instead of a hard-coded `++(0,-0.8)` offset. Topology unchanged from the 2026-07-11 Generate/Mutate split; only the geometry moved.
- 2026-08-06 (caption, correctness): "\emph{Mutate} — not \emph{Generate} — **consumes** the survivors" became "it is \emph{Mutate}, not \emph{Generate}, that **takes the survivors as input** ... rather than drawn afresh". "Consumes" implied the elite is spent, which contradicts the union in eq~EvolutionaryLoop (survivors persist *alongside* their mutations) and the §EvolutionaryLoop line "good structure is not discarded, it is carried forward and explored around". It was also pipeline jargon for an audience assumed to have no CS background.
<!-- EVOLVE-BLOCK-END -->

## Open questions
- Is cost-aware search better as its own chapter section or folded into Fitness Design? Currently separate; the $\alpha$/$\lambda$ symmetry argues for cross-referencing at least.
