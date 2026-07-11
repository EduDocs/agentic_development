# context_engineering — scratch

> Sidecar for `context_engineering.tex`. Not part of the LaTeX build.
> The EVOLVE-BLOCK below is the shareable spine exported to reviewers and elites;
> everything outside it is private scratch you may freely edit.

## Purpose
Develop context engineering as the primary lever available to the agent builder,
from the "LLM as a function of its context" view down to automated management.

<!-- EVOLVE-BLOCK-START -->
## Key points / spine
- **The LLM is a context-conditioned function** $M : V^* \to \Delta(\mathcal{A})$ (Eq.~ModelAsFunction): output is determined by input.
- **Prompt engineering** (wording of a single instruction) vs **context engineering** (the whole window across a multi-step interaction) — the chapter separates the two disciplines.
- Practical levers: the instruction stack (system prompt / task / injected context / history), selective injection (Principle~SelectiveContext: inject the minimum for the *current step*), long-context strategies (retrieval, summarization, reference-not-inclusion).
- **Automated context management**: hooks/triggers and the `CLAUDE.md` hierarchy make the rig self-contextualizing.
- Context quality is *measured*, not asserted: ablation, prompt-sensitivity, leaderboard comparison.

## Directions
- (no open prose directions; roadmap, inline citations, 100K trajectory, and MCP all realized — see Decisions)

## Decisions
- 2026-07-10: Principle stated deterministically for pedagogical punch, but a one-clause caveat is owed since the same chapter introduces temperature; this is a self-consistency fix, not a reframing.
- 2026-07-10 (realized in prose): Principle~ContextDeterminesOutput now says context fixes the output *distribution*; the realized *sample* depends on temperature (below) and serving nondeterminism — reconciled with the Temperature subsection and the Ch.8/Ch.9 nondeterminism material.
- 2026-07-10 (realized in prose): added the **chapter roadmap** (one clause per section) after the opening; added **inline citations at the claim sites** — lost-in-the-middle (Liu et al., 2024) at the context-window Remark and chain-of-thought (Wei et al., 2022) at the CoT subsection.
- 2026-07-10 (realized in prose, currency): reframed the static "100K–1M tokens" figure as a **trajectory** (100K was a 2023 frontier jump, Anthropic 2023) with the surviving lesson "reason about how to *use* a window"; used the 2023 "just feed it everything" pitch as the historical foil for the lost-in-the-middle Remark; and made the retrieval-vs-long-context choice a two-sided **tradeoff** in §Long-Context Strategies.
- 2026-07-10 (realized in prose, currency): added a **§The Model Context Protocol** subsection to §Automated Context Management (Anthropic, 2024) — open client/server protocol, composability (write a server once, works across clients), framed as the protocol-level counterpart to the `CLAUDE.md` hierarchy. Also fixed the **Temperature** mechanism (divides logits by T before the softmax; T=0 is the limiting argmax case, not a literal division by zero).
- 2026-07-10 (realized in prose, visual): added the **lost-in-the-middle figure** (`figure:LostInTheMiddle`) at §Context Window — the window as a segmented bar (system prompt | instructions | documents/history | recent turns + query) under a U-shaped effective-use curve, annotated primacy/recency/lost-in-the-middle; the caption derives the "place load-bearing content near the edges" rule from the curve's shape. First figure of the visual-exposition push (a *visual* reviewer persona now sits on the panel).
- 2026-07-10 (realized in prose, currency): added a **§Prompt Caching** subsection — a stable prefix (system prompt, instruction files, injected reference doc) is cached at the API layer so later loop calls pay only for new tokens; framed as the dominant cost lever for evolutionary runs and wired to Ch.9 §CostAwareSearch. Added the human token anchors (paper 8–15k, monograph 150–500k) to §Context Window.
- 2026-07-11 (realized in prose, engineering-blog pass): folded the **context-rot / attention-budget** mechanism into the lost-in-the-middle Remark (Anthropic 2025) and added an **MCP progressive-disclosure** Remark (tool defs are a context cost; load schemas on demand); Further Reading on effective-context-engineering and code-execution-with-MCP.
<!-- EVOLVE-BLOCK-END -->

## Open questions
- Is "recency/primacy/lost-in-the-middle" the right level of empirical detail for a cross-disciplinary audience? Keep, but anchor each to a citation.
