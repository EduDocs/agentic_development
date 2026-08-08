# Figure style guide (conceptual block diagrams)

The course's conceptual figures (boxes-and-arrows diagrams that show a relationship
or a flow) should share one visual language so the book reads as a single hand.
The exemplars are the perceive-reason-act loop (`figure:AgentLoop`, Chapter 2) and
the block diagrams of Chapter 1. This guide fixes the parameters; the shared TikZ
styles live in [`figures/_concept-style.tex`](../figures/_concept-style.tex).

## Scope

- **Applies to:** conceptual / relational diagrams (block nodes joined by arrows):
  loops, spectrums, ladders, pipelines, proposer-critic, data-flow.
- **Does not apply to:** the product mock-ups under `figures/` (the three rig
  figures share their own separate visual language), or data/plot figures
  (`pgfplots`), which have their own conventions.

## The house parameters

Load the shared styles at the top of each figure and use the named styles:

```latex
\input{figures/_concept-style}
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

**Every captioned figure lives in its own file** under `figures/`, pulled in with
`\input{figures/<name>}`. The file holds the figure *body* only (the `tikzpicture`,
plus the `\input{figures/_concept-style}` line if it uses the house styles); the
`figure` environment, the `\caption`, and the `\label` stay in the section, because
the caption is prose and belongs with the prose. So a figure reads like this in the
section source:

```latex
\begin{figure}[htb!]
\begin{center}
\input{figures/agent-loop}
\caption{The perceive--reason--act loop. ...}
\label{figure:AgentLoop}
\end{center}
\end{figure}
```

Two conventions follow from the rule, and both are checkable at a glance:

- **Name the file after the label**, kebab-cased: `figure:RAGPipeline` lives in
  `figures/rag-pipeline.tex`, `figure:AgentLoop` in `figures/agent-loop.tex`.
- **`figures/*.tex` means one figure per file.** The single exception is
  `_concept-style.tex`, whose leading underscore marks it as a shared include
  rather than a figure.

An earlier version of this guide said only that "significant" figures need their own
file and that small inline decorations could stay inline. That line was unenforceable:
it left the split to judgment, and in practice figures were externalized or not
depending on when they happened to be written, not on what they were. Anything worth a
caption is worth a file. A genuinely decorative `tikzpicture` with no caption and no
`\label` (a symbol set inline in a sentence, say) is not a figure and this rule does
not reach it.

## End every figure file with `%`

The last line of a file under `figures/` carries a trailing `%`:

```latex
\end{tikzpicture}%
```

**Why.** TeX appends an end-of-line token to every line it reads, including the last
line of an `\input`ed file, and in horizontal mode that token becomes a space. So a
figure in its own file contributes *two* spaces where the same picture written inline
contributed one: the file's own last line ends, and then the `\input{figures/...}` line
in the section ends too. Inside `center` (or under `\centering`) the surplus space
becomes part of the line being centered, and the picture is set half a space to the
left of where it belongs. The `%` comments out the file's final line ending and removes
the surplus.

Three details are easy to get wrong here:

- **This is not about the file's trailing newline.** Every figure file ends with the
  usual single newline and should keep it. TeX supplies the end-of-line token whether
  or not that byte is present, so deleting it fixes nothing. The `%` is what works.
- **The guard belongs at the end of the figure file, not at the `\input`.** Writing
  `\input{figures/x}%` in the section suppresses the other space and works just as
  well, but it has to be repeated at every call site and is easy to omit. Putting it
  in the figure file fixes the figure once, wherever it is used, and keeps the section
  source clean.
- **A figure can be immune and still need the guard.** The three rig mock-ups are set
  wider than the text block, so they overflow their line and centering has no slack to
  give; the surplus space moved them not at all. That is luck, not correctness. Apply
  the rule uniformly rather than per figure.

The symptom is subtle enough to be worth naming: a figure that is a hair left of centre,
with nothing else on the page changed. To check a figure move, rasterize the PDF before
and after and diff the pages (`pdftoppm -r 150 -png main.pdf out/p`, then `diff -rq`).
An extraction that is purely structural should change no page at all.
