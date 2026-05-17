# Validation Boundary Contract

LAST UPDATED: 2026-05-17

## Purpose

Define how runtime and test evidence may be interpreted without overclaiming readiness.

## Ownership

- Canonical owner: `01_GOVERNANCE/runtime_contracts/`
- Evidence owner: `06_VALIDATION/`
- Operational interpretation: `03_OPERATIONS/HANDOFF.md`

## Contract

A validation result proves only the behavior directly exercised by the command, fixture, environment, and repository state recorded with it.

## Required Evidence Fields

- Command run.
- Repo path.
- Commit or working-tree state.
- Dirty-state status.
- Fixture or input scope.
- Pass/fail result.
- Warnings observed.
- Residual risks.
- Explicit non-claims.

## Fake Progress Indicators

- Passing a smoke test and claiming full daily-use readiness.
- Running governance scripts and claiming runtime enforcement.
- Updating roadmap text without validation evidence.
- Treating clean output as absence of risk.
- Omitting dirty working tree state from evidence.

## Escalation

If validation is used to change readiness language, it must be backed by:

- Exact evidence in `06_VALIDATION/`.
- Accepted decision lineage in `05_DECISIONS/`.
- Updated operational truth in `03_OPERATIONS/HANDOFF.md`.

## Non-Goals

This contract does not define a full test framework, certification process, or production release gate.
