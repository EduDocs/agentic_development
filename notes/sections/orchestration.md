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

## Directions
- Add a **chapter roadmap** after the opening.
- Tighten the GES→evolution handoff so Ch.9's first paragraph can cite Def.~GenEvalSel immediately (the clarity panel flagged that Ch.9 restates the loop loosely instead of pointing here).

## Decisions
- 2026-07-10: the propose→evaluate→select loop is deliberately named and boxed as a Definition so the Ch.9 pivot is "add one ingredient to a known object," not a new topic.
<!-- EVOLVE-BLOCK-END -->

## Open questions
- Proposer–critic vs verifier: the distinction (soft constraints vs hard correctness) is subtle; is one paragraph enough, or does it warrant a small table?
