# arXiv Watch Profile

The standing query for `/check-arxiv`: what counts as **relevant** when scanning arXiv for new
papers not yet in the library. If `CATALOG.md` is what you *have*, this is what you *want* —
`/check-arxiv` surfaces "want − have," suggests a ranked shortlist, and never downloads (use
`get-arxiv <id>` to ingest the ones you choose).

**EDIT THIS FOR YOUR PAPER.** Seed it from your manuscript's topic and the references you already
cite, then curate over time. **Reuse the tag vocabulary** from `CATALOG.md` so the watch list
lines up with the catalog. This file is tracked; the per-clone scan state lives separately in
`scratch/check-arxiv-state.md` (gitignored).

## Categories
arXiv category codes to scan (one per line, e.g. `math.CO`, `math.PR`, `cs.IT`, `math.OC`):
- math.CO
- math.PR
- cs.IT

## Keywords
Topic terms matched in title/abstract; reuse `CATALOG.md` tag words where possible:
- (replace with your paper's core topics)

## Authors (optional)
Researchers to follow, in arXiv author form (e.g. `Erdos_P`):
-

## Excludes (optional)
Terms or categories to down-rank or skip (reduce false positives):
-
