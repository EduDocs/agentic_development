# Task 1 — Set Up Your Rig

**Pillar:** mechanics (do this before week 1 if you can).
**Source:** `../resources/claude-cli-workshop/lessons/claude-code--appendix-a-setup.md`

## Goal
A working agentic-development environment: a terminal, version control, Python, an editor, and
**Claude Code authenticated and running**.

## Why it matters
Everything else assumes you can open a terminal, point an agent at a folder, and version what you
build. This is the one task that is pure plumbing — get it behind you so week-1 class time is free
for concepts.

## Do this
1. Install a package manager (macOS: Homebrew · Windows: WSL + your distro's · Linux: your distro's).
2. Install the essentials: `git`, **Python 3.11+**, and a code editor (VS Code recommended).
3. Install the **Claude Code CLI** and authenticate — exact commands and the `settings.json`
   reference are in Appendix A.
4. Recommended: install the VS Code extension.
5. Start a session in an empty folder and have the agent create and run a one-line Python script.

## Done-check
- `git --version`, `python --version`, and `claude --version` each print a version.
- From the terminal, you can start a session, have the agent write `hello.py`, and run it.

## Notes
- The course is **tool-plural** (D-017): Claude Code is the default rig, but you'll meet Codex,
  Gemini, and open-source tools later. Set up Claude first; the rest arrive when we need them.
