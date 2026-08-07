---
videos:
  - title: Agentic Coding
    url: https://youtu.be/mZCFOGAJCUs
---

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
- The diff-reading example was singled out by the clarity panel as the manuscript's most effective device — preserve the "show what the diff reveals" pattern and consider a second, subtler instance (a silent dtype/units change).

## Decisions
- 2026-07-10: read-every-diff framed as a professional discipline and explicitly forward-referenced from Ch.~AgenticRig's human-in-the-loop material, so the two chapters form one argument about ownership.
- 2026-07-10 (realized in prose): added the **chapter roadmap** after the opening (read–direct–inspect loop, then the diff / environments / version-history sections).
- 2026-07-10 (realized in prose, rigor nit): the CSV-loader diff discussion now notes the **implicit `pandas`/`pd` dependency** the diff introduces — reinforcing "read what the diff assumes" rather than modeling the omission.
- 2026-07-10 (realized in prose): absorbed the workshop's **verification-oracle framing** into §The Agentic Coding Loop — the interpreter/test runner as a ground-truth check ("this code runs" is a prediction in chat, a checked fact in the rig; the structured error signal is what makes run–fail–fix converge), wired forward to Ch.~Evaluation (oracle formalized = evaluation harness).
- 2026-07-10 (realized in prose, pedagogy): added a **diligence callback** Remark at the end of §Reading the Diff — names the read-every-diff/ownership habit as what Anthropic's AI-fluency framework calls *diligence* (Anthropic, 2025) and cross-links its companions *description* (Ch.~ContextEngineering) and *discernment* (Ch.~Evaluation). Deliberately a one-point vocabulary borrow, not an adoption of the 4Ds as an organizing scheme (which would compete with the ladder/spines).
- 2026-07-11 (realized in prose, engineering-blog pass): added a **reproducibility** Remark — pinning dependencies is necessary but not sufficient: the serving stack (routing/hardware/flags) and container resource budgets are variables too (postmortem 2025, infra-noise 2026); Further Reading on best-practices, SWE-bench, and infrastructure-noise.
<!-- EVOLVE-BLOCK-END -->

## Open questions
- Balance of git mechanics (Ch.~AgenticRig) vs git discipline (here). Keep mechanics in Ch.~AgenticRig, discipline here; watch for the atomic-commit idea drifting into both.
