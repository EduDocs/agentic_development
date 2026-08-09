---
videos:
  - title: From Words to Attention
    url: https://youtu.be/gpdenPUcwuY
  - title: From Scale to Agents
    url: https://youtu.be/U96X7U5MC9c
external:
  - title: What is a neural network
    url: https://youtu.be/aircAruvnKk
    source: 3Blue1Brown
    source_url: https://www.youtube.com/@3blue1brown
  - title: Gradient descent, how neural networks learn
    url: https://youtu.be/IHZwWFHWa-w
    source: 3Blue1Brown
    source_url: https://www.youtube.com/@3blue1brown
  - title: Backpropagation, intuitively
    url: https://youtu.be/Ilg3gGewQ5U
    source: 3Blue1Brown
    source_url: https://www.youtube.com/@3blue1brown
  - title: Backpropagation calculus
    url: https://youtu.be/tIeHLnjs5U8
    source: 3Blue1Brown
    source_url: https://www.youtube.com/@3blue1brown
  - title: Large Language Models
    url: https://youtu.be/LPZh9BOjkQs
    source: 3Blue1Brown
    source_url: https://www.youtube.com/@3blue1brown
  - title: Transformers
    url: https://youtu.be/wjZofJX0v4M
    source: 3Blue1Brown
    source_url: https://www.youtube.com/@3blue1brown
  - title: Attention
    url: https://youtu.be/eMlx5fFNoYc
    source: 3Blue1Brown
    source_url: https://www.youtube.com/@3blue1brown
---

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
  7. **Models → agents** (2022+) — instruction tuning/RLHF, chain-of-thought, tool use/ReAct → perceive–reason–act = the agent of Ch.~AgenticParadigm. The prose now also *names the technique landscape* around this core (self-consistency, tree-of-thoughts, Reflexion; RLAIF/constitutional and RL-for-reasoning on the training side) as a field, not a single trick, with forward-pointers; and it continues the chain past tool use to reasoning models and multimodality.
