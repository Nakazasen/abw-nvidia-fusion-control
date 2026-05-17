# Governance Integration Points

LAST UPDATED: 2026-05-17

## Purpose

This document defines bounded runtime integration points for governance visibility.

## Ownership

- Canonical owner: `03_OPERATIONS/runtime_governance/`
- Runtime contracts: `01_GOVERNANCE/runtime_contracts/`
- Tooling: `tools/governance/`

## Canonicality

This file is the canonical list of approved lightweight integration points. It is not a claim that every point is already implemented.

## Implemented Integration Points

- Control runtime status snapshot: `tools/governance/runtime-status.ps1`
- Lightweight execution trace snapshot: `tools/governance/execution-trace.ps1`
- Governance tooling index: `tools/governance/README.md`
- Runtime governance contracts: `01_GOVERNANCE/runtime_contracts/`
- Context collapse recovery protocol: `04_RECOVERY/CONTEXT_COLLAPSE_PROTOCOL.md`
- Execution recovery protocol: `04_RECOVERY/EXECUTION_RECOVERY_PROTOCOL.md`

## Approved Optional Integration Points

### Pre-Run Warnings

- Warn if Control, NVIDIA, or ABW repo is dirty.
- Warn if canonical governance docs are missing.
- Warn if machine-readable governance contracts are missing or invalid JSON.
- Warn if handoff or governance audit files are old.
- Warn if current blocker docs contain unresolved blockers.

### Runtime Metadata

- Include governance snapshot timestamp in generated reports.
- Include exact repo commit and dirty-state evidence in validation output.
- Include bridge boundary statement for ABW read-only flows.
- Include recovery pointer to `START_HERE.md` and `04_RECOVERY/RECOVERY_PROTOCOL.md`.

### Startup Visibility

- Optional NVIDIA package script may invoke Control runtime status.
- Startup banners may point to Control recovery docs.
- Diagnostics panels may show governance status as advisory only.

### Validation Evidence

- Validation flows should report command, scope, repo, commit, dirty state, pass/fail, warnings, and residual risks.
- Passing tests must remain scoped evidence, not readiness promotion.

### Execution Evidence

- Meaningful operations may generate an advisory trace with `tools/governance/execution-trace.ps1`.
- Trace output is evidence scaffolding only; it does not prove the operation was correct or safe.
- Human-review-required actions must still preserve explicit approval evidence.

## Not Approved Without Governance Decision

- Hard-blocking normal startup on documentation age alone.
- Mutating ABW data from NVIDIA bridge without explicit scope.
- Promoting readiness from governance status output.
- Treating report-only scripts as CI enforcement.
- Auto-editing governance files from runtime tooling.

## Future Automation Hooks

- `runtime-status.ps1 -Json` for CI-readable output, if later implemented.
- Governance snapshot attachment to validation reports.
- Broken-link preflight before governance commits.
- Warning annotations in local developer UI.

## Anti-Drift Rule

If an integration point changes runtime behavior, it must be recorded in `05_DECISIONS/DECISION_LOG.md` or equivalent accepted decision lineage before being treated as governance-approved.
