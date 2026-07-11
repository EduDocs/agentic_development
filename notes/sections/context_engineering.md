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
- **Reconcile Principle~ContextDeterminesOutput with the temperature/sampling section below it.** As written it says "two identical contexts produce identical *distributions*" but the surrounding chapter (and Ch.8/Ch.9) raise nondeterministic serving and temperature. Qualify: identical contexts fix the *distribution*; identical *samples* require temperature 0 and deterministic serving (baseline rigor + referee flagged this).
- Add a **chapter roadmap** — six sections currently leave the reader navigating blind (clarity).
- Add inline citations at the point of claim: lost-in-the-middle (Liu et al. 2024) and chain-of-thought gains (Wei et al. 2022), not only in Further Reading (novelty).

## Decisions
- 2026-07-10: Principle stated deterministically for pedagogical punch, but a one-clause caveat is owed since the same chapter introduces temperature; this is a self-consistency fix, not a reframing.
- 2026-07-10 (realized in prose): Principle~ContextDeterminesOutput now says context fixes the output *distribution*; the realized *sample* depends on temperature (below) and serving nondeterminism — reconciled with the Temperature subsection and the Ch.8/Ch.9 nondeterminism material. Still open: roadmap; inline citations.
<!-- EVOLVE-BLOCK-END -->

## Open questions
- Is "recency/primacy/lost-in-the-middle" the right level of empirical detail for a cross-disciplinary audience? Keep, but anchor each to a citation.
