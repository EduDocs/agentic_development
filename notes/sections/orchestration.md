# orchestration — scratch

> Sidecar for `orchestration.tex`. Not part of the LaTeX build.
> The EVOLVE-BLOCK below is the shareable spine exported to reviewers and elites;
> everything outside it is private scratch you may freely edit.

## Purpose
Compose agents into a workflow that runs unattended and fails honestly, and
assemble the GES loop that is one ingredient short of evolution.

<!-- EVOLVE-BLOCK-START -->
## Key points / spine
- **Orchestration** composes agents/operations into a trustworthy workflow: pipelines and parallel execution (with the non-determinism hazard — set seeds, record selections).
- **Proposer–critic** pattern: proposer maximizes breadth, critic/verifier maximizes precision by enforcing constraints the harness does not check (dimensional consistency, syntactic validity, dedup). Filtering before evaluation saves cost.
- **External memory**: tried expressions, best results, failure modes, run configuration — the memory file is the primary artifact of a run and enables resume + honest reporting.
- **Reliability engineering**: retries with exponential backoff, structured logging, and **honest failure reporting** (Principle~HonestFailure — a silent fallback is worse than a raised error).
- **The GES loop** (Def.~GenEvalSel: generate → evaluate → select → repeat) is "an evolutionary algorithm in all but name"; the only missing ingredient is a mutation operator. This is the load-bearing pivot into Ch.9.
- **Orchestrator–worker topology**: a lead agent spawns parallel sub-agents in *isolated contexts* and synthesizes their results — strong for independent, breadth-first work but ~order-of-magnitude more tokens, hence fit-dependent (`figure:OrchestratorWorker`); the proposer–critic loop is the canonical *evaluator–optimizer* pattern. External memory scales from the JSON floor to vector-store (semantic dedup) / episodic stores.

## Directions
- (no open prose directions; roadmap, GES→evolution handoff, framework hedge, and the `with_retry` robustness nit all realized — see Decisions)

## Decisions
- 2026-07-10: the propose→evaluate→select loop is deliberately named and boxed as a Definition so the Ch.9 pivot is "add one ingredient to a known object," not a new topic.
- 2026-07-10 (realized in prose): added the **chapter roadmap** after the opening; **tightened the GES→evolution handoff** — Ch.9 §EvolutionaryLoop now opens by citing Def.~GenEvalSel directly ("already in place; this chapter adds the one missing ingredient"), closing the loose-restatement the clarity panel flagged.
- 2026-07-10 (realized in prose): hedged the **AutoGen/LangChain** Further Reading entries (ecosystem fragmented — LangGraph, Claude agent SDK, Swarm — treat as historical anchors); added a trailing `raise` to `with_retry` so it cannot silently return `None` for `max_attempts <= 0` (rigor nit; message reworded to match the case it actually fires on, and the `RateLimitError/APIError` import added so the snippet runs as written).
- 2026-07-10 (realized in prose, clarity): added a **concrete GES instance** right after Def.~GenEvalSel — five proposed expressions scored 0.12/0.08/0.23/0.07/0.15, $k{=}2$ selector keeps 0.07 and 0.08 as round-2 elites — so the definition is visceral at introduction and Ch.9's worked example has a lighter load.
- 2026-07-10 (realized in prose): §Dynamic Sub-Agent Spawning now points at the **git-worktree isolation pattern** in the new Appendix (rig_reference) for parallel agents that write, closing the gap between the topology diagram and the physical infrastructure.
- 2026-07-10 (realized in prose, currency): added a **§Dynamic Sub-Agent Spawning** subsection — an orchestrator spawns specialist sub-agents on demand (fresh context/tools per agent), the dynamic generalization of the static proposer–critic wiring; reliability discipline applies unchanged; names Claude's agent SDK as the concrete reference and as a reasonable present-day default (giving the framework hedge a positive starting point).
- 2026-07-11 (realized in prose, engineering-blog pass, visual): added `figure:OrchestratorWorker` (lead → parallel isolated-context sub-agents → synthesis, roughly order-of-magnitude token cost, fit-dependent) and an **evaluator-optimizer** naming of the proposer-critic loop (Building Effective Agents, 2024); added an **external-memory** currency note (vector-store semantic dedup / episodic memory beyond the JSON floor — closes a currency gap); Further Reading on building-effective-agents, multi-agent-research, effective-harnesses.
<!-- EVOLVE-BLOCK-END -->

## Open questions
- Proposer–critic vs verifier: the distinction (soft constraints vs hard correctness) is subtle; is one paragraph enough, or does it warrant a small table?
