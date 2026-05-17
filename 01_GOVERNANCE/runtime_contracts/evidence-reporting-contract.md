# Evidence Reporting Contract

LAST UPDATED: 2026-05-17

## Purpose

Define how runtime evidence, validation evidence, and governance evidence should be reported.

## Ownership

- Canonical owner: `01_GOVERNANCE/runtime_contracts/`
- Validation evidence: `06_VALIDATION/`
- Historical evidence: `07_HISTORY/`
- Operational state: `03_OPERATIONS/HANDOFF.md`

## Evidence Reporting Standard

Every evidence-bearing report should include:

- Date and local timezone if known.
- Repo path.
- Commit hash if available.
- Dirty working tree state.
- Command or manual procedure.
- Inputs or fixtures.
- Result.
- Warnings.
- Known gaps.
- Non-claims.

## Runtime Evidence

Runtime evidence is observational. It can support operational decisions but does not create governance truth by itself.

## Governance Evidence

Governance evidence records what was inspected, what risk was detected, and what remains unresolved. It must preserve failure and uncertainty.

## Validation Evidence

Validation evidence must be scoped. A pass is not a promotion unless accepted through decision governance.

## Prohibited Evidence Handling

- Removing failed rerun evidence.
- Replacing detailed reports with clean summaries.
- Reporting only pass/fail while hiding warnings.
- Omitting dirty repo state.
- Copying old evidence into current state without date and scope.

## Future Hooks

- Governance snapshot footer for validation reports.
- Optional JSON evidence envelope.
- Advisory check that required evidence fields are present.
