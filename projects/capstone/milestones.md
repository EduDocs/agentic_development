---
title: "Capstone Milestones"
status: draft
updated: 2026-06-25
unit: capstone
---

# Capstone Milestones

> The capstone runs ~weeks 9–15 and overlaps the tail of foundations (D-013). Dates are **soft**
> (slack is intentional); the **gates** are not. Each gate is a short studio review — a
> course-correction, not a grade — except the final, which is the summative.

| Gate | ~Week | Due | What it checks |
|------|-------|-----|----------------|
| **Proposal** | 9 | [`proposal-template.md`](proposal-template.md) filled; instructor sign-off | Scoped, feasible; data in hand; fitness defined |
| **Build checkpoint** | 11 | Fitness running on your data; baselines (linear, PySR) on the board; orchestrated agent producing candidates | The harness is **trustworthy** (no leakage); a baseline number exists to beat |
| **Evolve checkpoint** | 13 | Evolutionary loop running; lineage logged; first evolved result vs. baseline | Mutation operator works; diversity not collapsed; cost tracked |
| **Report + presentation** | 15 (finals) | Paper-style report + final presentation; system on GitHub | Reproducible; honest limitations; the story is clear |

The two checkpoints exist to catch the two classic failure modes early: a **leaking fitness** (caught
at week 11, before you optimize against a broken metric) and a **collapsed search** (caught at week
13, while there's still time to add diversity).
