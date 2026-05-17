# RECOVERY_PROTOCOL

## Purpose

Provide a deterministic recovery path for humans and AI agents after context loss.

## Ownership

- Owner: Governance Recorder
- Canonicality: Canonical recovery protocol

## SOURCE OF TRUTH

- Latest operational truth: `03_OPERATIONS/HANDOFF.md`
- Governance hierarchy: `01_GOVERNANCE/GOVERNANCE_MAP.md`
- Context collapse recovery: `04_RECOVERY/CONTEXT_COLLAPSE_PROTOCOL.md`
- Execution recovery: `04_RECOVERY/EXECUTION_RECOVERY_PROTOCOL.md`

## READ THIS FIRST ORDER (Human + AI)

1. `00_SYSTEM/SYSTEM_IDENTITY.md`
2. `00_SYSTEM/PROJECT_PHILOSOPHY.md`
3. `00_SYSTEM/NON_CLAIMS.md`
4. `01_GOVERNANCE/GOVERNANCE_MAP.md`
5. `01_GOVERNANCE/FILE_OWNERSHIP.md`
6. `03_OPERATIONS/HANDOFF.md`
7. `03_OPERATIONS/CURRENT_BLOCKERS.md`
8. `05_DECISIONS/ROADMAP_STATE.md`
9. `02_ARCHITECTURE/ARCHITECTURE_STATE.md`
10. `05_DECISIONS/DECISION_LOG.md`
11. `05_DECISIONS/DECISIONS.md`
12. `05_DECISIONS/RISKS.md`
13. `07_HISTORY/INTEGRATION_JOURNAL.md`
14. `03_OPERATIONS/SESSION_RESTORE.md`
15. `03_OPERATIONS/NEXT.md`

## If Context Is Lost, Start Here

- Start at step 1 above.
- Do not begin implementation or governance claims before step 7.
- If memory is partial, repo state conflicts, or the handoff appears stale, continue through `04_RECOVERY/CONTEXT_COLLAPSE_PROTOCOL.md`.
- For advisory runtime status, run `tools/governance/runtime-status.ps1`.
- If execution was interrupted, partially validated, or has stale evidence, continue through `04_RECOVERY/EXECUTION_RECOVERY_PROTOCOL.md`.

## If Onboarding New AI, Read These Files

- `01_GOVERNANCE/AI_AGENT_OPERATING_RULES.md`
- `04_RECOVERY/RECOVERY_PROTOCOL.md`
- `00_SYSTEM/NON_CLAIMS.md`
- `03_OPERATIONS/HANDOFF.md`
- `03_OPERATIONS/CURRENT_BLOCKERS.md`
- `01_GOVERNANCE/automation/GOVERNANCE_ENFORCEMENT.md`
- `01_GOVERNANCE/contracts/cognitive-routing.json`
- `01_GOVERNANCE/runtime_contracts/runtime-warning-policy.md`
- `03_OPERATIONS/runtime_governance/RUNTIME_GOVERNANCE_SURFACE.md`
- `01_GOVERNANCE/execution_contracts/bounded-execution-contract.md`
- `03_OPERATIONS/execution_layer/ACTION_BOUNDARY_MAP.md`
- `06_VALIDATION/review_gates/HUMAN_REVIEW_REQUIRED_MATRIX.md`

## If Repo Drift Detected, Compare These Files

- `03_OPERATIONS/HANDOFF.md` vs `07_HISTORY/INTEGRATION_JOURNAL.md`
- `05_DECISIONS/ROADMAP.md` vs `05_DECISIONS/ROADMAP_STATE.md`
- `05_DECISIONS/DECISIONS.md` vs `05_DECISIONS/DECISION_LOG.md`
- `05_DECISIONS/RISKS.md` vs `03_OPERATIONS/CURRENT_BLOCKERS.md`

## Conflict Precedence

If operational truth conflicts exist:
1. `03_OPERATIONS/HANDOFF.md` (latest accepted operational truth)
2. `07_HISTORY/INTEGRATION_JOURNAL.md` (chronological operational evidence)
3. `05_DECISIONS/DECISIONS.md` / `05_DECISIONS/RISKS.md` / `05_DECISIONS/ROADMAP.md` (strategic canonical set)
4. Derived/helper files (`*_STATE`, `SESSION_*`, `NEXT`)

Machine-readable reference:
- `01_GOVERNANCE/contracts/repo-truth-hierarchy.json`

Runtime-aware reference:
- `03_OPERATIONS/runtime_governance/WORKFLOW_RISK_MAP.md`
- `tools/governance/runtime-status.ps1`

Execution-aware reference:
- `03_OPERATIONS/execution_layer/EXECUTION_SURFACE_MAP.md`
- `04_RECOVERY/EXECUTION_RECOVERY_PROTOCOL.md`
- `tools/governance/execution-trace.ps1`

