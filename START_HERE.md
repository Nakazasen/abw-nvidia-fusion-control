# START_HERE

## Purpose

Universal bootstrap entrypoint for humans and AI agents.

## Current Maturity Reality

- Readiness is bounded and not promoted to production readiness.
- Local repos are primary truth; remotes are synchronization mirrors.
- Historical fail -> fix -> rerun lineage is preserved and mandatory context.

## Active Non-Claims

See `00_SYSTEM/NON_CLAIMS.md`.

## Read This First Order

1. `00_SYSTEM/SYSTEM_IDENTITY.md`
2. `00_SYSTEM/PROJECT_PHILOSOPHY.md`
3. `00_SYSTEM/ENGINEERING_VALUES.md`
4. `00_SYSTEM/NON_CLAIMS.md`
5. `01_GOVERNANCE/GOVERNANCE_MAP.md`
6. `01_GOVERNANCE/FILE_OWNERSHIP.md`
7. `03_OPERATIONS/HANDOFF.md`
8. `03_OPERATIONS/CURRENT_BLOCKERS.md`
9. `05_DECISIONS/ROADMAP_STATE.md`
10. `02_ARCHITECTURE/ARCHITECTURE_STATE.md`
11. `05_DECISIONS/DECISION_LOG.md`
12. `04_RECOVERY/RECOVERY_PROTOCOL.md`

## Machine-Checkable Governance Pointers

- Enforcement philosophy: `01_GOVERNANCE/automation/GOVERNANCE_ENFORCEMENT.md`
- Conflict rules: `01_GOVERNANCE/automation/CANONICAL_CONFLICT_RULES.md`
- Canonical docs contract: `01_GOVERNANCE/contracts/canonical-docs.json`
- Truth hierarchy contract: `01_GOVERNANCE/contracts/repo-truth-hierarchy.json`
- Experimental report-only tools: `tools/governance/README.md`
- Runtime governance status: `tools/governance/runtime-status.ps1`
- Runtime governance surfaces: `03_OPERATIONS/runtime_governance/RUNTIME_GOVERNANCE_SURFACE.md`
- Runtime warning contract: `01_GOVERNANCE/runtime_contracts/runtime-warning-policy.md`
- Execution surface map: `03_OPERATIONS/execution_layer/EXECUTION_SURFACE_MAP.md`
- Execution boundary contract: `01_GOVERNANCE/execution_contracts/bounded-execution-contract.md`
- Human review gates: `06_VALIDATION/review_gates/HUMAN_REVIEW_REQUIRED_MATRIX.md`

## Operational Status Pointers

- Latest operational truth: `03_OPERATIONS/HANDOFF.md`
- Active blockers: `03_OPERATIONS/CURRENT_BLOCKERS.md`
- Immediate actions: `03_OPERATIONS/NEXT.md`

## Repo Relationships

See `02_ARCHITECTURE/REPO_RELATIONSHIPS.md`.

## Recovery Path

If context is lost, execute `04_RECOVERY/RECOVERY_PROTOCOL.md`.

If context is partially collapsed, repo state conflicts, or operational truth appears stale, continue through `04_RECOVERY/CONTEXT_COLLAPSE_PROTOCOL.md`.

If execution was interrupted or evidence is stale/conflicting, execute `04_RECOVERY/EXECUTION_RECOVERY_PROTOCOL.md`.
