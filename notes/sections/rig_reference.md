# The Rig in Practice: A Claude Code Reference — scratch

> Scratch/ideas only. The shipped prose lives in `rig_reference.tex`. Not part of the LaTeX build.

## Purpose

An appendix reference manual for Claude Code — the concrete, command-level counterpart to
Ch.~AgenticRig's concept-level rig. Collects what a student needs at the keyboard (launching, sessions,
permission modes, instruction layers, slash commands, headless flags, worktrees, extensions)
so the chapters can stay tool-agnostic and durable. Distilled from the course's vendored
claude-cli workshop (`resources/claude-cli-workshop/`, source: `sandbox/EvolutionaryFrameworks/claude-cli/`).

<!-- EVOLVE-BLOCK-START -->
## Key points / spine

- The appendix inverts the chapters' contract: chapters teach durable concepts, the appendix
  deliberately snapshots a fast-dating product surface — and says so up front (Fall 2026
  snapshot, verify against docs.anthropic.com, workshop pointer for the guided version).
- Every section is wired back to its conceptual home: sessions → Ch.~AgenticRig, permission modes →
  Principle~LeastPrivilege + plan-then-execute as Ch.~AgenticCoding's specify–execute–read loop,
  instruction layers → Ch.~AgenticRig/Ch.~ContextEngineering, /context & /compact → Ch.~ContextEngineering, headless flags → Ch.~Orchestration
  (allowedTools = per-invocation least privilege; the permission config IS the supervision),
  worktrees → the physical substrate for Ch.~Orchestration's parallel agents.
- Closing frame: instruction files shape *behavior*, permissions bound *authority*, hooks
  enforce *invariants*.

## Decisions

- 2026-07-10: created as an appendix (`\appendix` + `\include` in main.tex), not chapter
  prose — command-level detail dates in months and would drag the currency score of the
  chapters; quarantining it in a self-declared snapshot appendix keeps both registers honest.
- 2026-07-10: deliberately NOT imported from the workshop: its hooks JSON schema
  (`afterWrite`/`beforeBash`) and `.claudeignore` do not match the actual tool's
  configuration surface, and resume-by-name is shakier than `-c`/`-r`; the appendix
  describes hooks/skills/MCP conceptually and keeps only commands that work as written
  (rigor persona checks snippets literally).
- 2026-07-10: the workshop's two durable conceptual gems were placed in chapters, not here —
  the verification-oracle framing (Ch.~AgenticCoding) and CLAUDE.md-as-compressed-index (Ch.~AgenticRig) — since
  they are concept-register, not how-to-register.
- 2026-07-11 (realized in prose, engineering-blog pass): added a **permission-ladder-middle-rung** Remark (OS sandboxing + auto mode, between Normal and skip-all) to Permission Modes; a **Skills progressive-disclosure** sentence to Extending the Agent; and created a **Further Reading** section (best-practices, auto-mode, sandboxing, agent-skills) — the appendix previously had none. All dated as product snapshots.
<!-- EVOLVE-BLOCK-END -->

## Open questions

- Should the appendix grow a "recipes" section (worked one-liners for common research tasks)
  or stay a pure reference? Watch whether the pedagogy persona asks for exercises.
- The vendored workshop has appendices on git and `just`; Ch.2 covers git conceptually —
  is a pointer enough, or does the course want a git command reference appendix too?

## Notes & references

- Source: `claude-cli/src/claude-code--0{0..4}-*.md` and appendices a–c (workshop v0.5, 2026-06-03).
- Workshop framings absorbed into chapters: architecture-not-model thesis, demand paging,
  filesystem-as-scratchpad (already implicit in Ch.~ContextEngineering/Ch.~Orchestration), compressed index, verification oracle.
