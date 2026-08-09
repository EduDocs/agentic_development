---
videos:
  - title: Prompt and Context Engineering
    url: https://youtu.be/MNoIMWF6RdY
---

# context_engineering — scratch

> Sidecar for `context_engineering.tex`. Not part of the LaTeX build.
> The EVOLVE-BLOCK below is the shareable spine exported to reviewers and elites;
> everything outside it is private scratch you may freely edit.

## Purpose
Develop context engineering as the primary lever available to the agent builder,
from the "LLM as a function of its context" view down to automated and agentic context management.

<!-- EVOLVE-BLOCK-START -->
## Key points / spine
- **The LLM is a context-conditioned function** $M : V^* \to \Delta(\mathcal{A})$ (Eq.~ModelAsFunction), where $V$ is the (finite) token vocabulary and $V^*$ its finite sequences: output is determined by input.
- **Prompt engineering** (wording of a single instruction) vs **context engineering** (the whole window across a multi-step interaction) — the chapter separates the two disciplines. Prompt engineering is framed as *foundational but largely delegated*: its principles (specificity, format, examples, constraints, decomposition, CoT) still govern every instruction, including ones the agent writes for itself, but in agentic development the hand-crafting is delegated to the agent/platform, so it is taught to *specify* and *judge*, not as the day's work (the exploratory "(vestigial)" title tag was resolved to this precise framing).
- Practical levers: the instruction stack (system prompt / task / injected context / history), selective injection (Principle~SelectiveContext: inject the minimum for the *current step*), long-context strategies (retrieval, summarization, reference-not-inclusion).
- **Automated context management**: hooks/triggers and the `CLAUDE.md` hierarchy make the rig self-contextualizing; the instruction-stack **system-prompt** layer is realized by the project's `CLAUDE.md`/`AGENTS.md` instruction files (named early, at the stack, not only at the later hierarchy discussion).
- **Agentic context engineering** (the third Spine-2 level, §4.4.5): the context is assembled by a *trusted agent*, not the researcher, so the lever moves from choosing window contents to shaping the *environment* the agent searches. Scale asymmetry (Principle~StageNotInject): engineer-it-yourself = provision the window (bounded by your reading); empower-a-trusted-agent = provision the *corpus* (bounded only by storage, 10–100× larger). A conducive file system is **legible** (plain text / LaTeX, not PDF; grep/sed/ack), **catalogued** (an index the agent reads first), and **synopsis-fronted** (progressive disclosure over ~1000 papers). Buys *reverse* search (question → pertinent sources), where a grep-able corpus can beat approximate NN; vector/embedding machinery deferred to Ch.~Retrieval. Premised on trust (Ch.~AgenticRig/Ch.~AgenticCoding verification); forward-points to the capstone's domain-knowledge grounding.
- Context quality is *measured*, not asserted: ablation, prompt-sensitivity, leaderboard comparison.
- **Context rot / attention budget**: attention is pairwise across the sequence, so recall of any one fact falls as tokens grow — the mechanistic reading of lost-in-the-middle, and why raw capacity ≠ effective working memory. MCP consequence: load tool schemas by *progressive disclosure* (metadata cheap, full schema on demand), not by front-loading the whole catalogue.

## Directions
- (no open prose directions; roadmap, inline citations, 100K trajectory, and MCP all realized — see Decisions)

