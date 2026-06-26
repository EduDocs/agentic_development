---
title: "Task 3 — Prompts, Permissions & the Agentic Loop"
status: draft
updated: 2026-06-25
unit: task
---

# Task 3 — Prompts, Permissions & the Agentic Loop

**Pillar:** prompt engineering.
**Source:** `../resources/claude-cli-workshop/lessons/claude-code--01-foundations.md`

## Goal
Understand the agentic loop, permission modes, and plan mode — and write prompts that reliably get
good results.

## The concept
A prompt is a **specification**. The agent reads files, plans, acts, and checks its work against
ground truth (a test, the compiler, a runnable script) — that feedback loop is its real advantage
over a chat window. Good prompts are **specific**, give an **example**, **decompose** the task, and
state the **done-condition**. Permissions and **plan mode** let you *bound* what the agent may do:
you trust it *and* verify it, rather than choosing one.

## Do this
1. Read Lesson 01 (the prompt; permissions; the filesystem-as-advantage thesis; plan mode).
2. In a scratch repo, give a deliberately **vague** prompt and observe the result.
3. Rewrite it: specific, with an example and an explicit done-condition. Compare the two outcomes.
4. Use **plan mode** to make the agent propose before acting; approve or refine the plan.
5. Try each permission posture and note how it changes your workflow.

## Done-check
- A before/after prompt pair where the rewrite **measurably** improved the result.
- You can explain plan mode and the permission modes in your own words.
