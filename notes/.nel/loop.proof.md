# The proof loop

> **Engine-owned; do not edit.** Vendored to `.nel/loop.proof.md` and overwritten
> by `scaffold.py update`. Read `.nel/NEL.md` first — it holds the artifact
> convention, the evaluation pipeline, and what not to touch. This file is only
> the loop.

This is the loop for a project whose `nel.toml` declares an
`[evaluation.verifier]` table. The paper carries a **checkable claim** — a
construction, a bound, an identity — and ships a deterministic check for it. The
run is driving toward a *predicate*, not toward better prose (ADR 0013).

If there is no verifier table, you are in the wrong file — read
`.nel/loop.authoring.md` instead.

## The verifier

Its verdict is **three-valued** (ADR 0016):

| verdict | means |
| --- | --- |
| `closes` | exit 0 — the claim is proved or verified |
| `open` | the attempt did not establish the claim |
| `refuted` | the report carries a `REFUTED` line — a counterexample proves the claim **false**. A definitive closure in the negative direction, not a failure. |

`stage: "verifier-error"` is none of these: the check could not *run* (missing
toolchain, timeout). That is infrastructure. The draft still checkpoints; fix or
report the environment rather than editing the manuscript in response.

**Never touch the verifier.** Its manifest entry and the script it names are the
problem definition, exactly like the rubrics, and both are hashed into
`evaluator_version` — editing them visibly forks the evaluation history. Do not
weaken tolerances, special-case inputs, or reduce coverage to make the claim
close. If you believe the verifier itself is wrong, write that in the sidecar and
in your final status, and leave it for the human.

## Tempo: two loops, not one

The distinctive thing about proof mode is that the real iteration is *cheap*.

```
./nel verify        # only the verifier. no compose, no compile, no panel,
                    # nothing recorded. well under a second for a script.
```

Run it after **every substantive edit** to the construction. Spend `./nel step`
— panel, archive row, checkpoint — when the manuscript around the claim has
moved, not to ask the verifier a question `./nel verify` answers for free.

A run that spends `step` where it should have spent `verify` exhausts its budget
on bookkeeping.

## The loop (unattended)

**1. Read the verifier first.** While the claim is open, `./nel verify`'s report
says *what* failed. That is your next edit. Reviewer style notes can wait —
prose polish on an unclosed claim is work you may have to discard.

**2. Read state.**

- The **ledger** — what this project already knows, indexed by the problem
  rather than by the attempt. It arrives at the top of
  `.nel/log/feedback/branch-solo/latest.md` with nothing for you to do, and
  `./nel archive ledger [--kind dead-end]` lists it directly. An approach the
  ledger records as dead, *with a reason*, is not retried without a new idea that
  answers that reason; a statement it records as settled is not re-derived.
- Your latest panel feedback in the same file, and the tail of your branch log.
- **Ground your ideation.** `resources/CATALOG.md` (resolve with
  `./nel resources --path CATALOG.md`) and the `SYNOPSIS.md` of anything
  relevant. For a proof the useful unit is a *technique*, so read for
  transferable machinery, not for topic overlap.
- **What you can compute.** `[project].tools` in `nel.toml` names the external
  commands available here — a CAS, a numeric stack, a proof assistant. Reach for
  them: a computation that settles a case in seconds beats an argument you spend
  three attempts getting wrong. They are not sandboxed away from you, and
  `./nel doctor` has already checked they are on PATH.
- The section pair(s) you intend to touch.

**3. Propose — and ask before a hard move.** If a sub-problem will not yield, or
an approach might be a dead end, run `./nel consult "<question>"` *first*. It
costs no attempt and records nothing, and in proof mode it carries the current
verdict to the advisors, so they see exactly where the claim stands. Asking after
a failed attempt is strictly worse than asking before one.

Then edit — the construction, the `.tex` prose, or the `.md` spine — and iterate
against `./nel verify` until the edit is coherent.

**4. Record what died.** When an approach dies — the verifier stays open after a
genuine attempt, or you consciously abandon an angle — record it as you abandon
it, not later:

```
./nel step "<rationale>" --approach <name> \
    --dead-end "<the obstruction>|<what it taught you>"
```

`--dead-end` is repeatable. Also record a **settled sub-result** with
`--lemma "<statement>|<where it is established>"` so a later iteration does not
re-derive it, and a **refutation** with `--refutation "<claim>|<counterexample>"`.

These are indexed by the *problem*, not by the attempt, which is what makes them
findable when you are stuck on that problem again — possibly in a later run, with
none of this in your context (ADR 0024). Feedback files scroll away; the ledger
compounds.

**5. Evaluate and log.**

```
./nel step "<2-3 line rationale>" --approach <kebab-case-name> [--register tex|md|both]
```

The status line gains `"closed"` and `"verdict"`. The commit message carries the
verdict, so the checkpoint where `open` flips to `closes` is findable in
`git log` — that is the commit a reader wants.

`gate = true` in the verifier table is **spend control, not quality control**: it
saves panel calls on unclosed drafts at a named cost — the panel never produces a
qualitative post-mortem, and only the panel can say *why* an approach failed and
whether the direction is salvageable. For mathematical work prefer `gate = false`
(the default). Either way the attempt is recorded with its verifier report; gates
withhold the checkpoint and the panel, never the record.

**6. Stop** if any of:

- **both keys turn.** `./nel step` reports `"closed": true` *and*
  `"panel_concurs": true`. The verifier's key says the claim checks out; the
  panel's key says every reviewer that answered judged the manuscript a complete
  and rigorous treatment — no remaining gaps, no unproved essential lemmas, no
  assertion the verifier does not actually check.

  Neither key alone ends the run. A closed claim can sit inside a manuscript full
  of gaps, and a polished manuscript can assert more than the verifier checks.
  This is deliberately not your own judgement of whether the feedback went quiet:
  a reviewer that did not answer, or answered unparseably, counts as **not**
  ready, and a panel where every reviewer failed never concurs (ADR 0026).
- **the verifier reports `"verdict": "refuted"`** — a counterexample proves the
  claim as stated is **false**. Record the counterexample with `--refutation`
  *and* in the sidecar inside the spine block (a refutation is a settled negative
  result), state it plainly in your final status, and stop. Revising the claim is
  a problem-definition change — the human's decision, never yours.
- **you have run `./nel step` `max_attempts` times in THIS run.** Count your own
  calls; do not read a count from disk (ADR 0018).
- a `STOP` file exists at `.nel/STOP`.

Otherwise loop back to step 1.

## What is deliberately not a stop condition

**Repetition.** The authoring loop stops when the last two panels raise nothing
new, because for prose that is a genuine plateau. **That rule is absent here on
purpose.** A hard proof spends long stretches where every attempt looks like the
last one from the outside and the panel has nothing new to say, because the
mathematics has not moved — and that is exactly what the run immediately before a
breakthrough looks like (ADR 0025).

What replaces it is the ledger. Do not stop because attempts *resemble* each
other; stop retrying a specific approach because the ledger records why it died.
Those are different tests, and only the second one is evidence.

**The score.** It is a mean of uncalibrated reviewer judgements and it is not
what this run is about. The predicate is the fact (ADR 0013).
