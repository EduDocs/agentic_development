# nel — the authoring protocol

> **Engine-owned; do not edit.** This file is vendored from the engine to
> `.nel/NEL.md` and **overwritten by `scaffold.py update`** — that is how protocol
> fixes reach an existing project. Your paper's own instructions (the problem
> statement, your conventions) live in the project's `CLAUDE.md`, which imports
> this file with `@.nel/NEL.md` and is never overwritten. If you need to change
> the protocol for one paper, override it in `CLAUDE.md` *after* the import rather
> than editing here, where the next update will discard it.

You **author a mathematical paper** under an iterated review loop. The evolving
artifact is the sectionized LaTeX manuscript at the **project** root — the
directory holding `nel.toml`, which is not necessarily a repo root: a project
may be nested inside a larger repository. The cycle is:
propose a change, evaluate it, read the critique, propose the next one.

**What the paper is about** — the problem, the contribution you are driving
toward — is stated under `## Problem` in the project's `CLAUDE.md`. Read it
first; this file tells you only *how* to work, never *what* to write.

## Which loop you are running

This file is the part of the protocol that does not depend on what kind of paper
this is. The **loop itself** does, and it lives in a second file:

- **`.nel/loop.proof.md`** — if `nel.toml` declares an `[evaluation.verifier]`
  table. The paper carries a checkable claim and ships a deterministic check for
  it, so the run is driving toward a *predicate*, not toward better prose.
- **`.nel/loop.authoring.md`** — otherwise. There is no honest scalar, the
  reviewer panel is the only judge, and the run is driving toward prose that
  stops attracting criticism.

Read the one that applies, in full, before your first move. The declared
verifier **is** the mode (ADR 0013) — there is no `kind` key to set and nothing
to configure. `./nel step` reports which mode it ran in as `"mode"` in its status
line, and `./nel doctor` names it in preflight; if either disagrees with the file
you read, stop and say so rather than guessing.

The two loops differ in more than emphasis. Their stop conditions are different,
their tempo is different, and a rule that is right in one is actively wrong in
the other — the authoring loop treats repetition as exhaustion, which for a hard
proof is what the run immediately before a breakthrough looks like (ADR 0025).

## Artifact: the manuscript and its sidecars

The manuscript is a set of section **pairs** under `sections/`:

- `sections/<name>.prose.tex` — the shipped, polished prose (the only thing the
  PDF sees), assembled by `main.tex` via `\input{sections/<name>.prose}`. (The
  name is typed — subject.register.format, ADR 0019 — so both halves of a pair
  name a *register* rather than one naming a file extension. "The `.tex`" below
  means this file.)
- `sections/<name>.concepts.md` — the *sidecar*: scratch, the conceptual
  spine, theorem sketches, promising directions, and a decision log. Never
  `\input`; invisible to the build. (The name is typed —
  subject.register.format — so sibling registers can appear later; a bare
  `<name>.md` is the legacy spelling and still works. "The `.md`" below means
  the sidecar, whichever spelling this project uses.)

`templates/` (document class, preamble, macros) and `references.bib` are shared
infrastructure. Write prose to the **house style guide**: get its effective path
with `./nel resources --path STYLE.md` (your project's copy if it has one, else
the engine's — don't build the path by hand). `./nel resources --path exemplars`
gives you gold section pairs — read one before writing your first, and
`./nel resources` lists both layers with shadowing marked. Read
**`PROGRESSION.md`** — it defines the `.tex ↔ .md` sidecar
convention, the source-of-truth flip, and the exclusive zones. The key rule:

- In `.tex`, `% EVOLVE-BLOCK-START … % EVOLVE-BLOCK-END` bounds the prose you may
  edit; everything outside is fixed scaffolding.
- In `.md`, `<!-- EVOLVE-BLOCK-START --> … <!-- EVOLVE-BLOCK-END -->` bounds the
  **shareable spine** the evaluator and the archive export outward. The rest of
  the sidecar is private scratch you may still freely edit.

"EVOLVE" in those markers is inherited from the engine's search ancestry and is
the one place that vocabulary survives; read it as "the region you may edit",
not as an instruction to optimize. What the markers bound is a *zone*, not a
generation.

## Mode: is a human watching?

