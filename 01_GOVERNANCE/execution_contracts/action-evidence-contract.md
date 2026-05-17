# Action Evidence Contract

LAST UPDATED: 2026-05-17

## Purpose

Define what evidence is required before and after meaningful execution.

## Scope

Applies to Control governance actions, NVIDIA runtime/tooling actions, and ABW bridge/ingest/review/apply actions.

## Required Before Action

- Repo path verified.
- `git status --short` reviewed for affected repo.
- Action target identified.
- Safety class assigned.
- Relevant blocker or recovery doc checked when action affects operational state.
- Human confirmation captured when required.

## Required After Action

- Command or endpoint recorded.
- Result recorded as pass, fail, blocked, warning, or not-run.
- Changed files or artifacts identified.
- Warnings and uncertainty recorded.
- Non-claims preserved.

## Stop And Escalate When

- Target workspace is ambiguous.
- Human-review-required action lacks confirmation.
- Dirty work could be overwritten.
- Evidence cannot be captured.
- The action would imply readiness promotion.

## Fake Progress

- Reporting success without before/after evidence.
- Treating a skipped command as a pass.
- Claiming an endpoint worked without HTTP/result evidence.
- Treating a generated draft as trusted knowledge.

## Non-Goals

This contract does not implement enforcement. It defines the evidence standard future tooling should warn against.
