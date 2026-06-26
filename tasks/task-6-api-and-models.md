---
title: "Task 6 — API Calls & Model Plurality"
status: draft
updated: 2026-06-25
unit: task
---

# Task 6 — API Calls & Model Plurality

**Pillar:** API calls (and tool plurality, D-017).
**Source:** net-new (extends the workshop toward the multi-tool stack).

## Goal
See the API *underneath* the agent, and make direct calls to more than one provider.

## The concept
The CLI and the editor extension are conveniences over an **API**: a request carrying a **model**,
**messages**, and **tokens**, and a response. Understanding this demystifies cost, latency, and rate
limits — and frees you from any single tool. The course is **tool- and model-plural** (D-017): you
will use Claude (CLI, VS Code, Cowork), Codex, and Gemini, and later **benchmark models against one
another** on the course substrate (D-019). This task is where the stack stops being a black box.

## Do this
1. Get API access: Claude, and **Gemini** as a second provider.
2. Write a minimal scripted call to **Claude** — a prompt in, text out — and inspect token usage.
3. Make the **same** call to **Gemini**; note how the request/response shapes differ.
4. *(Optional, D-017)* Pull a small **open-weights model from Hugging Face** and run it locally.
5. Reflect: when would you reach for the CLI vs. the extension vs. a raw API call vs. a local model?

## Done-check
- A script that calls **two providers** on the same prompt and prints both outputs **and** token
  usage.
- *(Optional)* the same prompt answered by a locally-run open-weights model.

## Looks ahead to
The eval harness (Challenge 2) and the **benchmarking activity** (D-019): once you can call several
models the same way, comparing them on a scored task is a small step.