- **Timeline table** (`table:AgenticTimeline`): Year | Breakthrough | What it unlocked — the per-milestone granularity the prose groups into eras, serving the "carry a conversation about the timeline" goal.
- **Two figures** carry the visual load: (a) `figure:Transformer` — the full encoder–decoder Transformer (Vaswani 2017), whose caption teaches the architecture at a glance and marks the **decoder-only GPT lineage** as the branch that drops the encoder and encoder–decoder attention (the split the pre-training bullet leans on); (b) `figure:AgenticChain` — the lineage as a causal chain (each arrow = the limitation the next step removed), flanked by pale **History** cards (the unretraced prehistory) and faded **Agents** nodes (the open-ended landscape these notes *sample rather than survey*).
- **Register**: high-level and cited (inline author-year + a Further Reading list), not a methods tutorial. Placement: opening chapter (Ch.~1), a prologue *before* the capability ladder rather than a rung on it.
- **Two deployment shifts** (an adoption axis, distinct from the research chain): ChatGPT (Nov 2022) put an instruction-tuned model in front of the public; agentic coding (Dec 2025, e.g. Opus 4.6) crossed an "as reliable as a junior engineer on well-specified tasks" threshold. Framed as *when a legible research chain is felt from outside as a sudden arrival* (callback to the intro's "feels sudden").
- **Why attend, for discovery** (the chapter's second *Why*, added late): once available, agents give order-of-magnitude (sometimes two) speedups on well-specified, cheaply-checked tasks, hedged (they shrink where judgment, novelty, or trust binds); the reach is cross-disciplinary (biologist / economist / physicist / chemist); the payoff is *discovery* because "propose, run, check, repeat" is the research inner loop the course's generate-evaluate-select capstone makes literal. Closes on "what these notes are for."

## Directions
- (no open prose directions yet — this is a fresh draft; candidate refinements live in Decisions/Open questions)

## Decisions
- 2026-07-11 (draft created): placed as the **opening chapter** (before `agentic_paradigm`), not an appendix and not mid-ladder — the preface frames "nine chapters follow the ladder" and a history chapter is a prologue, *off* the ladder, so it opens the book and hands off to Ch.~AgenticParadigm. Preface got a one-bullet accommodation (the "nine ladder chapters" framing is preserved; the history chapter is named as the prologue).
- 2026-07-11: **citations kept to the house convention** — inline author-year in prose + a hand-written Further Reading enumerate, **no `\cite`** (avoids the undefined-citation metrics gate; matches every other chapter). Backbone = the seven ingested milestone papers; the model-to-agent step cites Ouyang 2022 (InstructGPT), Wei 2022 (CoT, already in the book), Yao 2023 (ReAct, already in the book).
- 2026-07-11: **grouped seven papers into four eras** (geometry / Transformer+pretraining / scale+grounding / models→agents) for succinctness, with the timeline table carrying per-paper granularity. Every era forward-links to the chapter that develops it, so the prologue seeds the book without duplicating it.
- 2026-07-12 (panel R1 fixes): repointed the analogy from the king–queen *offset* (which is the NAACL 2013 "Linguistic Regularities" paper) to the **additive-compositionality** example (Germany+capital≈Berlin) that the *cited* NeurIPS paper actually contains — rigor citation-accuracy nit. Reconciled the **BERT 2018/2019** year in the table caption (preprint vs venue). Extended the timeline to the present: split the agents row (2022–23) and added a **2024–26 reasoning-models + multimodality** row with a closing paragraph, so the "2022+" endpoint no longer misleads a 2026 reader (currency reviewer's top ask); wired to Ch.~AgentLoop's reasoning-model treatment. (In retrieval.tex, annotated the cosine `embed()` example as an illustrative stand-in.)
- 2026-07-12 (panel R2 fixes, visual + rigor): added `figure:AgenticChain` — the causal chain drawn as seven milestone boxes (word2vec → ... → agents) with each arrow labelled by the limitation the next step removed and years below; makes the chapter's "dependency, not a list" thesis a visual object (visual reviewer's top ask; Ch.1 was figureless). Rigor: corrected the attention lineage — **additive attention (Bahdanau 2015) came first within RNNs; the Transformer's contribution was removing recurrence** (added a clause + a Further Reading entry, so the chain no longer misattributes the bottleneck fix); sharpened the attention-budget claim to the checkable softmax-normalization mechanism.
- 2026-07-12 (external REVIEW.md pass): walked back the attention-budget claim per the reviewer — it is now labelled a **heuristic, not a theorem**, with architectural cost (quadratic compute/memory) separated from behavioral degradation (empirical retrieval loss); reframed the causal chain as a **selected teaching lineage** (not sole causation — datasets/hardware/RLHF run alongside); named the **decoder/GPT line** (GPT, GPT-2) explicitly; qualified **RAG attribution** (only when provenance is preserved and validated); de-conflated the **2022–23 timeline row** into instruction tuning + reasoning + tool use; fixed the "imprtant" typo and the "modern retrieval … runs on" grammar.
- 2026-07-12 (prose-led, tex2md): the chapter grew a *second purpose* beyond "how we got here." Three additions: (1) a **technique-landscape** paragraph naming the reasoning/acting field (self-consistency, tree-of-thoughts, Reflexion; RLAIF/constitutional; RL-for-reasoning) as named-not-detailed, with forward-pointers; (2) two **deployment shifts** (ChatGPT Nov 2022, agentic coding / Opus 4.6 Dec 2025) as an adoption axis distinct from the research lineage, tied to the intro's "feels sudden"; (3) a **researcher-impetus closing** in §NotRandom answering *why attend, for discovery* (order-of-magnitude gains on well-specified/checkable tasks, hedged; cross-disciplinary; "propose, run, check, repeat" foreshadowing the generate-evaluate-select capstone; "what these notes are for"). This let the model-to-agent section breathe while staying high-level. Also: chapter title shortened to "From Word Vectors to Agents"; a wide timeline table set to `\small` with a narrower text column to fit `\textwidth`, and `\belowcaptionskip` raised for caption spacing.
- 2026-07-13 (tex2md): recorded two **figure** changes the sidecar had not caught. (1) `figure:Transformer` (`figures/transformer`, user-provided) — a full encoder–decoder diagram with a teaching caption that makes the architecture concrete and states the **decoder-only GPT branch drops the encoder + encoder–decoder attention**, the distinction the prose leans on. (2) `figure:AgenticChain` enriched past its R2 form: the seven-box chain is now flanked by pale **History** cards (unretraced prehistory) and a faded tuning→CoT→ReAct→**Agents** sub-chain (the landscape "sampled rather than surveyed"), encoding both the deep past and the open future. Also: chapter title shortened to **"From Words to Agents."** (Table 1.1's right column was made ragged-right — presentation only, not a spine change.)
<!-- EVOLVE-BLOCK-END -->

## Open questions
- (resolved 2026-07-12) ~~TikZ horizontal timeline vs. the table~~ → `figure:AgenticChain` was added (and reworked by the user); it now carries the chain structure alongside the table.
- (resolved 2026-07-12) ~~model-to-agent section too compressed~~ → it breathed via the technique-landscape, two-shifts, and reasoning-models paragraphs, staying high-level (named, not detailed) rather than becoming a methods subsection.
- **Style (settled)**: the user avoids em dashes; new prose uses colons / commas / parentheses, and em dashes are converted only when a passage is already being edited (not churned wholesale). Supersedes the earlier "split em-dash-heavy sentences?" question.
