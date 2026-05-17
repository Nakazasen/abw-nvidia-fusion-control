# GOVERNANCE_MAP

## Purpose

Define canonical governance hierarchy and memory graph to prevent duplicate truths.

## Ownership

- Owner: Governance Recorder
- Canonicality: Canonical governance topology map

## LAST UPDATED

- 2026-05-17

## SOURCE OF TRUTH

- Strategic canonical set: `05_DECISIONS/ROADMAP.md`, `05_DECISIONS/DECISIONS.md`, `05_DECISIONS/RISKS.md`
- Operational canonical set: `03_OPERATIONS/HANDOFF.md`, `07_HISTORY/INTEGRATION_JOURNAL.md`

## DO NOT DUPLICATE

- Do not mirror full operational states into helper/snapshot docs.
- Prefer compact summaries and links to canonical files.

## Canonical Hierarchy

1. Strategic truth
- `05_DECISIONS/ROADMAP.md`
- `05_DECISIONS/DECISIONS.md`
- `05_DECISIONS/RISKS.md`
- `00_SYSTEM/NON_CLAIMS.md`

2. Operational truth
- `03_OPERATIONS/HANDOFF.md`
- `07_HISTORY/INTEGRATION_JOURNAL.md`
- `03_OPERATIONS/CURRENT_BLOCKERS.md`

3. Derived state snapshots
- `02_ARCHITECTURE/ARCHITECTURE_STATE.md`
- `05_DECISIONS/ROADMAP_STATE.md`
- `05_DECISIONS/DECISION_LOG.md`

4. Session and recovery helpers
- `03_OPERATIONS/SESSION_CLOSE.md`
- `03_OPERATIONS/SESSION_RESTORE.md`
- `03_OPERATIONS/NEXT.md`
- `04_RECOVERY/RECOVERY_PROTOCOL.md`

5. Governance topology and ownership
- `01_GOVERNANCE/GOVERNANCE_MAP.md`
- `01_GOVERNANCE/FILE_OWNERSHIP.md`
- `01_GOVERNANCE/COGNITION_BOUNDARIES.md`
- `02_ARCHITECTURE/REPO_RELATIONSHIPS.md`
- `01_GOVERNANCE/ANTI_PATTERNS.md`
- `01_GOVERNANCE/automation/`
- `01_GOVERNANCE/contracts/`
- `01_GOVERNANCE/runtime_contracts/`
- `01_GOVERNANCE/execution_contracts/`
- `03_OPERATIONS/runtime_governance/`
- `03_OPERATIONS/execution_layer/`

6. Validation protocol and evidence
- `06_VALIDATION/PILOT_CHECKLIST.md`
- `06_VALIDATION/REAL_USER_PILOT_REPORT.md`
- `06_VALIDATION/REAL_USER_PILOT_RERUN_REPORT.md`
- `06_VALIDATION/SPRINT_B_VIETNAMESE_INGEST_RERUN_REPORT.md`

## True Memory Graph

- `05_DECISIONS/ROADMAP.md` -> strategic direction, phase intent, long-horizon constraints
- `05_DECISIONS/DECISIONS.md` -> accepted governance decisions that bind interpretation
- `05_DECISIONS/RISKS.md` -> persistent risk classes and mitigation expectations
- `00_SYSTEM/NON_CLAIMS.md` -> explicit forbidden readiness claims
- `03_OPERATIONS/HANDOFF.md` -> latest accepted operational truth
- `07_HISTORY/INTEGRATION_JOURNAL.md` -> chronological integration lineage
- `03_OPERATIONS/CURRENT_BLOCKERS.md` -> active gating constraints for current execution
- `02_ARCHITECTURE/ARCHITECTURE_STATE.md` -> local architecture snapshot derived from current repos
- `05_DECISIONS/ROADMAP_STATE.md` -> local roadmap-state snapshot derived from current repos
- `05_DECISIONS/DECISION_LOG.md` -> working/derived decision snapshot before canonical promotion
- `03_OPERATIONS/SESSION_CLOSE.md` -> compact closure breadcrumbs and archive index
- `03_OPERATIONS/SESSION_RESTORE.md` -> compact recovery bootstrap
- `03_OPERATIONS/NEXT.md` -> immediate action board only
- `01_GOVERNANCE/FILE_OWNERSHIP.md` -> role ownership and canonicality boundaries
- `01_GOVERNANCE/COGNITION_BOUNDARIES.md` -> canonical vs derived guardrails
- `03_OPERATIONS/execution_layer/EXECUTION_SURFACE_MAP.md` -> real executable surfaces and action classes
- `06_VALIDATION/review_gates/HUMAN_REVIEW_REQUIRED_MATRIX.md` -> human review thresholds for execution

