# preface — scratch

> Sidecar for `preface.tex`. Not part of the LaTeX build.
> The EVOLVE-BLOCK below is the shareable spine exported to reviewers and elites;
> everything outside it is private scratch you may freely edit.

## Purpose
Orient the reader: what the notes are, the two organizing devices they hang on,
and why this course exists — in under a page.

<!-- EVOLVE-BLOCK-START -->
## Key points / spine
- The notes equip students to understand *what they are doing and why*; they do not replace hands-on studio practice with the tools.
- Three organizing devices carry the whole book: (a) the **capability ladder** Operate → Build → Orchestrate → Evolve, each rung a prerequisite for the next; (b) the **two spines** — *evaluation becomes fitness* and *context engineering* — that thread every rung; (c) **symbolic regression** as the domain-portable teaching vehicle a biologist, physicist, or economist can re-skin.
- Formalism stance: notation is used for sharpness of intuition, not formal rigor — a precise name beats three informal paragraphs.
- Audience: some Python, high general ability, zero assumed background in agents/shell/git; the course starts there.

## Directions
- (no open prose directions; positioning + chapter map realized — see Decisions)

## Decisions
- 2026-07-10: capability ladder + two spines chosen as the through-line; baseline referee/clarity confirmed the through-line is architecturally sound (Ch.1 sets it up, Ch.9 pays it off), so the preface should name both devices up front.
- 2026-07-10 (realized in prose): added the **curriculum-positioning** paragraph — names the ladder + two spines as the notes' *organizing contribution* and positions the course between vendor tool tutorials (stop at operating) and standard ML/NLP courses (models without the build/orchestrate/evolve discipline). Closes the single missing Novelty statement; the two-spines framing is now stated as the course's own pedagogical contribution.
- 2026-07-10 (realized in prose): added the **"Chapter by chapter" map** — a one-line-per-chapter itemized guide (with `\ref` links to all nine chapters) after the positioning paragraph, so a student entering a 14-week course mid-stream can locate any chapter's role. Required adding `\label{chapter:AgenticParadigm}` to Ch.1 (was unlabeled).
<!-- EVOLVE-BLOCK-END -->

## Open questions
- Does the positioning paragraph belong in the preface or in Ch.1's "Why Now"? Lean preface (navigation) + Ch.1 (motivation), no overlap.
