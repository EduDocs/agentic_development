# Agentic Development in Research — documentation build
# Run `just` to list recipes. Outputs land in output/ (gitignored).
#
# Requires: pandoc, a LaTeX engine (lualatex, e.g. via MacTeX/BasicTeX), and just.
#   brew install just pandoc
#   brew install --cask mactex      # provides lualatex
#
# How it works: each source file carries YAML front matter (D-027). The recipes
# strip that per-file front matter, concatenate the files in reading order with a
# page break between them, and render one PDF with a table of contents.

# Core course documentation, in reading order (no tutorials — see `tutorials`).
CORE := "syllabus/README.md syllabus/outcomes.md syllabus/calendar.md syllabus/assessment.md syllabus/assessment-map.md PROGRESSION.md benchmarks/README.md tasks/README.md tasks/task-1-rig-setup.md tasks/task-2-version-control.md tasks/task-3-prompts-and-permissions.md tasks/task-4-context-engineering.md tasks/task-5-automated-context.md tasks/task-6-api-and-models.md challenges/README.md challenges/challenge-1-agentic-coding/brief.md challenges/challenge-1-agentic-coding/rubric.md challenges/challenge-2-research-agent/brief.md challenges/challenge-2-research-agent/rubric.md challenges/challenge-3-retrieval-grounding/brief.md challenges/challenge-3-retrieval-grounding/rubric.md challenges/challenge-4-orchestration/brief.md challenges/challenge-4-orchestration/rubric.md projects/README.md projects/capstone/brief.md projects/capstone/evolution-pivot.md projects/capstone/proposal-template.md projects/capstone/milestones.md projects/capstone/rubric.md projects/capstone/report-template.md"

# List available recipes
default:
    @just --list

# Full course packet: core docs + every tutorial, one PDF
pdf:
    @just _pdf "Agentic Development in Research — Complete Course" agentic-development-course.pdf {{CORE}} tutorials/README.md tutorials/tutorial-*.md

# Core course handbook (syllabus, progression, units) — no tutorials
handbook:
    @just _pdf "Agentic Development in Research — Course Handbook" course-handbook.pdf {{CORE}}

# The 36 tutorial briefs, as a standalone catalog
tutorials:
    @just _pdf "Agentic Development in Research — Tutorial Catalog" course-tutorials.pdf tutorials/README.md tutorials/tutorial-*.md

# ── Website (MkDocs Material) ──────────────────────────────────────────────
# The site renders the same markdown as the PDF build. docs/ holds the homepage
# plus directory symlinks to the real folders (no content is duplicated).
# Requires: uv. First run `just site-setup` to create the local environment.

VENV := ".venv-site"

# One-time: create the local MkDocs environment with uv
site-setup:
    uv venv {{VENV}}
    VIRTUAL_ENV={{VENV}} uv pip install mkdocs-material
    @just site-links

# (Re)create docs/ and its symlinks — run after a fresh clone or on Windows
site-links:
    #!/usr/bin/env bash
    set -euo pipefail
    mkdir -p docs
    for d in syllabus tasks challenges projects tutorials benchmarks assessment resources; do
      ln -sfn "../$d" "docs/$d"
    done
    for f in PROGRESSION.md DECISIONS.md CLAUDE.md; do
      ln -sfn "../$f" "docs/$f"
    done
    echo "docs/ symlinks ready"

# Live-preview the site at http://127.0.0.1:8000 (auto-reloads on save)
serve:
    {{VENV}}/bin/mkdocs serve

# Build the static site into site/ (gitignored)
site:
    {{VENV}}/bin/mkdocs build --strict
    @echo "Built site/ — open site/index.html"

# Publish to the gh-pages branch (GitHub Pages)
site-deploy:
    {{VENV}}/bin/mkdocs gh-deploy --force

# Remove build outputs
clean:
    rm -rf output site

# Internal: strip per-file front matter, concatenate with page breaks, render to PDF
_pdf title outfile +files:
    #!/usr/bin/env bash
    set -euo pipefail
    mkdir -p output
    combined="output/.combined.md"
    : > "$combined"
    for f in {{files}}; do
      # Strip only a leading YAML front-matter block (lines 1..second '---'),
      # leaving any in-body '---' thematic breaks intact.
      awk 'NR==1 && /^---$/ {fm=1; next} fm && /^---$/ {fm=0; next} !fm' "$f" >> "$combined"
      printf '\n\n\\newpage\n\n' >> "$combined"
    done
    pandoc "$combined" \
      --defaults pandoc/defaults.yaml \
      --metadata title="{{title}}" \
      --toc --toc-depth=2 \
      -o "output/{{outfile}}"
    rm -f "$combined"
    echo "Built output/{{outfile}}"
