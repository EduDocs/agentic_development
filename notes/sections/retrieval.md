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
- **Promote "When Grounding Hurts" to a named `\subsection` or `\begin{remark}`** with a one-line frame ("Challenge 3 requires the ablation precisely to build this intuition") — currently buried mid-section where students can't locate it (baseline clarity/pedagogy).
- Add the remaining claim-site inline citation for ANN/FAISS (Johnson et al., 2021).

## Decisions
- 2026-07-10: cosine over Euclidean justified by magnitude-invariance; kept exact search as the default because course corpora are small (hundreds–thousands of passages), with ANN as the scaling note.
- 2026-07-10 (realized in prose): embedding Definition softened from a universal strict inequality over all triples to a "trained so that, for most triples" statistical statement, with an explicit "no finite-dimensional embedding orders every triple correctly" caveat.
- 2026-07-10 (realized in prose): added the **RAG inline citation** (Lewis et al., 2020) at first mention; added a **cosine-band caveat** — trained text-embedding cosines occupy a compressed positive band, so the example's $0.23$ means "much less similar," not literal orthogonality (rigor nit).
- 2026-07-10 (realized in prose, currency): added a **§Contextual Retrieval** subsection (Anthropic, 2024) — prepend chunk-specific document context before embedding/keyword-indexing (a modification of the *embed* stage, not the architecture), with the ~1/3 and ~1/2 failure-reduction figures scoped to the source's benchmark; a **reranking** remark (cheap high-recall stage → precise second stage, ~2/3 reduction) and a **prompt-caching cost** remark; a §Keyword-vs-Semantic note that current practice is **hybrid**; a **long-context-vs-retrieval caveat** Remark (skip the index when the corpus fits the window, Anthropic 2023/2024); and a 2024 Further Reading entry. Still open: promote "When Grounding Hurts" to a named block; ANN/FAISS inline citation (Johnson et al., 2021).
<!-- EVOLVE-BLOCK-END -->

## Open questions
- Do we need a worked "dimensional filtering" code example to match the "form seeding" concreteness? Possibly; the constraint-mechanism subsection is currently prose-only.
