# scratch/ — the learning-flywheel scratch area

Ephemeral, personal, per-clone working space. Everything here is **gitignored
except this README** — it is your backlog and working notes, not paper history
and not shared state. Files are created on demand; deleting the directory
loses nothing the toolkit depends on.

## What lives here

| File | Owner | Purpose |
|---|---|---|
| `LEARNINGS.md` | `/capture` skill | the learning-flywheel inbox (format below) |
| `check-arxiv-state.md` | `check-arxiv` skill | seen/dismissed ledger + date watermark |
| anything else | you | scratch is scratch |

## The inbox: `LEARNINGS.md`

Two sections: `## Open` (new blobs, newest first) and `## Archive` (integrated
blobs with their resolution). `/capture` appends to Open; `/capture review`
graduates entries to Archive. Never delete a blob — graduate it.

### Skeleton

```markdown
# LEARNINGS — the flywheel inbox

## Open

## Archive
```

### Entry schema

```markdown
### <short title> <!-- id: 2026-06-13-1 -->
- **when:** 2026-06-13 · **type:** skill-gap · **tags:** format-tex, ties
- **scope:** engine
- **context:** formatting a .tex; the hygiene pass tied \cite/\ref but not \eqref.
- **lesson:** the non-breaking-tie rule should also cover \eqref and \cref.
- **proposed action:** extend format-tex HYGIENE.md tie list — engine-side.
- **status:** open
```

- **type** — `skill-gap` · `skill-idea` · `workflow` · `bug` · `question` · `preference`.
- **scope** — `project` (this paper: its manifest, personas, conventions) or
  `engine` (the mechanism: a vendored skill, the loop, engine defaults,
  the contract). Optional; review infers it when absent.

## Scope matters: the engine promotion rule

The skills under `.claude/skills/`, plus `nel` and the `justfile`, are
**vendored from the engine** and overwritten by every `scaffold.py update`.
An edit made to them here is lost on the next update. So:

> A lesson about the *mechanism* is integrated **at the engine** (the path in
> `.nel-engine`, or `$NEL_ENGINE`), then re-vendored into this project —
> never patched in place here.

`/capture review` knows this: blobs with `scope: engine` are promoted
upstream (applied in the engine repo, or appended to the **engine's own**
`scratch/LEARNINGS.md` when the fix needs more thought). Every project
scaffolded from that engine then inherits the improvement on its next
`scaffold.py update` — that is the flywheel closing at the fleet level, not
just for this paper.
