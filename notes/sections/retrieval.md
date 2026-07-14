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
- (no open prose directions; embedding softening, cosine band, RAG/ANN citations, contextual retrieval, and the grounding-hurts remark all realized — see Decisions)

## Decisions
- 2026-07-10: cosine over Euclidean justified by magnitude-invariance; kept exact search as the default because course corpora are small (hundreds–thousands of passages), with ANN as the scaling note.
- 2026-07-10 (realized in prose): embedding Definition softened from a universal strict inequality over all triples to a "trained so that, for most triples" statistical statement, with an explicit "no finite-dimensional embedding orders every triple correctly" caveat.
- 2026-07-10 (realized in prose): added the **RAG inline citation** (Lewis et al., 2020) at first mention; added a **cosine-band caveat** — trained text-embedding cosines occupy a compressed positive band, so the example's $0.23$ means "much less similar," not literal orthogonality (rigor nit).
- 2026-07-10 (realized in prose, currency): added a **§Contextual Retrieval** subsection (Anthropic, 2024) — prepend chunk-specific document context before embedding/keyword-indexing (a modification of the *embed* stage, not the architecture), with the ~1/3 and ~1/2 failure-reduction figures scoped to the source's benchmark; a **reranking** remark (cheap high-recall stage → precise second stage, ~2/3 reduction) and a **prompt-caching cost** remark; a §Keyword-vs-Semantic note that current practice is **hybrid**; a **long-context-vs-retrieval caveat** Remark (skip the index when the corpus fits the window, Anthropic 2023/2024); and a 2024 Further Reading entry. Still open: promote "When Grounding Hurts" to a named block; ANN/FAISS inline citation (Johnson et al., 2021).
- 2026-07-10 (realized in prose, clarity): **`embed_fn` de-black-boxed** in the `FlatIndex` listing — a comment names it as any embedding API call (e.g. `client.embeddings.create(...)`), so a non-CS reader sees where the vectors come from; the `query` path now mirrors the build-time zero-norm guard (rigor nit).
- 2026-07-10 (realized in prose): promoted the **grounding-hurts** lesson to a named `\begin{remark}` framed as "the Challenge 3 ablation exists to quantify this tradeoff, not presume it"; added the **ANN/FAISS inline citation** (Johnson et al., 2021) at the ANN mention; added a **zero-norm guard** (`np.maximum(norms, 1e-12)`) to `FlatIndex` (rigor nit).
- 2026-07-11 (realized in prose, visual): added the **RAG pipeline figure** (`figure:RAGPipeline`) at §The RAG Architecture — the chapter's named central abstraction, previously prose-only and the panel's most-cited coverage gap. Five left-to-right query-time nodes (query $\to$ embed $\to$ vector index search $\to$ top-$k$ passages $\to$ model reads augmented context) with a **dashed sealed-corpus store** feeding the index on the offline chunk+embed path; cited inline with `Figure~\ref` at the introducing sentence. House `box`/`arr`/`stealth'` style; wrapped in `\resizebox{\textwidth}` so the six-across pipeline never overflows.
- 2026-07-11 (realized in prose, engineering-blog pass, visual): added `figure:RetrievalStaircase` — retrieval failure rate falling in stackable increments (contextual embeddings, then keyword, then rerank; ~1/3, 1/2, 2/3), cited at the composable-reductions sentence; ties Ch.~Retrieval quality to the Ch.~Evaluation evaluation mindset. Numbers hedged as benchmark-specific.
- 2026-07-14 (panel attempt-17, visual — mechanical): migrated `figure:RAGPipeline` to source the shared `concept-style.tex` (local box/arr now derive from conceptbox/conceptflow; per-figure width/height kept) as part of the cross-chapter conceptual-figure unification. `figure:RetrievalStaircase` is a bar-chart plot, left as-is per concept-style's boxes-and-arrows-only scope. Not a spine change.
- 2026-07-14 (panel attempt-18, currency): added a **structural-retrieval (GraphRAG) Remark** after contextual retrieval — when relationships between entities carry the answer more than passage similarity, build a graph over extracted entities/relations and retrieve connected subgraphs; heavier/brittler indexing vs better multi-hop recall, gated on the same grounding ablation (§GroundingConstraint). Named Further Reading entry (Edge et al., Microsoft, 2024; no arXiv id asserted). Closes the currency reviewer's structural-retrieval gap.

<!-- EVOLVE-BLOCK-END -->

## Open questions
- Do we need a worked "dimensional filtering" code example to match the "form seeding" concreteness? Possibly; the constraint-mechanism subsection is currently prose-only.
