# Runtime Warning Policy

LAST UPDATED: 2026-05-17

## Purpose

Define what runtime governance tooling may warn about and what it must not enforce without explicit governance approval.

## Ownership

- Canonical owner: `01_GOVERNANCE/runtime_contracts/`
- Operational surfaces: `03_OPERATIONS/runtime_governance/`
- Tooling: `tools/governance/`

## Enforcement Philosophy

Warnings are visibility, not proof. Runtime governance should make risk harder to miss without breaking developer ergonomics or pretending autonomous enforcement exists.

## Allowed Warnings

- Dirty Control, NVIDIA, or ABW repo state.
- Missing canonical governance documents.
- Invalid machine-readable governance contracts.
- Stale operational handoff.
- Stale governance audits.
- Unresolved blocker indicators.
- Forbidden readiness claims.
- Broken canonical references.
- Missing recovery entrypoints.

## Allowed Blocking

Blocking is allowed only when an existing safety boundary already requires it, such as:

- Workspace trust checks.
- Explicit Review + Apply mutation gates.
- Read-only bridge mode.
- User-approved mutation scope.

Documentation age alone must not block normal runtime work.

## Must Not Claim

- Governance warnings are CI enforcement.
- Warnings prove readiness.
- Absence of warnings proves safety.
- Runtime governance is autonomous.
- The system is self-healing.

## Escalation

- High-risk warnings must be recorded in handoff or blocker docs before readiness interpretation.
- Forbidden claims should be corrected before commit.
- Missing canonical docs should be treated as recovery failure until restored.

## Anti-Pattern Examples

- "Governance status passed, therefore daily use is ready."
- "No warning appeared, therefore bridge mutation is safe."
- "The status script enforces policy."
- "Stale handoff can be ignored because tests passed."

## Future Hooks

- Optional JSON output for CI experimentation.
- Warning annotations in local startup diagnostics.
- Report metadata embedding governance snapshot timestamp.
