---
title: "Challenge 3 — Rubric"
status: draft
updated: 2026-06-25
unit: challenge
outcomes: [LO2, LO3, LO4, LO9]
---

# Challenge 3 — Rubric

> Grades *grounding the agent in domain knowledge — context engineering at scale*. Criteria tie to
> course outcomes ([`../../syllabus/outcomes.md`](../../syllabus/outcomes.md)) and to the
> **Challenges** component (20%, D-024). This is Spine 2's center of gravity.

| Criterion | What earns top marks | Outcome |
|-----------|----------------------|---------|
| **Retrieval & context engineering** *(primary)* | Retrieval that genuinely **constrains the model search** (units, functional forms, dimensional sanity), with proposals that **cite** which retrieved facts shaped them. | LO2 |
| **Grounded-vs-ungrounded ablation** | A clean comparison showing whether grounding **measurably** beats the ungrounded Challenge-2 agent on the leaderboard. | LO4, LO9 |
| **Agent integration** | The Challenge-2 **eval harness reused unchanged**; grounding judged on *its* numbers. | LO3, LO4 |
| **Analysis** | An honest read of where domain priors helped, where they misled, and why. | LO2, LO9 |

## Notes
- **Mode:** individual or team.
- **Honesty is graded:** if grounding *didn't* help, a clear diagnosis of why scores well — better
  than a grounded pipeline that quietly underperforms.
- This is the rehearsal for the capstone, where students bring their *own* domain's priors.
