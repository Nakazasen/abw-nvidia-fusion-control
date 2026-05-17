# Action Lineage Model

LAST UPDATED: 2026-05-17

## Purpose

Define how meaningful actions should preserve why they happened and what they depended on.

## Ownership

- Canonical owner: `03_OPERATIONS/execution_layer/`

## Lineage Chain

1. Trigger: user request, governance decision, blocker, or recovery need.
2. Context: docs read, repo status, current blockers.
3. Boundary: safety class and review requirement.
4. Execution: command, endpoint, manual action, or not-run decision.
5. Evidence: output, report, changed files, warnings.
6. Interpretation: scoped meaning only.
7. Follow-up: rerun, rollback, blocker, or handoff update.

## Required Lineage For High-Risk Actions

- Human confirmation.
- Before/after git status.
- Exact command or endpoint.
- Review evidence.
- Failure handling.
- Non-claims.

## Rerun Lineage

A rerun must reference:

- Original failure or uncertainty.
- What changed before rerun.
- Whether scope changed.
- Whether the old failure is closed, still open, or only narrowed.

## Anti-Pattern

Do not summarize a fail/rerun pair as a clean pass. Preserve both.
