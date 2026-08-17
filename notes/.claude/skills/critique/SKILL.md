---
name: critique
description: Read the manuscript as it stands and report what is most worth fixing — triaged, prioritized, and routed — without committing anything or recording an attempt. Use when the user asks to "critique", "review the draft", "what would a referee say", "how is this section doing", "get feedback on the manuscript", or "where is this weakest". Supports lenses: bare `/critique` is a fast in-skill editorial reading (gates checked, no reviewer call); `/critique by <persona>` runs exactly one declared reviewer; `/critique by panel` runs the full declared panel; `/critique <section>` scopes which findings surface. This is the HUMAN-IN-THE-LOOP verb — one read, three to five ranked findings, and an offer to act on one. It is not `./nel step` (the loop primitive, which records an attempt and commits). Stops early and says so when the draft does not compile or trips a metrics gate — those are mechanical and cheap to fix first. Read-only until you confirm an edit.
---

# critique — What the panel sees, triaged for a human

`./nel step` is the loop primitive: it evaluates, records an attempt in the archive,
and checkpoints the manuscript in git. That is right for an unattended run and wrong
for a human who wants to know how the draft is doing.

This skill is the attended path. It runs the same evaluation, **records no attempt and
commits nothing**, and spends its effort on the part the engine deliberately does not
do: deciding which findings matter.

When a panel runs, the engine returns its reviewer opinions concatenated together. That
is raw material, not a review. Personas overlap, contradict each other, and pad their
lists to look thorough. Handing that to the user unfiltered moves the work rather than
doing it.

## Lenses — and how independent each one is

The default is deliberately cheap so it can be run after *every* edit. A full panel is
a large call, and the friction it creates is real: you batch edits to avoid paying, and
the findings you are working from go stale the moment the first edit lands.

| invocation | what runs | independence |
|---|---|---|
| `/critique` | **you** read the manuscript, after `--gates-only` | **none** — you are assessing prose you helped write |
| `/critique by <persona>` | `--persona <name>`, one reviewer | separate inference, no memory of the drafting |
| `/critique by panel` | `./nel evaluate`, the declared panel | separate inferences + cross-persona corroboration |
| `/critique by external` | *not this skill* — redirect to `/critique-external` | different vendor, manuscript only |

**Say which tier you used, every time.** The default is a *reading*, not a review, and
it must not borrow a review's authority. One line is enough: "this is my own read, not
an independent one — `by panel` if you want the outside view."

The lens tiers are also where the cross-persona filter goes: with one voice (or none)
there is nothing to corroborate against, so a lone finding cannot be dropped for lack of
agreement. Say that too, rather than presenting one opinion as consensus.

`by <persona>` and `--gates-only` are **ephemeral** — nothing cached, nothing recorded —
so re-running costs full price. That is the trade for keeping one-off reads out of the
loop's history (ADR 0021).

## When to use

- The user asks how the draft is doing, what a referee would say, or where it is weakest.
- After a `concepts2prose` pass or a substantive edit, before deciding what to do next.
- To decide *what to work on*, when several sections all feel unfinished.

Do **not** use it to record an attempt or advance the loop (that is `./nel step`), to
sync a `.tex`/`.md` pair (`concepts2prose` / `prose2concepts`), or to check cross-section coherence
(`progression`).

## Workflow

1. **Parse the invocation.** `by <x>` selects a lens; a bare word is a *section*
   scope. Both may appear: `/critique introduction by clarity`.

   - `by external` or `by codex` → do not run anything. Say this is the human-run
     cold read and hand off to `/critique-external`.
   - `by panel` → the declared panel.
   - `by <name>` → one persona (below).
   - no `by` → the default reading.

   Scoping to a section does *not* change what is evaluated — the manuscript is always
   composed whole — it scopes which findings you surface. Say so, so the user knows
   nothing was skipped in the evaluation itself.

   For a section-scoped read prefer a local lens (`by rigor`, `by clarity`) over
   `by editor`: the editor's rubric is whole-paper and decision-shaped, so scoping it
   asks a global judge a local question.

2. **Run the right thing.**

   - **Default:** `./nel evaluate --gates-only` — deterministic checks, no reviewer
     call, seconds. Then read `.nel/build/aggregate.tex` (the composed manuscript the
     panel would see) and form the editorial judgment yourself: what most needs fixing,
     two or three issues, what is working. This is the embedded editor role — it exists
     in the skill so it is never missing from a project's panel.
   - **`by <persona>`:** `./nel evaluate --persona <name>`. If the persona does not
     exist the engine exits 2 and prints what the project actually has — relay that
     message verbatim, do not paraphrase or guess a substitute.
   - **`by panel`:** `./nel evaluate`. Prints one JSON line: `score`, `stage`,
     `feedback`, `summary`, `metrics`, `cached`, `reviewers`. Re-running on an unchanged
     draft is a cache hit and costs nothing, so never skip it to "save" a call.

