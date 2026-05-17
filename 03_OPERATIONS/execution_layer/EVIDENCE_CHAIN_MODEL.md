# Evidence Chain Model

LAST UPDATED: 2026-05-17

## Purpose

Define how evidence should connect from execution to validation to governance interpretation.

## Ownership

- Canonical owner: `03_OPERATIONS/execution_layer/`
- Evidence owner: `06_VALIDATION/`

## Evidence Chain

1. Operation evidence: command, endpoint, manual step, or blocked reason.
2. Runtime evidence: warnings, logs, dirty state, safety class.
3. Validation evidence: test/smoke/manual result and scope.
4. Governance evidence: handoff, decision log, blocker update.
5. Non-claims: exact boundaries of what was not proven.

## Evidence Quality Levels

- `observed`: local output or file state observed.
- `reproduced`: rerun under similar conditions.
- `validated`: scoped test or manual validation passed.
- `accepted`: recorded through governance decision.

## Interpretation Rule

Evidence never promotes itself. Governance interpretation must remain explicit and bounded.

## Missing Evidence Handling

If evidence is missing, report `not proven` or `blocked`; do not fill the gap with inference.
