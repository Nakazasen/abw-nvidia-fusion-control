# STALE_DOCUMENT_AUDIT

## Purpose

Record stale or potentially stale documents introduced or exposed by the reorganization.

## Findings

## SD-001: Legacy root README archived

- Severity: Info
- Evidence: `07_HISTORY/legacy/README_LEGACY_ROOT_2026-05-17.md`.
- Interpretation: preserved for history; not active bootstrap.
- Remediation: use root `README.md`, `START_HERE.md`, and `REPO_MAP.md`.

## SD-002: Legacy file index archived

- Severity: Low
- Evidence: `07_HISTORY/legacy/FILE_INDEX_LEGACY.md`.
- Interpretation: useful historical index, likely stale after the layered filesystem refactor.
- Remediation: do not use as canonical navigation.

## SD-003: Prompt files may reference older read order

- Severity: Medium
- Evidence: `prompts/` was not fully rewritten in this pass.
- Interpretation: prompt artifacts may lag behind canonical recovery order.
- Remediation: future prompt audit should align prompt templates with `START_HERE.md`.

## Non-Claims

- This audit does not certify all stale references are removed.
- It preserves stale artifacts where they serve historical recoverability.

