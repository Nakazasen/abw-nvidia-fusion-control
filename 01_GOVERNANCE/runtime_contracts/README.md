# Runtime Contracts

## Purpose

This folder defines bounded governance contracts for runtime-visible warnings, validation interpretation, readiness language, and evidence reporting.

## Canonical Ownership

- Owns runtime warning and evidence interpretation rules.
- Does not own implementation code, validation results, or operational handoff state.

## Belongs Here

- Runtime warning policy.
- Validation boundary rules.
- Bounded-readiness rules.
- Evidence reporting expectations.

## Does Not Belong Here

- Runtime implementation.
- Test results.
- Roadmap aspirations.
- Historical session logs.

## Relationship To Other Layers

- Operational surfaces live in `03_OPERATIONS/runtime_governance/`.
- Machine-readable contracts live in `01_GOVERNANCE/contracts/`.
- Non-claims live in `00_SYSTEM/NON_CLAIMS.md`.
- Validation evidence lives in `06_VALIDATION/`.
