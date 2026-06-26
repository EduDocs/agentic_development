---
title: "Task 5 — Automated Context Management"
status: draft
updated: 2026-06-25
unit: task
---

# Task 5 — Automated Context Management

**Pillar:** automated context management.
**Source:** `../resources/claude-cli-workshop/lessons/claude-code--02-making-it-personal.md`

## Goal
Manage the context window across long work — compaction, sessions, and memory.

## The concept
The context window is **finite**. As work grows the agent **compacts** (summarizes) older context
to keep going — and you steer that deliberately: start a **fresh session** when the task changes,
**compact** when the window fills, and persist what must survive across sessions in memory /
`CLAUDE.md`. Knowing **when to clear vs. continue** is a real skill: too much stale context degrades
the agent as surely as too little.

## Do this
1. Read Lesson 02 (context window; compaction; sessions).
2. Run a multi-step task long enough to warrant compaction; observe what is kept and what is lost.
3. Practice the session mechanics: name and resume a session; start a fresh session for a new task;
   trigger `/compact`.
4. Reflect: what belongs in **memory** (persistent) vs. a **session** (ephemeral)?

## Done-check
- You can state, for a given moment in a task, whether to start fresh, compact, or continue — and why.
- You can show a named session resumed in a later sitting.
