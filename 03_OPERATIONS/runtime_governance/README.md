# Runtime Governance

## Purpose

This folder maps where governance should become visible during operational/runtime workflows.

## Canonical Ownership

- Owns runtime governance surfaces, workflow risks, and approved integration points.
- Does not own readiness decisions, validation reports, or implementation behavior.

## Belongs Here

- Runtime governance surface maps.
- Workflow risk maps.
- Non-blocking integration point plans.
- Runtime governance observations that affect operational recovery.

## Does Not Belong Here

- Production readiness claims.
- Full validation reports.
- Append-only session logs.
- Implementation code.

## Relationship To Other Layers

- Contracts live in `01_GOVERNANCE/runtime_contracts/`.
- Current operational truth lives in `03_OPERATIONS/HANDOFF.md`.
- Evidence lives in `06_VALIDATION/`.
- Historical audits live in `07_HISTORY/governance_audits/`.
