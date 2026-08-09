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
# The site renders the same markdown as the PDF build. site-src/ holds the
# homepage plus directory symlinks to the real folders (no content is duplicated).
# The symlinks are NOT committed — they regenerate via `site-links`, which the
# serve/site recipes run automatically. Requires: uv (run `just site-setup` once).

VENV := ".venv-site"

# One-time: create the local MkDocs environment with uv
site-setup:
    uv venv {{VENV}}
    VIRTUAL_ENV={{VENV}} uv pip install mkdocs-material
    @just site-links

# (Re)create site-src/ symlinks — idempotent; runs after a fresh clone or on Windows
site-links:
    #!/usr/bin/env bash
    set -euo pipefail
    mkdir -p site-src
    for d in syllabus tasks challenges projects tutorials benchmarks assessment resources; do
      ln -sfn "../$d" "site-src/$d"
    done
    for f in PROGRESSION.md DECISIONS.md CLAUDE.md; do
      ln -sfn "../$f" "site-src/$f"
    done
    echo "site-src/ symlinks ready"

# Live-preview the COURSE at http://127.0.0.1:8000 (auto-reloads on save)
serve: site-links
    {{VENV}}/bin/mkdocs serve

# Build the static course site into site/ (gitignored)
site: site-links
    {{VENV}}/bin/mkdocs build --strict
    @echo "Built site/ — open site/index.html"

# ── Notes site (landing page + concept map + book PDF) ─────────────────────
# Lives in notes/site/ so a future split of notes/ into its own repo takes the
# site with it. The pages are committed; the concept-map data is generated and
# the book PDF lives on a release, never in git. Deployed at the site ROOT,
# with the course under /course/.

NOTES_PDF := "agentic-development-notes.pdf"

# Regenerate the concept map's data from PROGRESSION.md and the sidecars
notes-data:
    python3 scripts/notes_site_data.py

# The PDF is never committed to git: releases live outside the tree, so the slow
# LaTeX build stays on your machine, the binary never enters history, and deploys
# stay fast. The deploy workflow pulls this asset.
# Requires a one-time `gh auth login`, and a one-time release creation:
#   gh release create notes-pdf notes/.nel/build/agentic-development-notes.pdf \
#       -t "Notes PDF" -n "Latest build of the course notes."
# After that, this recipe rebuilds and overwrites the asset.
#
# Build the book and publish it to the rolling `notes-pdf` release
publish-notes-pdf:
    just --justfile notes/justfile --working-directory notes build
    cp notes/.nel/build/main.pdf notes/.nel/build/{{NOTES_PDF}}
    gh release upload notes-pdf notes/.nel/build/{{NOTES_PDF}} --clobber
    @echo "Published {{NOTES_PDF}} to the 'notes-pdf' release."

# Preview the NOTES alone at http://localhost:8001
notes-serve: notes-data
    # The PDF is not in the repo. If you have built the book locally, serve that
    # copy so the link resolves in preview; otherwise the link 404s here.
    -cp notes/.nel/build/main.pdf notes/site/{{NOTES_PDF}}
    @echo "Notes site at http://localhost:8001 (the Course link 404s here; use 'just web')"
    python3 -m http.server 8001 --directory notes/site

# Preview the ASSEMBLED site (notes at /, course at /course/) — mirrors CI
web: site-links notes-data
    rm -rf _site
    mkdir -p _site/course
    {{VENV}}/bin/mkdocs build --strict
    cp -R notes/site/. _site/
    cp -R site/.       _site/course/
    # In CI this comes from the release; locally, use a build if you have one.
    -cp notes/.nel/build/main.pdf _site/{{NOTES_PDF}}
    @echo "Assembled site at http://localhost:8000  (course at /course/)"
    python3 -m http.server 8000 --directory _site

# Requires `gh auth login` and, one-time, the repo's Pages source set to
# "GitHub Actions" (Settings -> Pages). Deploys the *pushed* state of the
# default branch, so commit and push first.

# Deploy the site via GitHub Actions (build in CI, publish to Pages)
deploy:
    gh workflow run pages.yml
    @echo "Deploy started. Watch progress with:  gh run watch"

# The older alternative to `just deploy`. Pick ONE Pages source in repo settings:
# "GitHub Actions" for `deploy`, or "Deploy from a branch: gh-pages" for this one.

# Local alternative to `deploy`: build and force-push to the gh-pages branch
site-deploy:
    {{VENV}}/bin/mkdocs gh-deploy --force

# Remove build outputs
clean:
    rm -rf output site _site

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