- **Unattended** — you were launched to run the loop until a stop condition, and
  nobody is reading each step as it happens. The launch is
  `claude "Follow .nel/NEL.md."` from a plain terminal — this file, named by
  path (ADR 0017). The path matters: `CLAUDE.md` is auto-loaded from the
  session's directory *and every ancestor*, so in a project nested inside a
  larger repo that name matches two or three files. This one is unambiguous,
  and it is the file the contract requires. You still have the project's
  `CLAUDE.md` — auto-loading delivers it whether or not the prompt says so.
- **Attended** — a human is driving and asking for one thing at a time. Do not
  run the loop; do what they asked and stop. To report on the draft, use the
  **`critique`** skill — it evaluates without recording an attempt or committing,
  so the decision about what to change, and whether to keep it, stays theirs.

You are a single worker. `BRANCH_ID` is normally unset (or `"solo"`), and
`NEL_LOG_DIR` defaults to `.nel/log`. Both exist so that several workers *could*
share one archive and one log mirror, but the engine ships no multi-worker
launcher today — so there are no sibling branches to read and no cross-branch
coordination to do.

## Asking a question: `./nel consult`

The reviewer panel judges a finished draft. When you are stuck *mid-move* — a
sub-problem will not yield, an approach might be a dead end, you want a second
reading of a step — do not spend a `./nel step` to find out. Run:

```
./nel consult "<a specific sub-question>"
```

It sends your question, the manuscript, the spine, and (in proof mode) the
current verifier verdict to every reviewer backend installed, and prints their
answers verbatim. They are briefed as **collaborators, not referees**: expect
approaches, decompositions and adjacent results rather than scores.

Nothing is recorded — no attempt, no archive row, no checkpoint. The transcript
lands in `.nel/log/consult/` so you can re-read it next iteration. Ask *before* a
hard move, not after a failed one. A question is cheap; a wasted attempt is not.

If a backend reports a nested-sandbox failure, that voice is unavailable to you
but available to your human from a plain terminal — say so in your status rather
than treating the backend as broken.

## Evaluation

`evaluate.py` does not return a bare number. It composes the manuscript and the
sidecar spine, then runs, in order:

1. a **compile gate** — a manuscript that does not build scores 0 with the LaTeX
   error as feedback. Fix that before anything else.
2. a **quantitative metrics gate** — undefined references and citations,
   duplicate labels, TODO markers left in shipped prose. The gated list is
   `[evaluation.metrics]` in `nel.toml`; a violation scores 0 with the metrics
   report as feedback and the panel never sees the draft.
3. in proof mode, the **declared verifier** (see `.nel/loop.proof.md`).
4. the **critic panel** — the personas in `.nel/prompts/reviewers/`, dispatched
   to external backends for actionable, textual feedback.

The metrics report is always prepended to the panel feedback, so watch it even
when you pass. The `score` is the mean reviewer rubric — a light signal for
bookkeeping; the **feedback text is the point**. Respond to it specifically.

There is deliberately **no score threshold** to stop at (ADR 0010). The score is
a mean of uncalibrated 0–1 judgements that moves between runs on an unchanged
draft; it is not a quantity you can aim at. Judge the *feedback*.

## What not to do

- Do not edit outside the EVOLVE-BLOCK regions of `sections/*.{tex,md}` (except
  adding a section slot in `main.tex` + `PROGRESSION.md`). `step.py` handles all
  log writes — do not open `branch-solo.md`, `by-approach/*.md`, or `feedback/`
  for writing yourself.
- Do not modify `templates/`, the preamble, or the EVOLVE-BLOCK markers.
- Do not modify the evaluator, the reviewer rubrics, `max_attempts`, or — in
  proof mode — the `[evaluation.verifier]` entry and the script it names. These
  are the problem definition, not variables you tune. Do not pad the spine with
  speculative sketches to inflate `direction_score` — the editor persona checks
  whether promises get realized.
- Do not let `.md` scratch leak into the `.tex` (respect the exclusive zones in
  `PROGRESSION.md`).
- Do not call out to the network except via the sanctioned skills
  (`get-arxiv`/`check-arxiv`) for the resource library.
- Do not stop early because you "don't see an obvious improvement." Log the
  attempt with `step.py` and try a different direction. The budget exists to
  outlast local plateaus.
