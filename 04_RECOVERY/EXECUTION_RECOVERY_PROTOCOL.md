# Execution Recovery Protocol

LAST UPDATED: 2026-05-17

## Purpose

Define recovery after interrupted, stale, partial, or conflicting execution.

## Ownership

- Canonical owner: `04_RECOVERY/`
- Execution maps: `03_OPERATIONS/execution_layer/`
- Review gates: `06_VALIDATION/review_gates/`

## Interrupted Ingest Recovery

1. Stop further ingest or promotion.
2. Record repo and workspace paths.
3. Inspect generated drafts, ingest report, gaps report, and warnings.
4. Determine whether raw inputs were approved and local.
5. Treat drafts as untrusted until review evidence exists.
6. Preserve partial artifacts for audit unless human explicitly approves cleanup.

## Partial Validation Recovery

1. Record which command ran and where it stopped.
2. Preserve output and warnings.
3. Do not claim pass.
4. Rerun only after identifying changed conditions.
5. If dirty state changed during validation, record before/after status.

## Rerun Lineage Preservation

Every rerun must reference:

- Previous failure or uncertainty.
- Exact change before rerun.
- Same or changed scope.
- Result.
- Residual limits.

## Stale Evidence Recovery

If evidence is old or detached from current repo state:

1. Mark it historical.
2. Check current `git status --short`.
3. Re-run scoped validation if interpretation matters.
4. Do not promote readiness from stale evidence alone.

## Conflicting Execution-State Recovery

Canonical precedence:

1. Current local file state and git status.
2. Explicit command/output evidence.
3. `03_OPERATIONS/HANDOFF.md`.
4. Validation artifacts in `06_VALIDATION/`.
5. Historical lineage in `07_HISTORY/`.
6. Roadmap intent.

## Non-Claims

This protocol does not provide autonomous rollback, self-correction, production-grade telemetry, or complete traceability.
