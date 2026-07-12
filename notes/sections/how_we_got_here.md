# how_we_got_here — scratch

> Sidecar for `how_we_got_here.tex`. Not part of the LaTeX build.
> The EVOLVE-BLOCK below is the shareable spine exported to reviewers and elites;
> everything outside it is private scratch you may freely edit.

## Purpose
Open the book with a high-level, cited timeline of how the field reached agentic
AI, so the reader carries a legible lineage into the formal material and can talk
about the milestones. Grounded in the seven milestone papers in `resources/arXiv-*`
(word2vec ×2, seq2seq, Transformer, BERT, GPT-3, RAG) plus the model-to-agent step
(instruction tuning, chain-of-thought, ReAct — already cited elsewhere in the book).

<!-- EVOLVE-BLOCK-START -->
## Key points / spine
- **Thesis**: LLM success is a *consequence*, not an accident — a chain of dated breakthroughs, each removing a concrete limitation of the previous one. The reader should leave able to hold the timeline in their head and discuss it.
- **The chain (one question asked more powerfully each time — "how should a machine represent and manipulate language?")**:
  1. **Word embeddings** (word2vec, 2013) — meaning as a learned vector geometry; ancestor of retrieval embeddings (Ch.~Retrieval).
  2. **Seq2seq** (2014) — end-to-end sequence mapping; the fixed-vector bottleneck motivates attention.
  3. **Transformer** (2017) — attention replaces recurrence → parallelism → scale; also the mechanism behind the context/attention budget (Ch.~ContextEngineering).
  4. **Pre-training** (BERT 2018; GPT decoder line) — transferable, *contextual* representations; the successor to static vectors.
  5. **Scale + few-shot** (GPT-3, 2020) — steering a frozen model by text alone = the origin of prompting (Ch.~ContextEngineering); also surfaces leakage/contamination (Ch.~Evaluation).
  6. **RAG** (2020) — parametric + non-parametric memory; grounding, updatable/attributable knowledge (Ch.~Retrieval).
  7. **Models → agents** (2022+) — instruction tuning/RLHF, chain-of-thought, tool use/ReAct → perceive–reason–act = the agent of Ch.~AgenticParadigm.
- **Timeline table** (`table:AgenticTimeline`): Year | Breakthrough | What it unlocked — the per-milestone granularity the prose groups into eras, serving the "carry a conversation about the timeline" goal.
- **Register**: high-level and cited (inline author-year + a Further Reading list), not a methods tutorial. Placement: opening chapter (Ch.~1), a prologue *before* the capability ladder rather than a rung on it.

## Directions
- (no open prose directions yet — this is a fresh draft; candidate refinements live in Decisions/Open questions)

## Decisions
- 2026-07-11 (draft created): placed as the **opening chapter** (before `agentic_paradigm`), not an appendix and not mid-ladder — the preface frames "nine chapters follow the ladder" and a history chapter is a prologue, *off* the ladder, so it opens the book and hands off to Ch.~AgenticParadigm. Preface got a one-bullet accommodation (the "nine ladder chapters" framing is preserved; the history chapter is named as the prologue).
- 2026-07-11: **citations kept to the house convention** — inline author-year in prose + a hand-written Further Reading enumerate, **no `\cite`** (avoids the undefined-citation metrics gate; matches every other chapter). Backbone = the seven ingested milestone papers; the model-to-agent step cites Ouyang 2022 (InstructGPT), Wei 2022 (CoT, already in the book), Yao 2023 (ReAct, already in the book).
- 2026-07-11: **grouped seven papers into four eras** (geometry / Transformer+pretraining / scale+grounding / models→agents) for succinctness, with the timeline table carrying per-paper granularity. Every era forward-links to the chapter that develops it, so the prologue seeds the book without duplicating it.
- 2026-07-12 (panel R1 fixes): repointed the analogy from the king–queen *offset* (which is the NAACL 2013 "Linguistic Regularities" paper) to the **additive-compositionality** example (Germany+capital≈Berlin) that the *cited* NeurIPS paper actually contains — rigor citation-accuracy nit. Reconciled the **BERT 2018/2019** year in the table caption (preprint vs venue). Extended the timeline to the present: split the agents row (2022–23) and added a **2024–26 reasoning-models + multimodality** row with a closing paragraph, so the "2022+" endpoint no longer misleads a 2026 reader (currency reviewer's top ask); wired to Ch.~AgentLoop's reasoning-model treatment. (In retrieval.tex, annotated the cosine `embed()` example as an illustrative stand-in.)
- 2026-07-12 (panel R2 fixes, visual + rigor): added `figure:AgenticChain` — the causal chain drawn as seven milestone boxes (word2vec → ... → agents) with each arrow labelled by the limitation the next step removed and years below; makes the chapter's "dependency, not a list" thesis a visual object (visual reviewer's top ask; Ch.1 was figureless). Rigor: corrected the attention lineage — **additive attention (Bahdanau 2015) came first within RNNs; the Transformer's contribution was removing recurrence** (added a clause + a Further Reading entry, so the chain no longer misattributes the bottleneck fix); sharpened the attention-budget claim to the checkable softmax-normalization mechanism.
<!-- EVOLVE-BLOCK-END -->

## Open questions
- A TikZ horizontal timeline could replace or complement the table (the visual reviewer rewards figures); deferred to keep the draft succinct and low-risk — the table already serves the "hold the timeline" goal.
- Depth of the model-to-agent section: instruction tuning / CoT / ReAct are compressed into one paragraph. If a reviewer wants the agent step to breathe, it could become its own short subsection — but the risk is drifting from "high-level history" into methods the later chapters own.
- Should the em-dash-heavy sentences be split for the zero-background reader (pedagogy reviewer has flagged density elsewhere)? Watch on the next panel.
