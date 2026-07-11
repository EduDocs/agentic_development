# agentic_paradigm — scratch

> Sidecar for `agentic_paradigm.tex`. Not part of the LaTeX build.
> The EVOLVE-BLOCK below is the shareable spine exported to reviewers and elites;
> everything outside it is private scratch you may freely edit.

## Purpose
Establish the vocabulary (agent, tools, context, loop), the capability ladder,
and the two spines the rest of the book hangs from.

<!-- EVOLVE-BLOCK-START -->
## Key points / spine
- **Agent = $(M,\mathcal{T},\mathcal{C},L)$** — model, tools, context, loop — running a perceive–reason–act cycle until a terminal condition.
- Tool set $\mathcal{T}$ bounds what the agent *can* do; model $M$ decides what it *chooses* to do. Context is not persistent: what the model does not read, it does not know.
- **Capability ladder** (Operate → Build → Orchestrate → Evolve): each rung is a strict prerequisite for the next — "cannot evolve what you cannot evaluate."
- **Two spines** introduced here and paid off at the capstone: Spine 1 *Evaluation Becomes Fitness* (Principle~EvalFitness: any automatic, leakage-resistant harness is a fitness function); Spine 2 *Context Engineering* (the LLM is a function of its context; evolution is context engineering in a loop).
- **Why now**: instruction following + tool use + structured output combine to make an LLM a directable, composable, evaluable research substrate.

## Directions
- (no open prose directions; the baseline clarity/novelty items are realized — see Decisions)

## Decisions
- 2026-07-10: two-spines framing placed in Ch.1 so the eval→fitness hinge and context-engineering lever are visible from the start; both recur at every rung and converge in Ch.9.
- 2026-07-10 (realized in prose): added a 2–3 sentence **roadmap** after the opening hook (names the ladder section and the two-spines section); ended "Why Now" with a **forward pointer to Ch.2** (the rig is where doing this well begins), closing the dangling endpoint; added the **position-bias inline citation** (Liu et al., 2024) at the context Remark.
- 2026-07-10 (realized in prose, currency): the context-window Remark now grounds the "bigger window ≠ less context engineering" misconception historically — the first hundred-thousand-token windows were pitched as "feed the model everything" (Anthropic, 2023) — before invoking position bias.
- 2026-07-10 (realized in prose, pedagogy): added a **four-properties-of-the-substrate** Remark after the agent definition (next-token prediction→hallucination, frozen knowledge/cutoff, bounded working memory, pattern-continuation steerability), framing each ladder rung as a discipline for one failure mode (Anthropic, 2025); **grounded Spine 1** in next-token prediction (fluent ≠ correct, so trust needs an external score) and added the **organic-vs-deliberate** justification for why evaluation is a *spine* (discernment doesn't accrue with exposure); added the **goal-clarity signature move** to the Operate rung; added an AI Fluency Index Further Reading entry. Working-memory/position-bias was already covered, so it is only pointed back to, not re-explained.
- 2026-07-10 (realized in prose, currency): named **computer use** as a tool type in §Tools (screenshot + keyboard/mouse, operating desktop software with no purpose-built API; Anthropic 2024), distinct from named-API tools.
- 2026-07-10 (honesty fix): **softened the AI Fluency Index claims.** Rigor flagged the risk of conflating the empirical usage analysis with the 4Ds *framework* and of resting a load-bearing claim on a single possibly-misidentified study. The organic-vs-deliberate and goal-clarity claims now stand on the course's own pedagogical reasoning and are only "consistent with"/"appear to track" the Anthropic analysis; the Further Reading entry disambiguates the framework (4 properties, 4Ds) from the usage analysis and drops "corpus study." Also added the cross-disciplinary geologist sentence in §Why Now.
<!-- EVOLVE-BLOCK-END -->

## Open questions
- The agent tuple omits an explicit reward/score; deliberate (score lives in the harness, Ch.6). Keep, but ensure Ch.6 makes the connection.
