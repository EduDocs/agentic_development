# Figure style guide (conceptual block diagrams)

The course's conceptual figures (boxes-and-arrows diagrams that show a relationship
or a flow) should share one visual language so the book reads as a single hand.
The exemplars are the perceive-reason-act loop (`figure:AgentLoop`, Chapter 2) and
the block diagrams of Chapter 1. This guide fixes the parameters; the shared TikZ
styles live in [`figures/concept-style.tex`](../figures/concept-style.tex).

## Scope

- **Applies to:** conceptual / relational diagrams (block nodes joined by arrows):
  loops, spectrums, ladders, pipelines, proposer-critic, data-flow.
- **Does not apply to:** the product mock-ups under `figures/` (the three rig
  figures share their own separate visual language), or data/plot figures
  (`pgfplots`), which have their own conventions.

## The house parameters

Load the shared styles at the top of each figure and use the named styles:

```latex
\input{figures/concept-style}
\begin{tikzpicture}
  \node[conceptbox, fill=blue!15] (a) {Observe};
  ...
  \draw[conceptflow] (a) -- (b);
\end{tikzpicture}
```

| Element | Convention |
|---|---|
| Node shape | `conceptbox`: `draw`, `rounded corners=4pt` |
| Node size | `minimum width=2.4cm`, `minimum height=0.85cm` (widen per figure as needed, keep height) |
| Node font | `\small`; `align=center` |
| Node fill | a **natural hue at `!15`** from the palette below (never darker) |
| Arrows | `conceptflow`: `->`, `>=stealth'`, `thick` |
| Edge / annotation labels | `conceptlabel`: `\scriptsize`, `align=center` |
| Capitalization | **capitalize the first letter** of a node label (`Workflow`, not `workflow`); sentence case, no terminal period |

## Colour palette (semantic, all at `!15`)

Reuse the same hue for the same role across figures:

- `blue!15` — input / observe / the starting state
- `orange!15` — process / reason / transform
- `green!15` — output / act / the accepted result
- `gray!15` — neutral / infrastructure / data
- `violet!15` — the agent / model role (matches the rig figures' agent hue family)

Mixing `!15` and `!20` across figures is the kind of drift this guide exists to
prevent: pick `!15` and stay there.

## Placement conventions

- Summon every figure by name with `Figure~\ref{...}` at the sentence that needs it.
- Write captions that teach on their own: state what is shown, then the one
  takeaway. Avoid tying a caption to brittle course scaffolding (specific weeks,
  Challenge numbers, the Capstone); keep the conceptual wording.
- Prefer natural scale (no `\resizebox`); size the canvas to `\textwidth`.
- Put lists of distinctions / annotations *outside* the node (below it), not
  crammed inside the box.

## Where figures live

Significant TikZ figures live in their own file under `figures/` and are pulled in
with `\input{figures/<name>}` (kebab-case name), so the section source stays
readable and figures are reusable. Small inline decorations can stay inline.
