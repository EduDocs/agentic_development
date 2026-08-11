# Local arXiv Library — Catalog

Annotated registry of papers ingested under `resources/` via the `get-arxiv` skill. This is the
**triage layer** of a three-tier navigation scheme that grounds the authoring agent's ideation
in expert-curated articles:

1. **Triage — this file (`CATALOG.md`).** Scan the table to pick the relevant paper(s) by topic,
   tags, and role, without opening anything else.
2. **Synopsis — each paper's `SYNOPSIS.md`.** Read one paper's reading note for the gist, key
   claims, and "Citable as" pointers into `sections/*.tex`.
3. **Deep dive — the paper folder.** Open the actual `.tex`/figures (`00README.json` names the
   top-level file) only when you need the detail.

**Agents: start here.** Triage from this table first; open a `SYNOPSIS.md` only for the papers
that survive triage; crack a folder only for a deep dive. Do **not** read every synopsis to decide
relevance — that is what this table is for. Cite a paper from the manuscript by adding it to
`references.bib` and using `\cite{}`.

Each paper lives in its own `arXiv-<id>v<ver>/` mini-project (original top-level `.tex` + `.bbl`,
figures, a `justfile`, `CLAUDE.md` build notes, and a `SYNOPSIS.md`).

> The paper folders are gitignored (large/binary); only this catalog and [`WATCH.md`](WATCH.md)
> are tracked, so the registry travels with the repo while the sources stay local. `just resources`
> lists what is actually on disk right now.
>
> `CATALOG.md` is what the library **has**; [`WATCH.md`](WATCH.md) is what it **wants** — the
> `/check-arxiv` profile that suggests relevant new papers not yet ingested.

## Papers (15)

