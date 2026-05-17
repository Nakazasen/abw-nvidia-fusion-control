# CANONICAL_CONFLICT_RULES

## Purpose

Define deterministic precedence when documents disagree.

## Scope

- Governance, recovery, roadmap, validation, and history documents in Control.

## Enforcement Philosophy

- Precedence resolves interpretation, not history.
- Contradictory historical evidence is preserved and annotated through audit records.

## Detection Rules

- Readiness conflicts: `00_SYSTEM/NON_CLAIMS.md` and `03_OPERATIONS/HANDOFF.md` constrain interpretation.
- Operational conflicts: `03_OPERATIONS/HANDOFF.md` wins over helper files.
- Chronology conflicts: `07_HISTORY/INTEGRATION_JOURNAL.md` is the chronological anchor.
- Decision conflicts: `05_DECISIONS/DECISIONS.md` wins over `05_DECISIONS/DECISION_LOG.md`.
- Strategy conflicts: `05_DECISIONS/ROADMAP.md` wins over `05_DECISIONS/ROADMAP_STATE.md`.

## Escalation Rules

- Critical: unqualified promotion to a forbidden claim.
- High: helper file contradicts canonical operational truth.
- Medium: derived snapshot lacks source-of-truth pointer.
- Low: duplicated wording with clear non-claim context.

## Non-Goals

- No automatic deletion of the losing statement.
- No rewriting append-only reports.

## Anti-Pattern Examples

- Using an old session snapshot to override current `03_OPERATIONS/HANDOFF.md`.
- Treating a pass report as removal of an earlier fail report.

## Future Automation Hooks

- JSON rule engine based on `repo-truth-hierarchy.json`.
- Conflict report posted as CI artifact.
