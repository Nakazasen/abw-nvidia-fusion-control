# CANONICAL_REFERENCE_AUDIT

## Purpose

Audit whether canonical references are clear after the filesystem refactor.

## Findings

## CR-001: Canonical entrypoint exists

- Severity: Info
- Evidence: `START_HERE.md` exists and routes to `REPO_MAP.md`, system docs, governance map, recovery protocol, and handoff.
- Remediation: maintain this file as the root bootstrap.

## CR-002: Canonical ownership is machine-readable and prose-readable

- Severity: Info
- Evidence: `01_GOVERNANCE/FILE_OWNERSHIP.md` and `01_GOVERNANCE/contracts/canonical-docs.json`.
- Remediation: future checker should compare both sources for divergence.

## CR-003: Legacy `AGENTS.md` was patched for new paths but may still contain older governance assumptions

- Severity: Medium
- Evidence: `AGENTS.md` predates the layered filesystem and now references moved paths.
- Interpretation: useful operator instruction file, but not the canonical map.
- Remediation: future review should align `AGENTS.md` with `START_HERE.md` and `REPO_MAP.md`.

## Non-Claims

- This audit does not prove every path reference is valid.
- Broken-reference checking exists as an experimental report-only prototype in `tools/governance/`.
