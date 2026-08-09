---
name: critique
description: Read the manuscript as it stands and report what a reviewer panel finds — triaged, synthesized, and prioritized — without committing anything or recording an attempt. Use when the user asks to "critique", "review the draft", "what would a referee say", "how is this section doing", "run the panel", "get feedback on the manuscript", or "where is this weakest". This is the HUMAN-IN-THE-LOOP verb: one read, a short prioritized list of findings, and an offer to act on one of them. It is not `./nel step` (the loop primitive, which records a candidate and commits) and not `./nel iterate`. Runs the project's declared reviewer panel via `./nel evaluate`, then does the part the engine cannot: cluster findings across personas, drop the ones that disagree or are vague, rank what remains by how much it would actually improve the paper, and route the chosen fix to the right skill. Stops early and says so when the draft does not compile or trips a metrics gate — those are mechanical and cheap to fix first. Read-only until you confirm an edit.
---

# critique — What the panel sees, triaged for a human

`./nel step` is the loop primitive: it evaluates, records a candidate in the archive,
and checkpoints the manuscript in git. That is right for an unattended run and wrong
for a human who wants to know how the draft is doing.

This skill is the attended path. It runs the same evaluation, **records no attempt and
commits nothing**, and spends its effort on the part the engine deliberately does not
do: deciding which findings matter.

The engine returns four independent reviewer opinions concatenated together. That is
raw material, not a review. Four personas will overlap, contradict each other, and pad
their lists to look thorough. Handing that to the user unfiltered moves the work rather
than doing it.

## When to use

- The user asks how the draft is doing, what a referee would say, or where it is weakest.
- After a `concepts2tex` pass or a substantive edit, before deciding what to do next.
- To decide *what to work on*, when several sections all feel unfinished.

Do **not** use it to record an attempt or advance the loop (that is `./nel step`), to
sync a `.tex`/`.md` pair (`concepts2tex` / `tex2concepts`), or to check cross-section coherence
(`progression`).

## Workflow

1. **Scope.** Default is the whole manuscript. An optional argument (a section name)
   does *not* change what is evaluated — the panel always reads the composed manuscript
   and spine — it scopes which findings you surface and rank. Say so if you scope,
   so the user knows nothing was skipped in the evaluation itself.

2. **Run the evaluation.** `./nel evaluate` from the project root. It prints one JSON
   line: `score`, `stage`, `feedback`, `summary`, `metrics`, `cached`, `reviewers`.
   Re-running on an unchanged draft is a cache hit and costs nothing, so never skip it
   to "save" a call.

3. **Triage on `stage` before reading any prose.** Three of the four stages mean the
   panel's opinion is not the useful output:

   | `stage` | What it means | What to do |
   |---|---|---|
   | `compile-error` | the manuscript does not build | report the LaTeX error verbatim, offer to fix it, **stop** |
   | `metrics-gate` | it builds but has dangling refs / cites / duplicate labels / leftover TODOs | list them exactly (they are precise and mechanical), offer to fix, **stop** |
   | `review-error` | it passed both gates; the reviewer backends failed | say it is infrastructure, not quality; suggest `./nel doctor --auth`; **stop** |
   | `reviewed` | the panel ran | continue to step 4 |

   Do not soften a gate failure into a "finding". A dangling `\ref` is not a critique,
   it is a defect with a known fix, and it is cheaper to fix than to discuss.

4. **Synthesize.** This is the judgment, and the reason this is a skill. Read the
   `feedback` text and follow
   [references/SYNTHESIS.md](references/SYNTHESIS.md): cluster the same complaint across
   personas, keep what two or more independently raised, drop the vague and the
   merely stylistic, and rank what survives by impact-per-edit. Report **three to five
   findings**, not twenty.

5. **Report.** Lead with what the paper most needs, not the score. Each finding: what
   is wrong, where (`sections/<name>.tex` and the line if you can pin it), and what
   would fix it. Then one line on what the panel agreed was working — it tells the user
   what not to break. Mention the score only as a trailing aside, if at all; it is a
   mean of four uncalibrated 0–1 judgements and it moves on re-runs for reasons that
   have nothing to do with the paper.

6. **Offer one action.** Ask which finding to act on, then route it: prose lives in the
   `.tex` (edit directly, or `concepts2tex` if the sidecar leads), concepts and framing live
   in the `.md` (`tex2concepts` if the prose already moved), cross-section problems go to
   `progression`. One change, show the diff, confirm. Never batch-apply the findings.

## What this skill must not do

- **Never commit.** Checkpointing is `./nel step`'s job, and the user is in the loop
  precisely so the decision is theirs.
- **Never record a candidate.** `./nel evaluate` writes an *evaluation* row (the
  content-addressed cache, which is why re-runs are free). It does not create an
  attempt, and neither should you.
- **Never present the raw panel output.** If you find yourself pasting four persona
  sections back to back, you have skipped step 4.
- **Never chase the score.** Suggesting an edit because it might raise a number is the
  failure mode the rubric warns about; suggest it because the paper is better for it.

## Choosing the lenses

The panel is declared per project in `nel.toml` (`[[evaluation.panel]]`), and each
persona's rubric lives in `.nel/prompts/reviewers/<persona>.md`. A project with no
theorems should drop `rigor`; one not near submission should drop `referee`. That is a
manifest edit, and it is the right place for it — editing the panel changes
`evaluator_version`, so the cache never serves an opinion formed under different rules.

There is no per-invocation lens flag today. If you want one lens now, say which
findings you are ignoring and why, rather than pretending the others did not run.

## Quick reference

| | |
|---|---|
| Mode | human-in-the-loop; read-only until you confirm an edit |
| Runs | `./nel evaluate` (the project's declared panel) |
| Writes | nothing — no commit, no candidate, no branch log |
| Stops early | `compile-error`, `metrics-gate`, `review-error` — report and fix those first |
| Reports | 3–5 ranked findings + one line on what is working |
| Score | a trailing aside at most; never the headline, never the target |
| Follow-up | one finding, routed to `concepts2tex` / `tex2concepts` / `progression` or a direct edit |
| Not this skill | `./nel step` (records + commits), `progression` (cross-section), `format-tex` (style) |

Synthesis and ranking rules: [references/SYNTHESIS.md](references/SYNTHESIS.md).
The sidecar convention: [PROGRESSION.md](../../../PROGRESSION.md).
