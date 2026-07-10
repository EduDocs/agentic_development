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
- Add a **2–3 sentence roadmap** after the opening hook (baseline clarity: "single highest-leverage exposition fix").
- End the "Why Now" section with a **forward pointer to Ch.2** (why the rig is the right next topic) — it currently dangles before Further Reading (clarity).
- Add an inline citation for the **position-bias / lost-in-the-middle** claim in the context Remark rather than deferring it to Ch.3's Further Reading (novelty).

## Decisions
- 2026-07-10: two-spines framing placed in Ch.1 so the eval→fitness hinge and context-engineering lever are visible from the start; both recur at every rung and converge in Ch.9.
<!-- EVOLVE-BLOCK-END -->

## Open questions
- The agent tuple omits an explicit reward/score; deliberate (score lives in the harness, Ch.6). Keep, but ensure Ch.6 makes the connection.