| Folder | arXiv | Title | Year | Tags | Role in the manuscript |
| ------ | ----- | ----- | ---- | ---- | ---------------------- |
| `arXiv-1301.3781v3/` | 1301.3781v3 | Efficient Estimation of Word Representations in Vector Space | 2013 | word-embeddings, representation-learning, semantic-similarity | word2vec; primary source for learned embeddings / cosine-similarity semantics (Ch7) and the representation-learning lineage (Ch1). |
| `arXiv-1310.4546v1/` | 1310.4546v1 | Distributed Representations of Words and Phrases and their Compositionality | 2013 | word-embeddings, representation-learning, semantic-similarity | word2vec follow-up (negative sampling, phrase vectors, additive compositionality); companion embeddings source for Ch7 alongside 1301.3781. |
| `arXiv-1409.0473v7/` | 1409.0473v7 | Neural Machine Translation by Jointly Learning to Align and Translate | 2014 | attention, sequence-to-sequence, neural-machine-translation, encoder-decoder | Bahdanau attention; origin of the soft-attention / weighted-retrieval mechanism that generalises to the Transformer context window — citable in context-engineering (Ch3) and the seq2seq lineage (Ch1). |
| `arXiv-1409.3215v3/` | 1409.3215v3 | Sequence to Sequence Learning with Neural Networks | 2014 | sequence-to-sequence, lstm, neural-machine-translation, representation-learning | Foundational seq2seq / encoder–decoder; lineage anchor for the LLM substrate (Ch1) and an early "input arrangement matters" precedent (Ch3). |
| `arXiv-1706.03741v4/` | 1706.03741v4 | Deep Reinforcement Learning from Human Preferences | 2017 | reinforcement-learning, rlhf, agents, evaluation, reasoning | RLHF (Reinforcement Learning from Human Preferences); primary source for human-feedback-based reward learning underlying LLM alignment, the generate-evaluate-update cycle connecting to evolutionary frameworks (Ch10), and the design of online evaluation loops (Ch7). |
| `arXiv-1706.03762v7/` | 1706.03762v7 | Attention Is All You Need | 2017 | transformer, attention, sequence-to-sequence, neural-machine-translation | The Transformer; architectural keystone of the LLM substrate (Ch1) and primary source for self-attention behind the context-rot / attention-budget mechanism (Ch3). |
| `arXiv-1810.04805v2/` | 1810.04805v2 | BERT: Pre-training of Deep Bidirectional Transformers for Language Understanding | 2018 | transformer, pretraining, contextual-embeddings, representation-learning | BERT; primary source for contextual text embeddings behind modern retrieval (Ch7) and the pretrain-then-adapt paradigm (Ch1). |
| `arXiv-2001.08361v1/` | 2001.08361v1 | Scaling Laws for Neural Language Models | 2020 | scaling, language-models, transformer, pretraining, evaluation | Scaling laws for LLMs (N, D, C power-laws, compute-efficient frontier); primary source for why frontier model scale matters in the agentic_paradigm chapter and for rigorous eval methodology in the evaluation chapter. |
| `arXiv-2005.11401v4/` | 2005.11401v4 | Retrieval-Augmented Generation for Knowledge-Intensive NLP Tasks | 2020 | retrieval-augmented-generation, retrieval, dense-retrieval, question-answering | RAG; the primary source the retrieval chapter rests on (already cited) — parametric/non-parametric memory, retrieve-then-generate, grounding (Ch7). |
| `arXiv-2005.14165v4/` | 2005.14165v4 | Language Models are Few-Shot Learners | 2020 | language-models, in-context-learning, scaling, evaluation | GPT-3; primary source for in-context/few-shot prompting (Ch3), the scaling "why now" (Ch1), and web-scale benchmark contamination/leakage (Ch6). |
| `arXiv-2201.11903v6/` | 2201.11903v6 | Chain-of-Thought Prompting Elicits Reasoning in Large Language Models | 2022 | chain-of-thought, reasoning, prompting, in-context-learning, language-models, scaling | Chain-of-thought prompting; primary source for the step-by-step reasoning technique behind context engineering (context_engineering chapter) and transparent agent traces (agent_loop chapter). |
| `arXiv-2203.02155v1/` | 2203.02155v1 | Training language models to follow instructions with human feedback | 2022 | reinforcement-learning, rlhf, fine-tuning, language-models, evaluation, prompting | InstructGPT / RLHF; primary source for aligning LLMs with human intent via supervised fine-tuning + reward modeling + PPO, foundational to agentic_paradigm (alignment vs. capability), evaluation (human-preference eval design), and evolutionary_frameworks (RL as generate-evaluate-select loop). |
| `arXiv-2210.03629v3/` | 2210.03629v3 | ReAct: Synergizing Reasoning and Acting in Language Models | 2022 | agents, reasoning, chain-of-thought, tool-use, in-context-learning, prompting, question-answering, reinforcement-learning, language-models | ReAct paradigm — interleaved reasoning traces and tool actions; primary source for the agent loop (Ch6) and context engineering via trajectory prompts (Ch4). |
| `arXiv-2307.03172v3/` | 2307.03172v3 | Lost in the Middle: How Language Models Use Long Contexts | 2023 | language-models, in-context-learning, retrieval-augmented-generation, retrieval, evaluation, question-answering, prompting | Positional sensitivity in long contexts (U-shaped performance curve); primary source for context-window layout constraints in context_engineering (Ch4) and RAG reader saturation in retrieval (Ch8). |
| `arXiv-2510.04618v3/` | 2510.04618v3 | Agentic Context Engineering: Evolving Contexts for Self-Improving Language Models | 2025 | context-engineering, agents, prompting, in-context-learning, memory, self-improvement, evaluation | ACE; names and measures *context collapse*, argues contexts should be evolving playbooks not summaries, and shows delta-update memory beats prompt optimizers on agent + finance tasks. Directly bears on context_engineering (Ch4) — note the terminology collision with that chapter's own "Agentic Context Engineering" subsection — plus caching economics, context evolution as a generate-evaluate-select loop (Ch10), and feedback quality as the precondition for self-improvement (Ch7). |

## Maintenance
- `get-arxiv` adds a row here on ingest; keep the table curated and sorted as it grows.
- **Tags** are the source of triage. They live in each paper's `SYNOPSIS.md` YAML header
  (`tags:`) and are surfaced here as a column — the header is the source of truth, this column is
  the view. Reuse existing tag words rather than coining near-duplicates.
- Keep rows lean: title, tags, and a one-line role. Depth lives once, in each `SYNOPSIS.md`.
- Bump the `## Papers (N)` count on each ingest.
