# Synthesis — turning four opinions into a short, honest list

The panel returns one JSON object per persona: `prose_score`, `direction_score`,
`rubric_score`, `strengths`, `weaknesses`, `actionable`. Four reviewers producing up to
five actionable items each is up to twenty items, and the raw list is systematically
misleading in three ways:

- **Padding.** A reviewer asked for actionable items will produce them whether or not
  the paper needs five. The tail of each list is filler.
- **Duplication.** The same defect surfaces in different vocabulary from different
  lenses — `rigor` calls it an unstated hypothesis, `clarity` calls it a confusing
  jump.
- **False confidence.** Every item arrives in the same declarative register whether the
  reviewer is certain or guessing.

Your job is to collapse that into three to five things worth doing.

## Cluster first, then rank

**1. Cluster by defect, not by wording.** Two items are the same finding if fixing one
would satisfy the other. Merge them and record how many personas raised it
independently.

**2. Weight agreement, but do not require it.** Two or more personas on the same defect
is the strongest signal available — it survived different lenses. But a single-lens
finding that is *specific and checkable* (a named undefined symbol, a step that does
not follow) outranks a vague consensus that the paper "could be clearer".

**3. Drop these:**
- items that name nothing specific ("tighten the exposition", "improve motivation")
- pure style preferences already governed by `resources/STYLE.md` or `format-tex`
- anything about the score, length, or perceived venue fit rather than the content
- a `direction_score` complaint about a sidecar the user has not started realizing —
  the spine is allowed to be ahead of the prose

**4. Contradictions are findings.** If `novelty` wants the framing broadened and
`referee` wants it narrowed, do not average them and do not silently pick one. Report
the tension — it is usually a real decision the author has been deferring, and naming
it is more useful than either recommendation.

## Rank by impact per edit

Order what survives by what most improves the paper for the least work:

1. **Correctness** — a wrong claim, a broken step, a missing hypothesis. Always first;
   nothing else matters if the mathematics is wrong.
2. **Load-bearing structure** — a definition that arrives after its first use, a result
   whose statement does not match its proof, a section that promises what it never
   delivers.
3. **Comprehension blockers** — a passage a competent reader cannot follow on one pass.
4. **Polish** — everything else. Usually worth one line, not a finding.

Within a tier, prefer the finding whose fix is localized. A defect in one paragraph
beats a defect that requires re-planning three sections, even at equal severity —
report the larger one, but let the user act on the tractable one first.

## Report shape

Lead with the finding, not the machinery:

```
The argument in main_result closes only for the bounded case, but the statement
claims generality. Two reviewers flagged it independently.
  → sections/main_result.tex, the step after Lemma 2
  → either restrict the theorem statement, or handle the unbounded case explicitly

Definitions arrive after first use in system_model.
  → sections/system_model.tex — move the notation block above the model description

Working: the introduction's framing and the worked example both landed with every
reviewer. Leave them alone.
```

Then one question: which to take. Not a menu of twenty.

## What not to say

- Do not report the score as a headline, a trend, or a target. It is a mean of four
  uncalibrated judgements and it moves between runs on an unchanged draft.
- Do not say "the panel recommends" — the panel does not agree with itself. Attribute a
  contested finding to the lens that raised it.
- Do not manufacture a finding to reach three. If the draft is in good shape, say that,
  name the one thing worth doing next, and stop.