## Decisions
- 2026-07-10: Principle stated deterministically for pedagogical punch, but a one-clause caveat is owed since the same chapter introduces temperature; this is a self-consistency fix, not a reframing.
- 2026-07-10 (realized in prose): Principle~ContextDeterminesOutput now says context fixes the output *distribution*; the realized *sample* depends on temperature (below) and serving nondeterminism — reconciled with the Temperature subsection and the Ch.~Orchestration/Ch.~EvolutionaryFrameworks nondeterminism material.
- 2026-07-10 (realized in prose): added the **chapter roadmap** (one clause per section) after the opening; added **inline citations at the claim sites** — lost-in-the-middle (Liu et al., 2024) at the context-window Remark and chain-of-thought (Wei et al., 2022) at the CoT subsection.
- 2026-07-10 (realized in prose, currency): reframed the static "100K–1M tokens" figure as a **trajectory** (100K was a 2023 frontier jump, Anthropic 2023) with the surviving lesson "reason about how to *use* a window"; used the 2023 "just feed it everything" pitch as the historical foil for the lost-in-the-middle Remark; and made the retrieval-vs-long-context choice a two-sided **tradeoff** in §Long-Context Strategies.
- 2026-07-10 (realized in prose, currency): added a **§The Model Context Protocol** subsection to §Automated Context Management (Anthropic, 2024) — open client/server protocol, composability (write a server once, works across clients), framed as the protocol-level counterpart to the `CLAUDE.md` hierarchy. Also fixed the **Temperature** mechanism (divides logits by T before the softmax; T=0 is the limiting argmax case, not a literal division by zero).
- 2026-07-10 (realized in prose, visual): added the **lost-in-the-middle figure** (`figure:LostInTheMiddle`) at §Context Window — the window as a segmented bar (system prompt | instructions | documents/history | recent turns + query) under a U-shaped effective-use curve, annotated primacy/recency/lost-in-the-middle; the caption derives the "place load-bearing content near the edges" rule from the curve's shape. First figure of the visual-exposition push (a *visual* reviewer persona now sits on the panel).
- 2026-07-10 (realized in prose, currency): added a **§Prompt Caching** subsection — a stable prefix (system prompt, instruction files, injected reference doc) is cached at the API layer so later loop calls pay only for new tokens; framed as the dominant cost lever for evolutionary runs and wired to Ch.~EvolutionaryFrameworks §CostAwareSearch. Added the human token anchors (paper 8–15k, monograph 150–500k) to §Context Window.
- 2026-07-11 (realized in prose, engineering-blog pass): folded the **context-rot / attention-budget** mechanism into the lost-in-the-middle Remark (Anthropic 2025) and added an **MCP progressive-disclosure** Remark (tool defs are a context cost; load schemas on demand); Further Reading on effective-context-engineering and code-execution-with-MCP.
- 2026-07-11 (realized in prose, practitioner-thread pass): added **cache-stable context ordering** to Prompt Caching — the cache reuses an unchanged prefix, so arrange the window most-stable → most-volatile (system prompt/tools, then corpus/few-shot, then the per-mutation candidate); a loop that keeps its prefix byte-identical pays full cost once, marginal thereafter. Ties Ch.~ContextEngineering caching to Ch.~EvolutionaryFrameworks cost-aware search.
- 2026-07-13 (realized in prose, rigor): defined the **token vocabulary $V$** (the finite set of tokens, each with an embedding) before using $V^*$ in §4.1, so the Kleene-star notation has its base; reconciles with the retrieval chapter's reuse of $V^*$ for passages.
- 2026-07-13 (realized in prose): reframed **Prompt Engineering** as foundational but *largely a delegated task* in agentic development (dropped the exploratory "(vestigial)" title tag) — its principles persist and inform context engineering, but the hand-crafting of single prompts is delegated to the agent/platform, so it is taught to *specify and judge* what an agent produces (ties to Spine 2, Ch.~AgenticParadigm).
- 2026-07-13 (realized in prose): grounded the **system-prompt layer** of the instruction stack in the project's instruction files (**`CLAUDE.md` / `AGENTS.md`**, loaded automatically), with pointers to §InstructionFiles (Ch.~AgenticRig) and §AutomatedContext — making the abstract "system prompt" concrete early rather than only at the later hierarchy discussion.
- 2026-07-13 (realized in prose, major): added **§4.4.5 Agentic Context Engineering** (Principle~StageNotInject) — the third Spine-2 level. Core insight: agentic context engineering changes *who assembles the window*, so a trusted agent can pattern-match over a corpus 10–100× larger than a hand-curated window. Covers what makes a file system conducive (legible sources, catalog, synopses, unix tools), **reverse search** as the hard/valuable capability (where a grep-able corpus can beat approximate NN), the vector-machinery deferral to Ch.~Retrieval, the *trust* premise (Ch.~AgenticRig/Ch.~AgenticCoding), and the capstone forward-pointer. Grounded in the nano-evolve resource-library practice (catalog + per-paper synopses + get-arxiv); the archive-as-meta-learner / data-engineering material was deliberately left out as out-of-scope for a foundational chapter.
<!-- EVOLVE-BLOCK-END -->

## Open questions
- Is "recency/primacy/lost-in-the-middle" the right level of empirical detail for a cross-disciplinary audience? Keep, but anchor each to a citation.
