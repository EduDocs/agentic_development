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
- Add a **chapter roadmap** after the opening (clarity, applies to every long chapter).
- Cross-link the permissions/least-privilege material forward to Ch.4 (read-every-diff) and Ch.8 (rate-limit reliability) so the rig's payoffs are explicit.

## Decisions
- 2026-07-10: rig presented in encounter order (terminal → git → API → instruction files → permissions) rather than by importance, matching the onboarding Tasks; grounded in the vendored claude-cli-workshop.
<!-- EVOLVE-BLOCK-END -->

## Open questions
- Should `CLAUDE.md` / instruction-file hierarchy live here or in Ch.3 (automated context)? Currently split: definition here, mechanism in Ch.3. Keep, but avoid duplication.
