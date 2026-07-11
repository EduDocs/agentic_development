# agentic_rig — scratch

> Sidecar for `agentic_rig.tex`. Not part of the LaTeX build.
> The EVOLVE-BLOCK below is the shareable spine exported to reviewers and elites;
> everything outside it is private scratch you may freely edit.

## Purpose
Install the substrate — terminal, git, API, instruction files, permissions —
in the order a new user meets it, and argue why each makes work trustworthy.

<!-- EVOLVE-BLOCK-START -->
## Key points / spine
- The **rig** is the surface everything rests on: terminal/shell, version control, the model API, instruction files, permissions. A shaky rig means untrustworthy results.
- **Reproducibility through clean git history** (Principle~CleanHistory): commit at every meaningful checkpoint; a single all-at-once commit is a backup, not a history.
- **Least privilege** (Principle~LeastPrivilege): grant the minimum permissions; narrow permissions make dangerous mistakes auditable.
- The human stays in the loop and owns every change — the seed of the read-every-diff discipline developed in Ch.4.
- Model selection axes for agentic work: context window, tool-use quality, instruction following, cost.

## Directions
- (no open prose directions; roadmap, prompt injection, computer use, and the forward cross-links all realized — see Decisions)

## Decisions
- 2026-07-10: rig presented in encounter order (terminal → git → API → instruction files → permissions) rather than by importance, matching the onboarding Tasks; grounded in the vendored claude-cli-workshop.
- 2026-07-10 (realized in prose): added the **chapter roadmap** (one clause per section, with `\ref` links) after the opening.
- 2026-07-10 (realized in prose, currency): added a **§Untrusted Inputs and Prompt Injection** subsection to §Permissions — tool results / fetched pages / retrieved passages are untrusted text the model cannot distinguish from researcher instructions; least privilege (Principle~LeastPrivilege) is the primary structural defense, with schema validation (Ch.5) and human-in-the-loop as complements. **Computer use** as a tool type was added in Ch.1 §Tools (screenshot + keyboard/mouse vs named-API tools), the more natural home than the rig chapter.
- 2026-07-10 (realized in prose): absorbed the workshop's **compressed-index framing** into §CLAUDE.md — the instruction file as a sufficient statistic of the project (where to look + what patterns to expect; more correct decisions per token than raw source), wired forward to Ch.3; added the pointer to the new **Appendix (rig_reference)** which now holds the command-level Claude Code detail so this chapter stays concept-register.
- 2026-07-10 (realized in prose, clarity): the chapter now **opens with a motivating story** (a pipeline that stops reproducing its own results six months in, with no commit history to interrogate) *before* the component list — converts the reference-guide opening into a chapter the reader wants, per the clarity panel.
- 2026-07-10 (realized in prose): closed the **forward cross-links** from §Permissions/§Human-in-the-Loop — read-every-diff (Ch.4) and the reliability machinery for rate limits / transient errors (Ch.8) are now named, so the rig's payoffs are explicit.
<!-- EVOLVE-BLOCK-END -->

## Open questions
- Should `CLAUDE.md` / instruction-file hierarchy live here or in Ch.3 (automated context)? Currently split: definition here, mechanism in Ch.3. Keep, but avoid duplication.
