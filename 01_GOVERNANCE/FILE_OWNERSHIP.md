# FILE_OWNERSHIP

## Purpose

State file ownership, canonicality, and allowed interpretation scope.

## Ownership

- Owner: Governance Recorder
- Canonicality: Canonical ownership registry

## LAST UPDATED

- 2026-05-17

## SOURCE OF TRUTH

- Governance topology: `01_GOVERNANCE/GOVERNANCE_MAP.md`
- Recovery order: `04_RECOVERY/RECOVERY_PROTOCOL.md`

## Governance Ownership Table

| File | Owner Role | Purpose | Canonicality |
| --- | --- | --- | --- |
| `00_SYSTEM/SYSTEM_IDENTITY.md` | Architect + Governance Recorder | Repo identity contract | Canonical |
| `00_SYSTEM/PROJECT_PHILOSOPHY.md` | Architect | Philosophy and doctrine | Canonical |
| `00_SYSTEM/ENGINEERING_VALUES.md` | Architect + Auditor | Validation and integrity standards | Canonical |
| `00_SYSTEM/NON_CLAIMS.md` | Governance Recorder + Auditor | Forbidden claim boundaries | Canonical |
| `05_DECISIONS/ROADMAP.md` | Architect + Governance Recorder | Strategic roadmap | Canonical |
| `05_DECISIONS/DECISIONS.md` | Architect + Governance Recorder | Accepted governance decisions | Canonical |
| `05_DECISIONS/RISKS.md` | Architect + Auditor | Persistent risk registry | Canonical |
| `03_OPERATIONS/HANDOFF.md` | Governance Recorder | Latest accepted operational truth | Canonical |
| `07_HISTORY/INTEGRATION_JOURNAL.md` | Governance Recorder | Chronological integration log | Canonical chronological |
| `03_OPERATIONS/CURRENT_BLOCKERS.md` | Auditor + Governance Recorder | Active blockers dashboard | Derived operational |
| `02_ARCHITECTURE/ARCHITECTURE_STATE.md` | Governance Recorder | Local architecture snapshot | Derived |
| `05_DECISIONS/ROADMAP_STATE.md` | Governance Recorder | Local roadmap-state snapshot | Derived |
| `05_DECISIONS/DECISION_LOG.md` | Governance Recorder | Local decision snapshot | Derived |
| `03_OPERATIONS/SESSION_CLOSE.md` | Operator + Governance Recorder | Session closure breadcrumbs/archive index | Archival helper |
| `03_OPERATIONS/SESSION_RESTORE.md` | Operator | Recovery bootstrap helper | Operational helper |
| `03_OPERATIONS/NEXT.md` | Operator | Immediate action board | Helper |
| `01_GOVERNANCE/GOVERNANCE_MAP.md` | Governance Recorder | Governance topology + memory graph | Canonical |
| `01_GOVERNANCE/FILE_OWNERSHIP.md` | Governance Recorder | Ownership and canonicality contract | Canonical |
| `01_GOVERNANCE/COGNITION_BOUNDARIES.md` | Governance Recorder | Anti-drift boundary rules | Canonical |
| `01_GOVERNANCE/ANTI_PATTERNS.md` | Governance Recorder | Explicit anti-pattern guardrails | Supporting governance |
| `01_GOVERNANCE/automation/` | Governance Recorder + Auditor | Enforcement design docs | Planned enforcement |
| `01_GOVERNANCE/contracts/` | Governance Recorder | Machine-readable governance contracts | Contract metadata |
| `01_GOVERNANCE/runtime_contracts/` | Governance Recorder + Auditor | Runtime warning and evidence contracts | Canonical runtime governance |
| `01_GOVERNANCE/execution_contracts/` | Governance Recorder + Auditor | Evidence-aware execution contracts | Canonical execution governance |
| `03_OPERATIONS/runtime_governance/` | Governance Recorder + Operator | Runtime governance surfaces and integration points | Operational governance map |
| `03_OPERATIONS/execution_layer/` | Governance Recorder + Operator | Execution surfaces, boundaries, trace models | Operational execution map |
| `04_RECOVERY/RECOVERY_PROTOCOL.md` | Governance Recorder | Read-first recovery order | Canonical |
| `04_RECOVERY/CONTEXT_COLLAPSE_PROTOCOL.md` | Governance Recorder | Partial memory loss and conflict recovery | Canonical recovery hardening |
| `04_RECOVERY/EXECUTION_RECOVERY_PROTOCOL.md` | Governance Recorder + Auditor | Interrupted/stale execution recovery | Canonical recovery hardening |
| `02_ARCHITECTURE/REPO_RELATIONSHIPS.md` | Architect | Cross-repo boundaries and relationships | Canonical |
| `04_RECOVERY/CONTRIBUTOR_ONBOARDING.md` | Governance Recorder | Human onboarding protocol | Canonical process |
| `01_GOVERNANCE/AI_AGENT_OPERATING_RULES.md` | Architect + Auditor | AI behavior contract | Canonical contract |
| `06_VALIDATION/PILOT_CHECKLIST.md` | Auditor + Governance Recorder | Pilot protocol | Canonical protocol |
| `06_VALIDATION/review_gates/` | Auditor + Governance Recorder | Human review and validation escalation gates | Canonical validation governance |
| `06_VALIDATION/REAL_USER_PILOT_REPORT.md` | Auditor | Fail evidence artifact | Canonical evidence |
| `06_VALIDATION/REAL_USER_PILOT_RERUN_REPORT.md` | Auditor | Rerun evidence artifact | Canonical evidence |
| `06_VALIDATION/SPRINT_B_VIETNAMESE_INGEST_RERUN_REPORT.md` | Auditor | Bounded strengthening evidence | Canonical evidence |
| `07_HISTORY/governance_audits/` | Auditor + Governance Recorder | Governance drift and reference audits | Historical audit |
| `tools/governance/` | Governance Recorder + Auditor | Experimental report-only scripts | Prototype tooling |
| `prompts/` | Architect + Governance Recorder | Historical/reusable prompt artifacts | Supporting context only |

## Ownership Rules

- Canonical files may define accepted truth.
- Derived/helper files may summarize and point, not redefine.
- Evidence files are append-only historical artifacts.
- Fail artifacts cannot be replaced by rerun artifacts.

## Update Sequence

1. Update canonical decision/risk/roadmap/handoff files.
2. Update derived snapshots.
3. Update helper files (`SESSION_*`, `NEXT`) with pointers only.
4. Preserve evidence artifacts unchanged except additive chronology notes.


