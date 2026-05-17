# REPO_RELATIONSHIPS

## Purpose

Define boundaries and data flow between Control, NVIDIA, and ABW repositories.

## Ownership

- Owner: Architect
- Canonicality: Canonical cross-repo boundary document

## SOURCE OF TRUTH

- Boundary decisions: `05_DECISIONS/DECISIONS.md`
- Bridge constraints: `02_ARCHITECTURE/BRIDGE_CONTRACT.md`

## Repository Roles

- Control (`D:\Sandbox\ABW_NVIDIA_FUSION_CONTROL`)
  - Governance memory, decisions, risks, readiness boundaries, handoff truth.
- NVIDIA (`D:\Sandbox\Nvidia`)
  - Product shell/runtime, UI/server/tests for bounded bridge path.
- ABW (`D:\Sandbox\skill-Anti-brain-wiki_note`)
  - Governance/knowledge engine, trust and read-only safety behavior.

## Local-First Truth Rule

- Local working trees and local commits are primary truth.
- Remote GitHub heads are synchronization references only.

## Mutation Boundaries

- Control docs should not silently mutate NVIDIA/ABW implementation facts.
- NVIDIA/ABW changes require explicit evidence before governance promotion.
- Bridge expansions beyond bounded read-only scope require explicit gate decisions.

## Relationship Graph

- `05_DECISIONS/ROADMAP.md` -> strategic direction
- `05_DECISIONS/DECISIONS.md` -> binding governance decisions
- `05_DECISIONS/RISKS.md` -> persistent risk classes
- `03_OPERATIONS/HANDOFF.md` -> latest operational accepted state
- `07_HISTORY/INTEGRATION_JOURNAL.md` -> chronological integration record
- `03_OPERATIONS/CURRENT_BLOCKERS.md` -> active operational blockers
- `05_DECISIONS/ROADMAP_STATE.md` + `02_ARCHITECTURE/ARCHITECTURE_STATE.md` + `05_DECISIONS/DECISION_LOG.md` -> derived local snapshots

## Full Cognition Graph (Operational + Governance)

- `01_GOVERNANCE/GOVERNANCE_MAP.md` -> topology and canonical hierarchy
- `01_GOVERNANCE/FILE_OWNERSHIP.md` -> ownership and canonicality contract
- `01_GOVERNANCE/COGNITION_BOUNDARIES.md` -> anti-drift guardrails
- `03_OPERATIONS/SESSION_CLOSE.md` -> compact close breadcrumbs and archive index
- `03_OPERATIONS/SESSION_RESTORE.md` -> recovery bootstrap path
- `03_OPERATIONS/NEXT.md` -> immediate next actions only

## Precedence Rule

If truth conflicts occur:
1. `03_OPERATIONS/HANDOFF.md`
2. `07_HISTORY/INTEGRATION_JOURNAL.md`
3. `05_DECISIONS/ROADMAP.md` + `05_DECISIONS/DECISIONS.md` + `05_DECISIONS/RISKS.md` + `00_SYSTEM/NON_CLAIMS.md`
4. Derived/helper files

