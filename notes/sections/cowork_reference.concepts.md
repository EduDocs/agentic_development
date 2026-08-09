# cowork_reference — scratch

> Sidecar for `cowork_reference.tex`. Not part of the LaTeX build.
> The EVOLVE-BLOCK below is the shareable spine exported to reviewers and elites;
> everything outside it is private scratch you may freely edit.

## Purpose
A short, concept-level appendix on *delegated* agentic environments (Claude
Cowork, OpenAI Codex): raise the altitude from building agents to delegating
whole tasks, without lowering the specify/review discipline. Sourced from the
course author's curated `resources/cowork-course-notes.md` (treated as the
authoritative paraphrase of Anthropic's *Introduction to Claude Cowork*).

<!-- EVOLVE-BLOCK-START -->
## Key points / spine
- **Delegation altitude.** Chat = turn-by-turn dialogue you drive; **Cowork** = delegate a whole multi-step, multi-tool task ending in a real deliverable, working in your environment (files + connectors + browser); **Code** (Claude Code / Codex) = delegation specialized to a repository (branch + change set). Codex sits on the *coding* side of the line, **not** with Cowork — the two delegate, but return different artifacts.
- **Specify → delegate → review** is the specify–execute–read loop (Ch.~AgenticCoding) raised to a whole task: name deliverable + inputs + judgment context; clarifying questions are front-loaded context-gathering; **review the artifact, not the transcript** (read-every-diff, §ReadingDiff) with a hallucination trace (Ch.~Evaluation).
- **Context that compounds**: global instructions (≈ account-wide `CLAUDE.md`), projects (scoped workspace + accruing memory ≈ subdir `CLAUDE.md` + accumulation on top), skills (installable playbook: instructions/assets/references/scripts), plugins (skills+connectors bundled) distributed via a marketplace (`marketplace.json` catalog). Connectors are untrusted-input attack surface (Principle~LeastPrivilege).
- **Safety = per-task least privilege**: permissions are the supervision for an unattended run; delete always confirmed, external send confirmed in "ask before acting" default; scoped folders, backups, dry-runs; keep out anything you wouldn't hand a capable-but-new colleague, and any audit-trail-regulated workflow (Principle~HonestFailure).
- **The skill eval = Spine 1 in miniature**: with/without paired comparison via a skill-creator, ship on consistent improvement + an explicit unhandled-case list — a hand-run evaluation harness (Ch.~Evaluation), the same evaluation-becomes-fitness that licenses an unattended run (Def.~GenEvalSel). Closing anchor: "build, then delegate" mirrors "build, then evolve."

## Directions
- (no open prose directions; the appendix realizes the concept-level pass. If the author later pastes the uncaptured Cowork lessons — full plugins, team/shared-infrastructure — a second subsection could extend the "context that compounds" table without changing the frame.)

## Decisions
- 2026-07-11: scoped as a **concept-level appendix**, not a product how-to — product specifics (permission-mode names, `/schedule`, Dispatch, plan availability) are dated ("mid-2026 snapshot") and pushed to Further Reading, mirroring `rig_reference`'s honesty discipline, so a fast-moving surface does not rot the manuscript.
- 2026-07-11: **Cowork positioned as general (non-code) delegation and Codex as the code-side example**, per the source notes' Chat/Cowork/Code taxonomy — deliberately correcting the conflation in `tutorial-29` ("Cowork & Codex: Agentic Coding Environments"), which describes Cowork with the Code model (branch + change set). Flagged for a possible tutorial-29 fix; the appendix states the distinction explicitly.
- 2026-07-11: every claim traced to the author-curated `cowork-course-notes.md`; no external verification performed (author designated that file authoritative). Uses no `\cite` (hand-written Further Reading, like the chapters) to stay clear of the undefined-citation gate.
- 2026-07-11 (realized in prose, engineering-blog pass): added a **skills-are-portable, eval-first** Remark to the skill-eval section (a skill is a filesystem folder loaded by progressive disclosure, authored evaluation-first; Agent Skills, 2025); Further Reading on containment (2026), managed agents (2026), and the Agent Skills authoring post.
<!-- EVOLVE-BLOCK-END -->

## Open questions
- Should this appendix cross-link *from* a chapter (e.g. a one-line pointer at the capability-ladder or orchestration delegation discussion), or stay a pure leaf like `rig_reference`? Currently a leaf.
- If the plugins/team lessons are later captured, does the material outgrow an appendix and want a short "operate at altitude" section in Ch.1 instead?
