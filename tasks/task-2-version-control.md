---
title: "Task 2 — Version Control From Day One"
status: draft
updated: 2026-06-25
unit: task
---

# Task 2 — Version Control From Day One

**Pillar:** versioning.
**Source:** `../resources/claude-cli-workshop/lessons/claude-code--appendix-b-git.md`

## Goal
Get comfortable with git's core loop, clone the course repository, and add yourself to the roster.

## The concept
A repository is a **versioned history**. Commits are checkpoints, branches isolate work, diffs show
exactly what changed, and remotes sync to GitHub. With an agent in the loop this stops being
bookkeeping and becomes a **safety net**: an agent can change many files at once, so you *commit
before you let it loose* and roll back freely if a run goes sideways. Every Challenge is submitted
through git.

## Do this
1. Read the git primer (Appendix B).
2. Configure git (`user.name`, `user.email`); create a GitHub account if needed.
3. Clone the course repository.
4. On a new branch, add your personal directory (e.g. `Students/<your-id>/README.md`) with your
   name and research domain; commit; push; open a pull request.
5. Practice the loop: make a change, `git diff`, `git commit`, read `git log`.

## Done-check
- Your pull request appears on the course repo.
- You can explain, in your own words, what `add`, `commit`, `push`, `branch`, and `diff` each do.

## Notes
- The roster lives in `../assessment/`; your PR is how you land on it.
