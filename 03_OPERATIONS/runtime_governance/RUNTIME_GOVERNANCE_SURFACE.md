# Runtime Governance Surface

LAST UPDATED: 2026-05-17

## Purpose

This document maps where governance should become visible during real operational workflows without claiming autonomous enforcement.

## Ownership

- Canonical owner: `03_OPERATIONS/runtime_governance/`
- Related governance contracts: `01_GOVERNANCE/runtime_contracts/`
- Related machine-readable contracts: `01_GOVERNANCE/contracts/`
- Related runtime status tool: `tools/governance/runtime-status.ps1`

## Canonicality

This file is the operational surface map for runtime-aware governance. It does not replace `03_OPERATIONS/HANDOFF.md`, `05_DECISIONS/ROADMAP_STATE.md`, validation reports, or implementation repo docs.

## Source Of Truth

- Operational truth: `03_OPERATIONS/HANDOFF.md`
- Blocker truth: `03_OPERATIONS/CURRENT_BLOCKERS.md`
- Governance boundaries: `01_GOVERNANCE/GOVERNANCE_MAP.md`
- Runtime warning rules: `01_GOVERNANCE/runtime_contracts/runtime-warning-policy.md`
- Validation boundaries: `01_GOVERNANCE/runtime_contracts/validation-boundary-contract.md`

## Runtime Surfaces

### Control Repo

- Recovery bootstrap: `START_HERE.md`, `REPO_MAP.md`, `04_RECOVERY/RECOVERY_PROTOCOL.md`
- Operational restart: `03_OPERATIONS/HANDOFF.md`, `03_OPERATIONS/NEXT.md`, `03_OPERATIONS/CURRENT_BLOCKERS.md`
- Governance diagnostics: `tools/governance/`
- Machine-readable contracts: `01_GOVERNANCE/contracts/`
- Audit lineage: `07_HISTORY/governance_audits/`

Governance should surface here as report-only status, stale-doc warnings, missing canonical-doc warnings, and explicit recovery routing.

### NVIDIA Repo

- Server startup/runtime: `tools/nvidia-server.mjs`
- ABW bridge reader: `tools/abw-cli-reader.mjs`
- Browser and bridge smoke tests: `tools/browser-smoke.mjs`, `tests/`
- Package scripts: `package.json`
- User-facing local UI: `nvidia_playground.html`

Governance should surface here as optional status checks and warnings. It must not block normal development unless an existing safety boundary already requires it.

### ABW Repo

- CLI and read-only query flow: `src/abw/cli.py`
- Ingest/review flows: `src/abw/ingest.py`, `src/abw/review.py`
- Test evidence: `tests/`
- Project docs: `docs/`

Governance should surface here as read-only boundary reminders, evidence reporting expectations, and bridge contract references. ABW mutation behavior remains governed by ABW implementation rules and explicit scope.

## Runtime Governance Should Influence

- Whether operators see repo cleanliness warnings before interpreting results.
- Whether validation reports include exact scope, command, commit, pass/fail, and residual risks.
- Whether stale handoff or governance audit state is visible before starting work.
- Whether forbidden readiness claims are flagged before they become governance truth.
- Whether context-loss recovery routes agents back to canonical documents.
- Whether bridge work preserves read-only and workspace trust boundaries.

## Runtime Governance Must Not Claim

- Production readiness.
- Daily-use readiness.
- Autonomous safety.
- Self-healing governance.
- Enterprise-grade compliance.
- Complete anti-hallucination enforcement.
- Full Cognitive OS completion.

## Non-Goals

- No hard CI gate is established by this document.
- No runtime behavior is made authoritative by documentation alone.
- No implementation repo is promoted in maturity.
- No validation evidence is inferred from passing governance checks.

## Future Hooks

- Startup banner warning that points to Control recovery docs.
- Optional `governance:status` package script.
- Report metadata footer that includes governance snapshot path and timestamp.
- Non-blocking preflight warning for dirty repo state.
- Non-blocking stale handoff and stale audit warnings.
