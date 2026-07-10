# retrieval — scratch

> Sidecar for `retrieval.tex`. Not part of the LaTeX build.
> The EVOLVE-BLOCK below is the shareable spine exported to reviewers and elites;
> everything outside it is private scratch you may freely edit.

## Purpose
Extend the effective knowledge in a fixed window via retrieval, and make the
honest point that grounding sometimes *hurts*.

<!-- EVOLVE-BLOCK-START -->
## Key points / spine
- An agent knows only what it reads; parametric knowledge is broad but stale. **RAG** injects curated domain knowledge at the point of need.
- Retrieval problem: pick the top-$k$ passages of a corpus $\mathcal{K}$ for a query $q$. **Keyword vs semantic** retrieval; semantic wins when vocabulary differs ("drag force" vs "aerodynamic resistance").
- **Embeddings** $\phi : V^* \to \RealNumbers^d$ and **cosine similarity**; **vector search** as $k$-NN (exact $O(Nd)$ vs ANN); index pipeline chunk → embed → index.
- **Grounding as constraint**: form seeding + dimensional filtering shrink the proposal space to a plausible region.
- **Grounding can hurt** when the retrieved prior is misaligned (the $e^{-x_1^2}\sin(x_2)$ example) — the Challenge 3 ablation exists to quantify the tradeoff. This negative result is a first-class teaching point, not a caveat.

## Directions
- **Soften the embedding Definition.** The current universal strict inequality over *all* triples $p_1,p_2,p_3$ is unsatisfiable in $\RealNumbers^d$; restate as a statistical/monotone property ("trained so that similarity *tends to* be larger for more-similar pairs") so it is not a false theorem-shaped claim (baseline rigor).
- **Promote "When Grounding Hurts" to a named `\subsection` or `\begin{remark}`** with a one-line frame ("Challenge 3 requires the ablation precisely to build this intuition") — currently buried mid-section where students can't locate it (baseline clarity).
- Add inline citations at claim sites (RAG: Lewis et al. 2020; ANN/FAISS: Johnson et al. 2021).

## Decisions
- 2026-07-10: cosine over Euclidean justified by magnitude-invariance; kept exact search as the default because course corpora are small (hundreds–thousands of passages), with ANN as the scaling note.
<!-- EVOLVE-BLOCK-END -->

## Open questions
- Do we need a worked "dimensional filtering" code example to match the "form seeding" concreteness? Possibly; the constraint-mechanism subsection is currently prose-only.
