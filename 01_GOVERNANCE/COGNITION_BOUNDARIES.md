# COGNITION_BOUNDARIES

## Purpose

Define hard boundaries that prevent governance drift and duplicate truths.

## Ownership

- Owner: Governance Recorder
- Canonicality: Canonical anti-drift boundary document

## LAST UPDATED

- 2026-05-17

## SOURCE OF TRUTH

- Topology reference: `01_GOVERNANCE/GOVERNANCE_MAP.md`
- Ownership reference: `01_GOVERNANCE/FILE_OWNERSHIP.md`

## Boundary 1: Strategic vs Operational

- Strategic truth lives in `05_DECISIONS/ROADMAP.md`, `05_DECISIONS/DECISIONS.md`, `05_DECISIONS/RISKS.md`, `00_SYSTEM/NON_CLAIMS.md`.
- Operational truth lives in `03_OPERATIONS/HANDOFF.md` and `07_HISTORY/INTEGRATION_JOURNAL.md`.
- Derived state docs summarize local status and cannot redefine strategy.

## Boundary 2: Canonical vs Derived

- Canonical files may declare accepted truth.
- Derived files (`*_STATE`, `DECISION_LOG`, `CURRENT_BLOCKERS`) may summarize and flag drift only.
- Helper files (`SESSION_*`, `NEXT`) may direct navigation only.

## Boundary 3: Evidence vs Narrative

- Evidence artifacts are immutable chronology anchors.
- Narrative summaries must reference evidence artifacts instead of replacing them.
- Fail -> fix -> rerun lineage is mandatory.

## Boundary 4: Risk vs Blocker

- `05_DECISIONS/RISKS.md` = persistent risk classes.
- `03_OPERATIONS/CURRENT_BLOCKERS.md` = active current blockers.
- A closed blocker can still map to an open risk class.

## Boundary 5: Recovery Bootstrap vs Truth Owner

- `03_OPERATIONS/SESSION_RESTORE.md` and `03_OPERATIONS/NEXT.md` are bootstrap/action helpers.
- They must point to `03_OPERATIONS/HANDOFF.md` for operational truth and must not mirror it.

## Conflict Precedence

1. `03_OPERATIONS/HANDOFF.md` for latest accepted operational truth.
2. `07_HISTORY/INTEGRATION_JOURNAL.md` for chronology context.
3. `05_DECISIONS/ROADMAP.md`, `05_DECISIONS/DECISIONS.md`, `05_DECISIONS/RISKS.md`, `00_SYSTEM/NON_CLAIMS.md` for strategic constraints.
4. Derived/helper files for convenience only.


