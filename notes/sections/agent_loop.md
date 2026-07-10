# agent_loop — scratch

> Sidecar for `agent_loop.tex`. Not part of the LaTeX build.
> The EVOLVE-BLOCK below is the shareable spine exported to reviewers and elites;
> everything outside it is private scratch you may freely edit.

## Purpose
Turn the abstract loop of Ch.1 into a thing the student builds: tool
definitions, the ReAct pattern, structured outputs, and failure modes.

<!-- EVOLVE-BLOCK-START -->
## Key points / spine
- A **tool** is a name + natural-language description + parameter schema; the **description is the most consequential field** — it tells the model when to call, what it expects, and what it returns.
- Tool design principles: one tool/one responsibility; declare side effects; return only what the model needs; return informative errors (the error is the model's next observation).
- **ReAct** makes intermediate reasoning explicit (thought → action → observation), giving both better-conditioned actions and an audit trail.
- **Structured outputs** turn an endpoint into a composable component: prefer the tool-use/JSON-schema mechanism (validation before commit) over parse-and-retry.
- **Failure modes** to design against: hallucinated tool arguments, loops-without-progress (need a max step count), context overrun (truncate tool results), cascading errors (validate at each tool boundary).

## Directions
- Add a **chapter roadmap** after the opening.
- The `ModelResult` structured-output example names `complexity: int` — keep it consistent with the *single* complexity definition being settled in Ch.6 (node count), so the two chapters agree on what "complexity" counts.

## Decisions
- 2026-07-10: failure modes catalogued here so Ch.8 (orchestration/reliability) can build retries, logging, and honest-failure reporting on a named taxonomy rather than re-deriving it.
<!-- EVOLVE-BLOCK-END -->

## Open questions
- Depth of the Anthropic-specific tool JSON vs a provider-neutral schema. Currently Anthropic-flavored; acceptable given the course's default stack, but keep the *principles* provider-neutral.
