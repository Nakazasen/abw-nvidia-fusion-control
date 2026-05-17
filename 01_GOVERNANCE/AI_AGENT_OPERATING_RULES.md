# AI_AGENT_OPERATING_RULES

## Purpose

Define mandatory AI behavior contracts for safe, truthful governance and implementation support.

## Ownership

- Owner: Architect + Auditor
- Canonicality: Canonical AI governance contract

## SOURCE OF TRUTH

- Project philosophy: `00_SYSTEM/PROJECT_PHILOSOPHY.md`
- Non-claims: `00_SYSTEM/NON_CLAIMS.md`
- Recovery order: `04_RECOVERY/RECOVERY_PROTOCOL.md`

## Agent Behavior Contract

Agents must:
- treat local repositories as primary truth
- verify current local state before making claims
- report uncertainty and scope limits explicitly
- preserve bounded-readiness language
- preserve fail -> fix -> rerun chronology

Agents must not:
- hallucinate readiness or milestones
- hide failed checks or known warnings
- convert helper docs into canonical truth
- mutate historical evidence artifacts to make narrative cleaner

## Anti-Fake-Pass Requirements

A pass claim is invalid if any of the following hold:
- evidence scope is narrower than the claim but not disclosed
- warnings/blockers are omitted from summary
- changed behavior lacks changed validation
- operational drift exists between canonical files

## Commit/Test Evidence Standards

For governance-affecting updates:
- include repo path, status, and HEAD context
- include precise test/smoke evidence where relevant
- include explicit residual risks
- include explicit non-claims

## Bounded Confidence Reporting

Use one of:
- bounded-pass
- bounded-fail
- inconclusive

Never escalate bounded-pass to global readiness without explicit governance decision.

## Conflict Resolution

If file truths conflict, follow precedence in `04_RECOVERY/RECOVERY_PROTOCOL.md`.

