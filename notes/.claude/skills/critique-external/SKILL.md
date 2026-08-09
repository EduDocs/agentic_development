---
name: critique-external
description: Get an outside, cold-read review of the manuscript from an external backend (codex) that the HUMAN runs from their own shell — the agent prepares the prompt, prints one command, then ingests and triages the result from a scratch file. Use when the user says "critique-external", "external review", "outside review", "cold read", "run codex on the paper", or "what would an outside reviewer say". Attended-only and human-in-the-loop by design; agent-launched external CLIs die in sandboxes, so the human's shell is the executor. The reviewer sees ONLY the composed manuscript (no sidecar spine — a true cold read, like a real journal submission). Records nothing in the archive, commits nothing. Freshness is tracked by a consumed YAML header the agent prepends to the review file after ingesting it; codex overwrites the file on the next run, which resets the marker. Persona lives in .nel/prompts/reviewers/external_reviewer.md (the external_*.md family — never dispatched by the unattended panel).
---

# critique-external — an outside review, run by the human

The unattended panel runs on the house backend; a genuinely *external* view
needs an external CLI, and an agent-launched external CLI is usually trapped
in a sandbox (no auth home, blocked network). This skill routes around that
structurally: **you prepare everything, the human executes one command in
their own shell, you ingest the result.** Three properties are non-negotiable:

- **Attended only.** Never run this flow inside the unattended loop.
- **Cold read.** The external reviewer sees the composed manuscript ONLY —
  never the sidecar spine, never the logs. A real reviewer gets the
  submission, nothing else.
- **Records nothing.** No archive rows, no commits (same rule as `/critique`).

## Files (all under `.nel/scratch/external/`, gitignored)

| file | written by | role |
|---|---|---|
| `prompt.md` | you | persona + manuscript, with a YAML provenance header |
| `review.md` | the external CLI (via `-o`) | the reviewer's report |

**Freshness protocol.** After ingesting `review.md`, you prepend a YAML header
(`consumed: true`, `consumed_at`, `manuscript_commit`). The external CLI
*overwrites* the file on the next run, which erases the header — so:
**no header = new review; header present = already used, do not re-ingest.**
Sanity check: a `review.md` older (mtime) than `prompt.md` is a leftover from
a previous round — treat it as stale and say so.

## Workflow

1. **Compose fresh.** From the project root run `./nel compose` — it writes
   `.nel/build/aggregate.tex` (the flattened manuscript). Do not reuse a stale
   aggregate.

2. **Write the prompt.** Create `.nel/scratch/external/prompt.md`:

   ```markdown
   ---
   persona: external_reviewer
   manuscript_commit: <git rev-parse --short HEAD>
   generated_at: <UTC timestamp>
   ---
   <contents of .nel/prompts/reviewers/external_reviewer.md>

   ===== BEGIN MANUSCRIPT (LaTeX) =====
   <contents of .nel/build/aggregate.tex>
   ===== END MANUSCRIPT =====
   ```

   The persona file is project-owned; if it is missing, say so and offer to
   seed it from the engine's `template/` (never invent one silently). To use a
   different external persona, take another `external_*.md` file — that family
   exists for exactly this, and the panel never touches it.

3. **Print the command — do not run it.** Tell the user to run, from the
   project root, in their own shell:

   ```bash
   codex exec --skip-git-repo-check -o .nel/scratch/external/review.md - < .nel/scratch/external/prompt.md
   ```

   (`-o` writes codex's final message to the file; `-` reads the prompt from
   stdin. Any external CLI that can read a prompt file and write a result file
   works here — codex is the default, not a requirement.)

   Warn the user: codex echoes the entire prompt and its running transcript to
   stdout — a large manuscript means a large terminal dump. That stream is not
   the output (`-o` is); appending `> /dev/null` silences it, or
   `> .nel/scratch/external/transcript.log` keeps it inspectable. Errors still
   surface on stderr either way.

   Then wait. Do not poll in a loop; the user will come back.

4. **Ingest, after checking freshness.** When the user returns (or asks you to
   check): read `.nel/scratch/external/review.md`.
   - Missing, or mtime older than `prompt.md` → the command has not run (or
     failed before writing); say so and stop.
   - Starts with a `consumed: true` YAML header → already ingested; say so and
     stop rather than re-reporting old findings.

5. **Triage.** Apply the same synthesis discipline as `/critique`
   ([../critique/references/SYNTHESIS.md](../critique/references/SYNTHESIS.md)):
   keep the concrete, drop the vague, rank by impact-per-edit. Then do the one
   thing only this skill can: **contrast the outside view with the inside
   one** — read the latest internal panel feedback
   (`.nel/log/feedback/branch-*/latest.md`, if any) and lead with where the
   external reviewer *disagrees with or blindsides* the panel. Agreement is
   confirmation; disagreement is information.

6. **Mark consumed.** Prepend to `review.md`:

   ```yaml
   ---
   consumed: true
   consumed_at: <UTC timestamp>
   manuscript_commit: <the commit from prompt.md's header>
   ---
   ```

   This is the only file this skill ever edits.

7. **Offer one next action** (an edit routed to the right skill, or a
   `/critique` to see if the panel agrees) — ask-first, as always.
