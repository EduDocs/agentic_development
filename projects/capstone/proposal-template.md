# Capstone Proposal

> Submit at the pivot (~week 9). ~2 pages. The goal is a **scoped, feasible** project, not a final
> design. Your instructor signs off before you build.

## 1. Problem & domain
- What is the problem in your field? Why does it matter?
- What would a *discovered model* mean here — what would you learn from it?

## 2. Data
- The dataset: source, size, features, target. Is it `(features → target)` with a held-out split?
- Access / licensing. Is it ready, or does it need cleaning? Be honest about the effort.

## 3. Fitness
- How will you score a candidate model **automatically**? (Predictive error + what parsimony or
  penalty term?)
- What could an optimizer *hack* about this fitness, and how will you guard it? (Challenge 2's
  eval-hacking lesson — now the attacker is real.)

## 4. Method sketch
- Baselines: linear, PySR — what's the bar to beat?
- The evolutionary loop: the artifact, the mutation operator, the population.
- Which model(s) as the proposal operator, and at what cost? (Challenge 4 benchmarking.)

## 5. Grounding
- What domain priors / literature will constrain the search (Challenge 3)? Where do they come from?

## 6. Feasibility & risk
- The riskiest assumption. Your **fallback** if evolution doesn't beat the baseline.
- Compute / cost estimate (laptop + API; optional local model).

## 7. Team & roles (if a team)
- Who owns what? (Maps to the Teamwork rubric.)

## Sign-off
- [ ] Instructor approved scope — date: ______
