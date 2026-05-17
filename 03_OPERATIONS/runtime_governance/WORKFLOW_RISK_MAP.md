# Workflow Risk Map

LAST UPDATED: 2026-05-17

## Purpose

This document identifies governance-runtime risks where operational workflows can drift from canonical truth.

## Ownership

- Canonical owner: `03_OPERATIONS/runtime_governance/`
- Related blockers: `03_OPERATIONS/CURRENT_BLOCKERS.md`
- Related risk lineage: `05_DECISIONS/RISKS.md`
- Related audit lineage: `07_HISTORY/governance_audits/`

## Canonicality

This file is a runtime risk index. It does not replace accepted risks, blockers, or validation reports.

## Risk Classes

| Risk | Severity | Surface | Detection | Remediation |
| --- | --- | --- | --- | --- |
| Dirty repo interpreted as clean evidence | High | Control, NVIDIA, ABW | `git status --short` warning | Record dirty state in evidence; do not promote readiness |
| Stale handoff used as latest truth | High | Control recovery | Handoff age warning | Reconcile with current repo state before action |
| Forbidden readiness claim introduced | High | Docs, reports, UI text | Forbidden-claim scan | Rewrite as bounded claim or governance decision |
| Bridge read-only boundary blurred | High | NVIDIA to ABW bridge | Bridge contract and test scope review | Keep mutation out of reader path unless explicitly governed |
| Validation pass overgeneralized | High | Reports, roadmap, handoff | Evidence boundary review | State exact command, scope, and residual gaps |
| Recovery path broken by moved docs | Medium | Control docs | Broken reference scan | Repair links and recovery order |
| Duplicate operational mirrors diverge | Medium | Handoff/session files | Canonical ownership audit | Replace mirrors with references |
| Audit files become stale | Medium | Governance audits | Audit age warning | Rerun or append new audit context |
| Runtime warning mistaken for enforcement | Medium | Tool output | Runtime warning policy | Label tools as report-only unless blocking is real |
| ABW/NVIDIA local state differs from Control docs | Medium | Cross-repo operations | Local-first status snapshot | Update Control handoff or record discrepancy |

## Known Weak Points

- `03_OPERATIONS/HANDOFF.md` remains large because it preserves operational lineage.
- Machine-readable contracts exist, but enforcement is currently lightweight and report-only.
- NVIDIA runtime files have active local modifications that must not be overwritten by governance integration.
- ABW bridge assumptions must be verified locally before any readiness claim.

## Escalation Rules

- High-severity claim drift must be corrected before documentation is treated as canonical.
- Dirty repo warnings do not block work, but must be included in validation evidence.
- Missing canonical recovery files should stop governance interpretation until restored.
- Conflicting operational truth is resolved by canonical precedence, not by convenience.

## Do Not Duplicate

Do not copy this risk table into reports. Reference this file and append new runtime evidence where appropriate.
