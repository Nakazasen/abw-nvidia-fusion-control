# DRIFT_DETECTION

## Purpose

Specify how to detect governance drift between canonical, derived, helper, and archive documents.

## Scope

- Markdown governance files in the Control repo.
- Machine-readable contracts under `01_GOVERNANCE/contracts/`.

## Enforcement Philosophy

- Drift detection is advisory until explicitly wired into CI.
- Findings must cite file path and reason.
- Historical archives may contain old truth, but must be marked as archive or legacy.

## Detection Rules

- Compare `03_OPERATIONS/HANDOFF.md` against `07_HISTORY/INTEGRATION_JOURNAL.md` for latest-result divergence.
- Compare `05_DECISIONS/ROADMAP.md` against `05_DECISIONS/ROADMAP_STATE.md` for roadmap-state mismatch.
- Compare `05_DECISIONS/DECISIONS.md` against `05_DECISIONS/DECISION_LOG.md` for unpromoted decision notes.
- Compare `05_DECISIONS/RISKS.md` against `03_OPERATIONS/CURRENT_BLOCKERS.md` for blocker/risk mismatch.
- Flag root-level references to files that moved into layer directories, except in `07_HISTORY/legacy/`.

## Escalation Rules

- Critical: conflict changes readiness interpretation.
- High: conflict changes allowed mutation boundary.
- Medium: stale link or stale path reference.
- Low: duplicate phrasing with no authority conflict.

## Non-Goals

- Does not decide which truth is correct automatically.
- Does not rewrite historical artifacts.

## Anti-Pattern Examples

- `03_OPERATIONS/SESSION_RESTORE.md` maintaining a full independent latest-state mirror.
- `03_OPERATIONS/NEXT.md` becoming a second handoff.

## Future Automation Hooks

- Contract-driven drift scanner.
- Historical allowlist for `07_HISTORY/legacy`.
- Markdown link resolver.
