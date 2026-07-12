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

## Papers (7)

| Folder | arXiv | Title | Year | Tags | Role in the manuscript |
| ------ | ----- | ----- | ---- | ---- | ---------------------- |
| `arXiv-1301.3781v3/` | 1301.3781v3 | Efficient Estimation of Word Representations in Vector Space | 2013 | word-embeddings, representation-learning, semantic-similarity | word2vec; primary source for learned embeddings / cosine-similarity semantics (Ch7) and the representation-learning lineage (Ch1). |
| `arXiv-1310.4546v1/` | 1310.4546v1 | Distributed Representations of Words and Phrases and their Compositionality | 2013 | word-embeddings, representation-learning, semantic-similarity | word2vec follow-up (negative sampling, phrase vectors, additive compositionality); companion embeddings source for Ch7 alongside 1301.3781. |
| `arXiv-1409.3215v3/` | 1409.3215v3 | Sequence to Sequence Learning with Neural Networks | 2014 | sequence-to-sequence, lstm, neural-machine-translation, representation-learning | Foundational seq2seq / encoder–decoder; lineage anchor for the LLM substrate (Ch1) and an early "input arrangement matters" precedent (Ch3). |
| `arXiv-1706.03762v7/` | 1706.03762v7 | Attention Is All You Need | 2017 | transformer, attention, sequence-to-sequence, neural-machine-translation | The Transformer; architectural keystone of the LLM substrate (Ch1) and primary source for self-attention behind the context-rot / attention-budget mechanism (Ch3). |
| `arXiv-1810.04805v2/` | 1810.04805v2 | BERT: Pre-training of Deep Bidirectional Transformers for Language Understanding | 2018 | transformer, pretraining, contextual-embeddings, representation-learning | BERT; primary source for contextual text embeddings behind modern retrieval (Ch7) and the pretrain-then-adapt paradigm (Ch1). |
| `arXiv-2005.11401v4/` | 2005.11401v4 | Retrieval-Augmented Generation for Knowledge-Intensive NLP Tasks | 2020 | retrieval-augmented-generation, retrieval, dense-retrieval, question-answering | RAG; the primary source the retrieval chapter rests on (already cited) — parametric/non-parametric memory, retrieve-then-generate, grounding (Ch7). |
| `arXiv-2005.14165v4/` | 2005.14165v4 | Language Models are Few-Shot Learners | 2020 | language-models, in-context-learning, scaling, evaluation | GPT-3; primary source for in-context/few-shot prompting (Ch3), the scaling "why now" (Ch1), and web-scale benchmark contamination/leakage (Ch6). |

## Maintenance
- `get-arxiv` adds a row here on ingest; keep the table curated and sorted as it grows.
- **Tags** are the source of triage. They live in each paper's `SYNOPSIS.md` YAML header
  (`tags:`) and are surfaced here as a column — the header is the source of truth, this column is
  the view. Reuse existing tag words rather than coining near-duplicates.
- Keep rows lean: title, tags, and a one-line role. Depth lives once, in each `SYNOPSIS.md`.
- Bump the `## Papers (N)` count on each ingest.
