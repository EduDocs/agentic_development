# Vendored: Claude Code CLI Workshop

This is a **vendored snapshot** of an external workshop, used as the foundations
curriculum source for **Projects 1–2** (and seeding 3–4). It is a copy — edit the
upstream original for substantive changes, then re-vendor; keep course-specific
framing in `projects/` and `PROGRESSION.md`, not here.

## Source

- **Upstream repo:** `../../claude-cli` (`/Users/chmbrlnd/sandbox/claude-cli`)
- **Vendored at commit:** `dd479ab`
- **Upstream version:** 0.5 (2026-06-03), owner JF/JFC
- **Vendored on:** 2026-06-25

## What was copied

- `lessons/` — the canonical Markdown lessons + appendices from upstream `src/`
  (4 lessons, setup/git/just appendices, INDEX).
- `slides/` — the per-lesson beamer source from upstream `slides/`.

**Not** copied: `build/` (ephemeral PDFs), `pandoc/` config, `justfile`, `archive/`.
If we later choose to build these locally, vendor that infra too (or switch to
"reference in place").

## Lesson → project map

| Lesson file | Project |
|-------------|---------|
| `appendix-a-setup` | Pre-term / Project 1 |
| `appendix-b-git` | Project 1 |
| `01-foundations` | Project 1 |
| `02-making-it-personal` | Project 1 → 2 |
| `03-power-features` | Project 2 |
| `04-autonomous-use` | Project 2 → 4 |
| `appendix-c-just` | Project 1 (ambient) |

## Drift

Because this is a copy, it can fall behind upstream. When upstream advances past
`dd479ab`, re-copy `src/*.md` and `slides/*.md` and bump the commit above.
