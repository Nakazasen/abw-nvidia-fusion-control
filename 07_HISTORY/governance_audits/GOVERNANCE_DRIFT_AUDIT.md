# GOVERNANCE_DRIFT_AUDIT

## Purpose

Record observed governance drift risks after the cognitive filesystem refactor.

## Scope

- Control repository governance files.
- Local-first interpretation only.

## Findings

## GD-001: Historical files contain old root-path references

- Severity: Medium
- Evidence: legacy and historical docs preserve older references such as root-level `ROADMAP.md` and `HANDOFF.md` inside archived context.
- Interpretation: acceptable in archive context, risky if read as current routing.
- Remediation: use `START_HERE.md` and `REPO_MAP.md` as entrypoints; future scanner should allowlist `07_HISTORY/legacy`.

## GD-002: Handoff remains large and history-heavy

- Severity: Medium
- Evidence: `03_OPERATIONS/HANDOFF.md` remains the canonical operational truth but also contains long historical sections.
- Interpretation: preserves lineage, but increases token load.
- Remediation: future pass may split archived handoff history into `07_HISTORY/` only after an explicit governance decision.

## GD-003: Machine-readable contracts are new and not CI-enforced

- Severity: Low
- Evidence: contracts exist under `01_GOVERNANCE/contracts/`.
- Interpretation: useful for future enforcement, not active enforcement.
- Remediation: keep explicit non-claim that CI is planned, not complete.

## Non-Claims

- This audit does not certify drift-free governance.
- This audit does not claim production-grade enforcement.
