# GOVERNANCE_CI_PLAN

## Purpose

Plan future CI checks for governance integrity without claiming current CI enforcement.

## Scope

- Proposed checks under `tools/governance/`.
- Future CI integration only after review.

## Enforcement Philosophy

- Start as report-only.
- Fail CI only after repeated stable runs and human approval.
- Keep archive exceptions explicit.

## Detection Rules

- Broken reference detection.
- Stale document detection.
- Canonical conflict detection.
- Duplicate truth detection.
- Orphaned document detection.
- Invalid lifecycle state detection.

## Escalation Rules

- Report-only first.
- Warning mode second.
- Blocking mode only after governance decision in `05_DECISIONS/DECISIONS.md`.

## Non-Goals

- No claim that CI currently blocks governance drift.
- No automatic remediation.

## Anti-Pattern Examples

- Marking placeholder scripts as complete enforcement.
- Blocking archive files without allowlist review.

## Future Automation Hooks

- GitHub Actions workflow.
- JSON output consumed by dashboards.
- Contract validation using `governance-schema.json`.

