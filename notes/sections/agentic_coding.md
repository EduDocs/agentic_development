# agentic_coding — scratch

> Sidecar for `agentic_coding.tex`. Not part of the LaTeX build.
> The EVOLVE-BLOCK below is the shareable spine exported to reviewers and elites;
> everything outside it is private scratch you may freely edit.

## Purpose
Make "the researcher owns every change" a working discipline: the
specify–execute–read–commit loop and the habit of reading every diff.

<!-- EVOLVE-BLOCK-START -->
## Key points / spine
- Agentic coding is authorship with the typing contracted out: every file the agent writes belongs to the researcher and will be graded and re-run on a clean machine. The risk is not bad code — it is the researcher who stops reading.
- The **Specify → Execute → Read → Commit** loop, run incrementally (Principle~IncrementalDevelopment: small steps compound correctly; large steps compound errors).
- **Reading the diff** is the single most important habit: the worked CSV-loader diff shows a diff *revealing* a hidden `'target'`-column assumption invisible in the running output.
- Reproducibility: dependency pinning, virtual environments, a **one-command run**; atomic commits (Principle~AtomicCommits) with messages that explain *why*.

## Directions
- Add a **chapter roadmap** after the opening.
- The diff-reading example was singled out by the clarity panel as the manuscript's most effective device — preserve the "show what the diff reveals" pattern and consider a second, subtler instance (a silent dtype/units change).

## Decisions
- 2026-07-10: read-every-diff framed as a professional discipline and explicitly forward-referenced from Ch.2's human-in-the-loop material, so the two chapters form one argument about ownership.
<!-- EVOLVE-BLOCK-END -->

## Open questions
- Balance of git mechanics (Ch.2) vs git discipline (here). Keep mechanics in Ch.2, discipline here; watch for the atomic-commit idea drifting into both.