3. **Triage on `stage` before reading any prose.** Most stages mean no opinion is the
   useful output — and this applies to the default reading too: do not discuss prose in
   a manuscript that does not build.

   | `stage` | What it means | What to do |
   |---|---|---|
   | `compile-error` | the manuscript does not build | report the LaTeX error verbatim, offer to fix it, **stop** |
   | `metrics-gate` | it builds but has dangling refs / cites / duplicate labels / leftover TODOs | list them exactly (they are precise and mechanical), offer to fix, **stop** |
   | `verifier-gate` / `verifier-error` | proof mode: the claim is open, or the checker could not run | report the verdict; an open claim is the work, a broken checker is infrastructure |
   | `review-error` | it passed the gates; the reviewer backends failed | say it is infrastructure, not quality; suggest `./nel doctor --auth`; **stop** |
   | `gates-only` | the default lens: gates passed, no reviewer ran | continue — the reading is yours to make |
   | `reviewed` | a persona or the panel ran | continue to step 4 |

   Do not soften a gate failure into a "finding". A dangling `\ref` is not a critique,
   it is a defect with a known fix, and it is cheaper to fix than to discuss.

4. **Synthesize.** This is the judgment, and the reason this is a skill. Read the
   `feedback` text and follow
   [references/SYNTHESIS.md](references/SYNTHESIS.md): cluster the same complaint across
   personas, keep what two or more independently raised, drop the vague and the
   merely stylistic, and rank what survives by impact-per-edit. Report **three to five
   findings**, not twenty.

5. **Report.** Lead with what the paper most needs, not the score. Each finding: what
   is wrong, where (`sections/<name>.prose.tex` and the line if you can pin it), and what
   would fix it. Then one line on what the panel agreed was working — it tells the user
   what not to break. Mention the score only as a trailing aside, if at all; it is a
   mean of uncalibrated 0–1 judgements — one per persona that ran — and it moves on
   re-runs for reasons that
   have nothing to do with the paper.

6. **Offer one action.** Ask which finding to act on, then route it: prose lives in the
   `.tex` (edit directly, or `concepts2prose` if the sidecar leads), concepts and framing live
   in the `.md` (`prose2concepts` if the prose already moved), cross-section problems go to
   `progression`. One change, show the diff, confirm. Never batch-apply the findings.

## What this skill must not do

- **Never commit.** Checkpointing is `./nel step`'s job, and the user is in the loop
  precisely so the decision is theirs.
- **Never record an attempt.** `./nel evaluate` writes an *evaluation* row (the
  content-addressed cache, which is why re-runs are free). It does not create an
  attempt, and neither should you.
- **Never present the raw panel output.** If you find yourself pasting four persona
  sections back to back, you have skipped step 4.
- **Never chase the score.** Suggesting an edit because it might raise a number is the
  failure mode the rubric warns about; suggest it because the paper is better for it.

## Choosing the lenses

The panel is declared per project in `nel.toml` (`[[evaluation.panel]]`), and each
persona's rubric lives in `.nel/prompts/reviewers/<persona>.md`. A project with no
theorems might drop `rigor`; course notes might carry `pedagogy` and `currency`
instead of `novelty`. That is a manifest edit, and it is the right place for it —
editing the panel changes `evaluator_version`, so the cache never serves an opinion
formed under different rules.

**The panel is phase-scoped; a lens is within-phase.** Changing the declared panel
because the work moved phase — rigor-heavy early, clarity and novelty later — is a
deliberate act that invalidates the cache once, which is correct: attempts either side
of that boundary were judged differently and should not be compared. `by <persona>` is
the other need — a targeted read that touches neither the panel nor the history.

## Quick reference

| | |
|---|---|
| Mode | human-in-the-loop; read-only until you confirm an edit |
| Runs | default: `./nel evaluate --gates-only` + your own read. `by <persona>`: `--persona <name>`. `by panel`: `./nel evaluate` |
| Writes | nothing — no commit, no attempt, no branch log. The lenses are ephemeral: not even an evaluation row |
| Stops early | `compile-error`, `metrics-gate`, `review-error` — report and fix those first |
| Reports | 3–5 ranked findings + one line on what is working |
| Score | a trailing aside at most; never the headline, never the target |
| Follow-up | one finding, routed to `concepts2prose` / `prose2concepts` / `progression` or a direct edit |
| Not this skill | `./nel step` (records + commits), `progression` (cross-section), `format-tex` (style) |

Synthesis and ranking rules: [references/SYNTHESIS.md](references/SYNTHESIS.md).
The sidecar convention: [PROGRESSION.md](../../../PROGRESSION.md).
