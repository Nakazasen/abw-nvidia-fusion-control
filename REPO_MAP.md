# REPO_MAP

## Purpose

Top-level map of the cognitive filesystem architecture.

## Structure

- `00_SYSTEM/`: identity, philosophy, values, north star, non-claims
- `01_GOVERNANCE/`: governance contracts, ownership, boundaries, AI rules, execution contracts
- `02_ARCHITECTURE/`: architecture and cross-repo technical relationships
- `03_OPERATIONS/`: canonical operational state, session helpers, runtime governance surfaces, and execution layer maps
- `04_RECOVERY/`: recovery and onboarding protocols
- `05_DECISIONS/`: strategic roadmap, decisions, risks, derived decision/roadmap snapshots
- `06_VALIDATION/`: pilot plans/checklists, review gates, and rerun evidence artifacts
- `07_HISTORY/`: chronological and archival history layer
- `tools/governance/`: report-only governance and execution audit helpers
- `prompts/`: historical or reusable architect prompts; not operational truth

## Deterministic Reading Order

- Start: `START_HERE.md`
- Governance graph: `01_GOVERNANCE/GOVERNANCE_MAP.md`
- Recovery bootstrap: `04_RECOVERY/RECOVERY_PROTOCOL.md`

## Operational Recovery Flow

`03_OPERATIONS/SESSION_RESTORE.md` -> `03_OPERATIONS/HANDOFF.md` -> `03_OPERATIONS/CURRENT_BLOCKERS.md`.

## Governance Flow

`01_GOVERNANCE/*` defines ownership, precedence, and anti-drift boundaries.

Machine-checkable governance starts in `01_GOVERNANCE/contracts/` and the non-destructive enforcement plan lives in `01_GOVERNANCE/automation/`.

Runtime-aware governance contracts live in `01_GOVERNANCE/runtime_contracts/`; runtime surfaces and approved integration points live in `03_OPERATIONS/runtime_governance/`.

Report-only runtime status is available at `tools/governance/runtime-status.ps1`.

Execution-aware governance contracts live in `01_GOVERNANCE/execution_contracts/`; execution surfaces and traceability models live in `03_OPERATIONS/execution_layer/`.

## Validation Flow

Protocol first in `06_VALIDATION/PILOT_CHECKLIST.md`, then evidence artifacts (`06_VALIDATION/REAL_USER_PILOT_REPORT.md`, reruns, sprint audits).

## Decision Flow

Canonical: `05_DECISIONS/ROADMAP.md`, `05_DECISIONS/DECISIONS.md`, `05_DECISIONS/RISKS.md`.
Derived: `05_DECISIONS/ROADMAP_STATE.md`, `05_DECISIONS/DECISION_LOG.md`.

## History Flow

Primary chronology: `07_HISTORY/INTEGRATION_JOURNAL.md`.

Governance audits live in `07_HISTORY/governance_audits/`.

## Runtime Governance Flow

Use `tools/governance/runtime-status.ps1` for advisory local status, then inspect `03_OPERATIONS/runtime_governance/WORKFLOW_RISK_MAP.md` before interpreting runtime or validation evidence.

Runtime governance output is not CI enforcement and not readiness proof.

## Execution Flow

Classify the action with `03_OPERATIONS/execution_layer/ACTION_BOUNDARY_MAP.md`, check human-review requirements in `06_VALIDATION/review_gates/HUMAN_REVIEW_REQUIRED_MATRIX.md`, and record lightweight trace context with `tools/governance/execution-trace.ps1` when useful.

Execution traces are optional evidence templates, not autonomous telemetry.

