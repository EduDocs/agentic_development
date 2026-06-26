# Challenge 1 — Agentic Coding & the Reproducible Repo

**Weeks:** ~1–2 · **Mode:** individual · **Substrate:** model discovery from data (Tier 0)

## The capability you're building
Code *with* an agent, reproducibly. Drive the agent to build a small, correct, versioned tool —
and be able to re-run the whole thing from scratch with one command. This is the rung the rest
of the course stands on: you cannot build a research *agent* (Challenge 2) until you can fluently
direct an agent to write and run code, and until your work is reproducible enough to trust.

## What you'll make
The **first rung of the baseline ladder** (D-018): a small, reproducible pipeline that

1. **loads** a Tier-0 dataset — an easy, intuitive `(features → target)` set from
   [`benchmarks/`](../../benchmarks/README.md) (e.g. `distance = speed × time`, a clean quadratic),
2. **fits** a **linear-regression** baseline,
3. **scores** it on a held-out test split (predictive error),
4. **reports** the score in the shared leaderboard format.

You will *drive the agent* to build this — but you own the result. You read every diff, you commit
at checkpoints, and you can reproduce the run on a clean machine.

## Deliverables
- A **versioned repo** (your `Students/<id>/challenge-1/` or a linked repo) containing:
  - the pipeline (loader · linear fit · scorer),
  - a **pinned environment** (`requirements.txt` or `pyproject.toml`),
  - a **one-command run** (e.g. `just run` or `python -m challenge1`),
  - a short `README.md` (what it does, how to run it),
  - a **clean commit history** showing real checkpoints (not one giant commit).
- Your **linear-baseline score** on the Tier-0 dataset, in leaderboard format.

## How it's scored
A comparative leaderboard entry (the linear baseline) — but the weight here is mostly on
**process**: reproducibility, a clean git history, and a working one-command run. Getting a great
score is easy with linear data; doing it *reproducibly and legibly* is the point. (Rubric: S9.)

## Reading
- Workshop **Lessons 01–02** (prompting, context, `CLAUDE.md`, sessions) and **Appendices B/C**
  (git, just) in [`resources/claude-cli-workshop/`](../../resources/claude-cli-workshop/).
- [`benchmarks/README.md`](../../benchmarks/README.md) — the substrate and the leaderboard format.

## How it connects
- **Spine 1 (evaluation):** you build the **scorer** here — the seed of the eval harness that
  Challenge 2 grows into a reusable module and the capstone evolves on.
- **Spine 2 (context):** a good `CLAUDE.md` for *your* repo is part of the deliverable — you
  practice context engineering on your own code.
- **Baseline ladder (D-018):** linear regression is rung 1; PySR and the agentic method arrive in
  Challenge 2. You're establishing the bar the smarter methods must clear.
