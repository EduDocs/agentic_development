# Benchmarks — The Shared Substrate

> The single technical substrate the course runs on, foundations → capstone. Chosen so the
> **eval harness students build in Challenge 2 becomes the fitness function in the capstone**
> (Spine 1). Decisions: D-003, D-009, D-017, D-018, D-019.

## The task: scientific model discovery from data (symbolic regression)

Given a dataset `(features → target)`, find a closed-form model that predicts well and stays
simple. It is a real research move in every quantitative field, it has a **clean automatic
score**, and it is evolutionary by birth (classical SR *is* genetic programming).

## Dataset bank (easy first, then disciplinary, then own-data)

| Tier | Used in | Character | Examples |
|------|---------|-----------|----------|
| **0 — easy** | C1–C2 | Intuitive, low-dimensional, obvious law | distance = speed × time; a clean quadratic; an ideal-gas subset |
| **1 — disciplinary** | C2–C4 | Still clean / known-law, but per-field | Feynman-database eqns (physics); logistic & allometric growth (bio); Cobb-Douglas (econ); SIR curve (epi) |
| **2 — own data** | Capstone | Real-world, noisy, student-supplied | each student brings a `(features → target)` set from their domain |

Each dataset ships with a held-out test split; Tier 0–1 carry an optional ground-truth law
(instructor key). Exact picks finalized during build-out (S8/S9).

## Reference corpus (feeds retrieval — Spine 2)

Short per-domain notes — **units, common functional forms, dimensional constraints**. Challenge 3
retrieves these to *constrain* the model search, giving RAG a genuine job rather than a toy one.

## The eval harness / leaderboard (Spine 1)

Scores a proposed model on **held-out predictive error** (RMSE / R²) **+ a parsimony term**
(expression size or MDL) — multi-objective, surfaced as a Pareto front or a scalarized
**leaderboard**. Born in C2, reused for ablations in C3–C4, and reused as **fitness** in the
capstone. This is the engine behind the **comparative-performance** grade (D-014); how its
numbers map to grades is settled at S5.

## The baseline ladder (the methods progression, D-018)

1. **Linear regression** — trivial, intuitive; this is where students first *feel* what "fitness"
   means.
2. **PySR / classical symbolic regression** — genetic programming; **itself evolutionary**, so it
   previews the capstone, and it is the baseline the agentic method must beat.
3. **Agentic / evolutionary** — LLM-as-mutation/proposal operator + Agent SDK; the course's own
   method, layered on the same harness.

## Model & tool plurality (D-017)

Concepts are transferable; the course is **not single-vendor**. In play: Claude (CLI, VSCode
extension, Cowork), Codex (+ VSCode), Gemini (API), and **open-source agentic tools** (OpenCode,
Hermes, …) for accessibility so no student is gated by paid access. **Optional:** pull an
open-weights model from **Hugging Face** and run it locally — for accessibility and for
understanding the stack underneath the API. This plurality doubles as **benchmarking targets**.

## Model-benchmarking activity (D-019)

A task where students benchmark **methods** (linear → PySR → agentic) and/or **models/agents**
(Claude vs Gemini vs an open-weights model, as the proposal/mutation operator) on the shared
substrate, scored by the harness above. It exercises evaluation rigor, populates the leaderboard,
and showcases the tool plurality. *Placement in the 4-Challenge sequence is open (S8/S9).*

## Stack & compute floor

Python; **scikit-learn** (linear baseline); **PySR / gplearn** (SR); **Claude Agent SDK**
(orchestration); LLM operators via API (Claude / Gemini) or **local (Hugging Face, optional)**.
**Laptop + API access, no GPU required** — small datasets, cheap fitness. The optional local
model is the only piece that benefits from more hardware.

## Open (to finalize)

- Exact dataset choices per tier (S8/S9).
- Leaderboard score → grade mapping (S5).
- Where the benchmarking activity sits among C1–C4 (S8/S9).
