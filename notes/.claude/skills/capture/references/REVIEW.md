# capture — Review Taxonomy & Integration Playbook

This is the REVIEW half of the `/capture` flywheel: turn the `.nel/scratch/LEARNINGS.md` backlog into
durable changes to the toolkit. Read the inbox format in
[.nel/scratch/README.md](../../../../.nel/scratch/README.md) first.

Capture is cheap and dumb on purpose; **all the judgment is here.** Review is deliberate,
ask-first, and surgical — it edits skills, docs, config, and memory, so it follows the same
posture as `concepts2tex`/`tex2concepts`/`progression`: show the change, confirm, then write.

## The entry schema (what a blob looks like)

```markdown
### <short title> <!-- id: 2026-06-13-1 -->
- **when:** 2026-06-13 · **type:** skill-gap · **tags:** format-tex, ties
- **scope:** engine
- **context:** formatting a .tex; the hygiene pass tied \cite/\ref but not \eqref.
- **lesson:** the non-breaking-tie rule should also cover \eqref and \cref.
- **proposed action:** extend format-tex HYGIENE.md tie list — engine-side.
- **status:** open
```

`type` is one of: `skill-gap` (a skill should do X but doesn't), `skill-idea` (a new skill),
`workflow` (a convention/process), `bug` (something is wrong), `question` (open, needs a
decision), `preference` (how the user wants things done).

`scope` is `project` (this paper: manifest, personas, its conventions) or `engine` (the
mechanism: a vendored skill, the loop, engine defaults, the contract). Optional at capture
time; **triage must settle it**, because it decides *where* the fix is applied.

## Triage — route each blob to a sink

Decide one disposition per blob. Group near-duplicates first so a single change resolves several.

| Disposition | When | What review does |
|---|---|---|
| **update-skill** | an existing skill is missing or wrong behavior | edit **the engine's copy** of that skill, then re-vendor (see *engine*) |
| **new-skill** | a recurring need no skill covers | scaffold a new skill under **the engine's** `.claude/skills/`, then re-vendor |
| **doc** | a repo convention, build, structure, or notation rule | amend `CLAUDE.md`, `PROGRESSION.md`, or the relevant doc — project-side if paper-specific. If it belongs to *every* paper: a loop/protocol rule goes in the engine's **`NEL.md`** (vendored, so `update` propagates it — never patch `.nel/NEL.md` in the project, it is overwritten); anything else in the engine's `template/` |
| **hook** | an automated "whenever X, do Y" behavior | use the `update-config` skill to add a settings hook |
| **memory** | a durable fact about the user or project | write a memory file (`~/.claude/.../memory` + `MEMORY.md`) |
| **engine** | any mechanism lesson (loop, `nel`, contract, evaluator/critic defaults) without an immediate fix | promote: append the blob to the **engine's** own `scratch/LEARNINGS.md` |
| **drop** | stale, out of scope, or not worth doing | archive marked `dropped: <why>` |

Present the triage as a compact table — `id → disposition → one-line plan` — before touching
anything, so the user can redirect a routing call.

## Integration playbook (per disposition)

- **update-skill / new-skill** — make the smallest change that fixes the lesson. Update the
  `description` frontmatter if triggers changed; keep the house structure (SKILL.md + `references/`).
  Re-read the edited skill's quick-reference table to confirm it still matches.
  **Where:** in a scaffolded project, skills are *vendored* — `scaffold.py update` overwrites
  `.claude/skills/`, `nel`, and the `justfile`, so an in-project edit is silently lost. Resolve
  the engine (`cat .nel/engine`, or `$NEL_ENGINE`), edit the skill **there**, then run
  `python3 <engine>/scaffold.py update <project>` to pull the fix back in. Only when the repo
  *is* the engine (no `.nel/engine`) is a direct edit correct.
- **engine (promote upstream)** — for mechanism lessons that need more thought than a surgical
  edit (or when the engine checkout isn't writable from here): append the blob, unchanged plus a
  `promoted-from: <project-id> <date>` line, to `<engine>/scratch/LEARNINGS.md` under `## Open`
  (create from the skeleton if absent). The engine is not a project, so its own inbox stays at
  `<engine>/scratch/`; only a *project's* inbox lives in the container at `.nel/scratch/`.
  Archive the local copy as `promoted <date> -> engine inbox`. A later `/capture review` **in the
  engine repo** integrates it; every project then inherits the fix via `scaffold.py update`.
  If the engine is unreachable (collaborator clone, no path), leave the blob open with
  `scope: engine` — do not fake the promotion.
- **doc** — surgical edit at the right place; don't restructure the doc around one lesson.
- **hook** — delegate to `update-config` (hooks are harness-executed; memory/preferences cannot
  fulfill a "whenever X" automation). Capture the trigger and action precisely.
- **memory** — only for durable, non-derivable facts; follow the memory rules (one fact per
  file, frontmatter, `MEMORY.md` pointer). Don't duplicate what the repo already records.
- **drop** — still archive it with the reason; a recorded "won't do" prevents re-capturing it.

## Dedup & convergence

- Before integrating, fold blobs that describe the same gap into one; integrate once; archive
  all the duplicates pointing at the same resolution.
- Review is convergent: archived blobs never reappear in `## Open`, and a `dropped` record stops
  the same lesson from re-entering the backlog. Re-running review with nothing open is a no-op.

## Archiving

Move each resolved blob from `## Open` to `## Archive`, appending a resolution line:

```markdown
### <short title> <!-- id: 2026-06-13-1 -->
- **when:** 2026-06-13 · **type:** skill-gap · **tags:** format-tex, ties
- **lesson:** the non-breaking-tie rule should also cover \eqref and \cref.
- **status:** integrated 2026-06-20 — added \eqref/\cref to format-tex HYGIENE.md tie list.
```

Keep the lesson line; the archive is the history of how the toolkit learned. Never delete a
blob — graduate it.

## Scope discipline

- Review changes the toolkit (skills/docs/config/memory); it does **not** touch paper content
  (`sections/*`, `figures/*`) unless a blob is explicitly about fixing a specific section, in
  which case prefer the dedicated skill (`concepts2tex`/`tex2concepts`/`format-tex`).
- One sink per blob; if a lesson implies two changes (e.g. a skill edit *and* a hook), split it
  into two archived resolutions so each is traceable.
