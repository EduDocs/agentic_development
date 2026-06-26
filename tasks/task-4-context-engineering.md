# Task 4 — Context Engineering & CLAUDE.md

**Pillar:** context engineering.
**Source:** `../resources/claude-cli-workshop/lessons/claude-code--02-making-it-personal.md`

## Goal
Control what the agent knows *before* it reads a line of code, using instruction layers and a
project `CLAUDE.md`.

## The concept
An agent's output is only as good as its **context**. Context arrives in **layers** — global
(you, your preferences), project (`CLAUDE.md`), and the live session. `CLAUDE.md` is the **index**
the agent reads first: what the project is, its conventions, how to run it, what matters. *Context
engineering* is the deliberate act of deciding **what to put in front of the model, and when** — the
highest-leverage skill in the course, and one you'll use at every rung.

## Do this
1. Read Lesson 02 (instruction layers; `CLAUDE.md`).
2. Write a `CLAUDE.md` for your scratch project: what it is, its conventions, how to run it.
3. Give the **same** task with and without the `CLAUDE.md`; compare how much steering each needed.
4. Add a **global** instruction (a standing preference) and observe its effect across projects.

## Done-check
- A `CLAUDE.md` that **measurably** changes the agent's behavior on a task.
- You can explain the three instruction layers and what belongs in each.