## Overlap Control Rules

- `05_DECISIONS/ROADMAP.md` is canonical; `05_DECISIONS/ROADMAP_STATE.md` is derived.
- `05_DECISIONS/DECISIONS.md` is canonical; `05_DECISIONS/DECISION_LOG.md` is derived.
- `05_DECISIONS/RISKS.md` is canonical; `03_OPERATIONS/CURRENT_BLOCKERS.md` is derived operational.
- `03_OPERATIONS/HANDOFF.md` is canonical; `03_OPERATIONS/SESSION_CLOSE.md`, `03_OPERATIONS/SESSION_RESTORE.md`, `03_OPERATIONS/NEXT.md` are helper/archival.

## Drift Detection Paths

- `03_OPERATIONS/HANDOFF.md` vs `07_HISTORY/INTEGRATION_JOURNAL.md`
- `05_DECISIONS/ROADMAP.md` vs `05_DECISIONS/ROADMAP_STATE.md`
- `05_DECISIONS/DECISIONS.md` vs `05_DECISIONS/DECISION_LOG.md`
- `05_DECISIONS/RISKS.md` vs `03_OPERATIONS/CURRENT_BLOCKERS.md`

## Machine-Readable Contracts

- `01_GOVERNANCE/contracts/governance-schema.json`
- `01_GOVERNANCE/contracts/canonical-docs.json`
- `01_GOVERNANCE/contracts/cognitive-routing.json`
- `01_GOVERNANCE/contracts/repo-truth-hierarchy.json`
- `01_GOVERNANCE/contracts/document-lifecycle.json`

## Runtime-Aware Governance

- Runtime warning policy: `01_GOVERNANCE/runtime_contracts/runtime-warning-policy.md`
- Validation boundary contract: `01_GOVERNANCE/runtime_contracts/validation-boundary-contract.md`
- Bounded readiness contract: `01_GOVERNANCE/runtime_contracts/bounded-readiness-contract.md`
- Evidence reporting contract: `01_GOVERNANCE/runtime_contracts/evidence-reporting-contract.md`
- Runtime surfaces: `03_OPERATIONS/runtime_governance/RUNTIME_GOVERNANCE_SURFACE.md`
- Workflow risk map: `03_OPERATIONS/runtime_governance/WORKFLOW_RISK_MAP.md`
- Integration points: `03_OPERATIONS/runtime_governance/GOVERNANCE_INTEGRATION_POINTS.md`
- Runtime status tool: `tools/governance/runtime-status.ps1`

Runtime-aware governance is advisory and report-only unless an existing safety boundary already blocks behavior.

## Execution-Aware Governance

- Execution surface map: `03_OPERATIONS/execution_layer/EXECUTION_SURFACE_MAP.md`
- Action boundary map: `03_OPERATIONS/execution_layer/ACTION_BOUNDARY_MAP.md`
- Execution risk zones: `03_OPERATIONS/execution_layer/EXECUTION_RISK_ZONES.md`
- Execution trace model: `03_OPERATIONS/execution_layer/EXECUTION_TRACE_MODEL.md`
- Action evidence contract: `01_GOVERNANCE/execution_contracts/action-evidence-contract.md`
- Bounded execution contract: `01_GOVERNANCE/execution_contracts/bounded-execution-contract.md`
- Uncertainty surfacing contract: `01_GOVERNANCE/execution_contracts/uncertainty-surfacing-contract.md`
- Human review matrix: `06_VALIDATION/review_gates/HUMAN_REVIEW_REQUIRED_MATRIX.md`
- Execution recovery protocol: `04_RECOVERY/EXECUTION_RECOVERY_PROTOCOL.md`

Execution-aware governance constrains interpretation and escalation. It does not create trusted autonomous mutation.


