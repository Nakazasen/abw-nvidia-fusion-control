# GOVERNANCE_ENFORCEMENT

## Purpose

Define how governance moves from human discipline toward machine-checkable enforcement without pretending full automation exists.

## Scope

- Control repository documentation and governance contracts.
- Cross-repo truth references for Control, NVIDIA, and ABW.
- Non-destructive detection only in the current phase.

## Enforcement Philosophy

- Detect before changing.
- Report evidence before remediation.
- Prefer canonical references over duplicated mirrors.
- Preserve historical evidence even when it is stale.

## Detection Rules

- Canonical docs must exist in the paths declared by `01_GOVERNANCE/contracts/canonical-docs.json`.
- Recovery order must begin from `START_HERE.md`.
- Helper files must not claim canonical readiness.
- Validation reports must preserve non-claims.
- Any `DAILY_USE_READY` reference must appear as a non-claim or explicitly blocked claim unless promoted by `05_DECISIONS/DECISIONS.md`.

## Escalation Rules

- Critical: missing canonical doc, broken recovery path, or unqualified readiness claim.
- High: duplicated latest-state mirror outside `03_OPERATIONS/HANDOFF.md`.
- Medium: stale root-path reference after filesystem refactor.
- Low: wording drift that does not change authority.

## Non-Goals

- No autonomous governance mutation.
- No production CI guarantee.
- No proof of enterprise-grade governance.

## Anti-Pattern Examples

- Copying full handoff state into `03_OPERATIONS/NEXT.md`.
- Treating `05_DECISIONS/ROADMAP_STATE.md` as canonical roadmap.
- Rewriting failed pilot reports after a rerun pass.

## Future Automation Hooks

- Add CI job to run `tools/governance/check-governance.ps1`.
- Emit JSON findings for review dashboards.
- Add allowlists for historical/archive exceptions.

