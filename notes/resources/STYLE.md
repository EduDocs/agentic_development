# House style (prose)

The style guide `notes/CLAUDE.md` points at. Figures have their own guide,
[`STYLE-figures.md`](STYLE-figures.md); the `.tex` / `.md` sidecar mechanics live in
`PROGRESSION.md`; course scope and decisions live one directory up, in `CLAUDE.md` and
`DECISIONS.md`.

Every claim below was checked against `sections/*.tex` on 2026-08-08, and the counts are
there so a future reader can tell a convention from an aspiration.

## What this is

Course notes, not a book and not a research paper. The title page says *Agentic
Development & Discovery: Empowering Researchers in Compute-Adjacent Fields, Course
Notes*, and the register should match that. Aim for clear teaching prose, not
publication-grade polish, and do not let the manuscript drift toward a monograph.

## Who is reading

Graduate students across disciplines, mostly quantitative, with some Python and high
general ability, but with **no assumed background** in agents, git, the shell, or
professional tooling. Nothing may assume a CS background. A biologist, an economist and
a physicist should each be able to see a path to their own work.

## Voice

- **Name the reader** as "the learner" (didactic third person), or as "a researcher" or
  "a scholar", or address them directly as "you". Never "the student": the reader *is*
  the student, so the phrase talks past them. (0 uses of "the student"; 29 of
  learner/researcher/scholar; 94 of you/your.)
- **Illustrate with named disciplines.** When an example needs a person, make them a
  biologist fitting population models, an economist searching model specifications, a
  physicist proposing functional forms, a chemist screening candidates. This roll-call
  recurs throughout and is what keeps the cross-disciplinary promise concrete.
- **The discovery lens.** The subject is agentic development and evolutionary frameworks
  in service of *discovery*, amplifying what a scholar can find out. Never commercial or
  revenue framing. This is a lens for choosing examples and framing claims, not a
  sentence to be inserted anywhere.
- **Prefer the durable pattern to the product surface.** Where a product must be named,
  date the snapshot and say where to check for drift.

## Punctuation

Avoid em dashes (`---`). A colon, a comma, parentheses or a semicolon almost always
does the job, and usually says more precisely which relation is meant.

The mainmatter has had a reduction pass and now averages about two per chapter. The two
appendices predate it and still carry many (`rig_reference` 20, `cowork_reference` 23),
so do not read them as the model here.

## Citations

- **No `\cite`.** Verified: zero uses across all sections. Cite author-year inline
  instead, as "(Liu et al., 2024)" or "(Anthropic, 2025)".
- **Each chapter closes with `\section*{Further Reading}`**, a `small` enumerate whose
  entries carry a full reference plus one clause on why it matters to this chapter.
  Every chapter except the preface has one.
- `references.bib` exists but is not wired in; the build runs bibtex only if something is
  actually `\cite`d, so it currently never runs.

## Structure

- **Environments in use:** `definition` (8), `example` (42), `principle` (12),
  `remark` (32). `theorem` and `proposition` are declared in the preamble and never
  used, which is the correct ratio for teaching notes: the load is carried by worked
  examples and named principles, not by theorem-proof.
- **`\index{Term}`** at a term's first substantive mention (141 entries).
- **`\code{...}`** for inline code, identifiers and filenames (215 uses).
- **Non-breaking ties** before cross-references and after abbreviations:
  `Figure~\ref{...}`, `Chapter~\ref{...}`, `Principle~\ref{...}`, `Eq.~\eqref{...}`,
  `top~$k$`.

## Source formatting

- **One sentence per source line.** Verified: 1594 prose lines, none carrying two
  sentences. This is what keeps diffs and `git blame` readable, and it is the single
  most consistently held convention in the manuscript. The `/format-tex` skill does the
  mechanical pass.
- **Edit only between `% EVOLVE-BLOCK-START` and `% EVOLVE-BLOCK-END`.** Everything
  outside those markers is fixed scaffolding.
- Sidecars (`sections/*.md`) use the markdown equivalent, one sentence per line, via
  `/format-md`.

## Keep the course scaffolding out

The notes should read on their own, without the syllabus beside them. Avoid assignment
labels, week numbers and unit names in prose and in captions.

Currently clean on week numbers (0). "Challenge~N" survives only in one baseline-mapping
table in `evolutionary_frameworks.tex` and in one code listing, both places where the
label is the actual subject. "The capstone" is used nine times as a forward-pointer,
which reads fine because it names a kind of work rather than a calendar slot.
