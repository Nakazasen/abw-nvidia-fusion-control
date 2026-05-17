# Context Collapse Protocol

LAST UPDATED: 2026-05-17

## Purpose

This protocol defines deterministic recovery when chat memory, agent context, local assumptions, or operational state are incomplete.

## Ownership

- Canonical owner: `04_RECOVERY/`
- Related recovery entrypoint: `START_HERE.md`
- Related recovery protocol: `04_RECOVERY/RECOVERY_PROTOCOL.md`
- Operational truth: `03_OPERATIONS/HANDOFF.md`

## Canonicality

This file is canonical for context-collapse scenarios. It does not replace normal recovery order; it hardens it for partial memory loss and conflicting state.

## If Context Is Lost

Read in this exact order:

1. `START_HERE.md`
2. `REPO_MAP.md`
3. `00_SYSTEM/PROJECT_PHILOSOPHY.md`
4. `01_GOVERNANCE/GOVERNANCE_MAP.md`
5. `04_RECOVERY/RECOVERY_PROTOCOL.md`
6. `03_OPERATIONS/HANDOFF.md`
7. `03_OPERATIONS/CURRENT_BLOCKERS.md`
8. `01_GOVERNANCE/contracts/repo-truth-hierarchy.json`
9. `01_GOVERNANCE/contracts/canonical-docs.json`
10. `03_OPERATIONS/runtime_governance/WORKFLOW_RISK_MAP.md`

Do not start from random open editor tabs.

## Partial Memory Loss Recovery

1. Verify current repo path.
2. Run `git status --short` in Control, NVIDIA, and ABW.
3. Run `tools/governance/runtime-status.ps1` from Control.
4. Compare operational truth against `03_OPERATIONS/HANDOFF.md`.
5. Compare blockers against `03_OPERATIONS/CURRENT_BLOCKERS.md`.
6. Treat uncommitted local files as primary evidence until audited.

## Repo Drift Recovery

If local and remote disagree:

1. Prefer local repo state as primary truth.
2. Record remote divergence as synchronization context, not governance truth.
3. Do not overwrite local dirty work.
4. Do not claim remote reflects latest cognition.
5. Reconcile through explicit audit and decision log entry.

## Stale Operational State Recovery

If `03_OPERATIONS/HANDOFF.md` appears stale:

1. Do not silently replace it with roadmap statements.
2. Inspect recent commits and dirty working trees.
3. Inspect `03_OPERATIONS/SESSION_CLOSE.md`, `03_OPERATIONS/NEXT.md`, and current blockers.
4. Append a reconciliation note rather than erasing lineage.
5. Preserve uncertainty if evidence is incomplete.

## New AI Agent Onboarding

The AI agent must:

- Follow the canonical read order.
- Preserve bounded-readiness language.
- Avoid production-readiness claims.
- Inspect local repos before remote mirrors.
- Treat governance scripts as report-only unless a real blocking mechanism exists.
- Record evidence boundaries when reporting validation.

## Human Contributor Onboarding

The human contributor should:

- Start at `START_HERE.md`.
- Use `REPO_MAP.md` to understand filesystem cognition layers.
- Use `03_OPERATIONS/HANDOFF.md` for current state.
- Use `05_DECISIONS/ROADMAP.md` for intent, not current readiness.
- Use `06_VALIDATION/` for evidence, not marketing claims.

## Conflicting Handoff Recovery

Canonical precedence:

1. Local file evidence and git status.
2. `03_OPERATIONS/HANDOFF.md` for operational truth.
3. `03_OPERATIONS/CURRENT_BLOCKERS.md` for active blockers.
4. `05_DECISIONS/DECISION_LOG.md` and `05_DECISIONS/DECISIONS.md` for accepted decisions.
5. `06_VALIDATION/` for scoped evidence.
6. `05_DECISIONS/ROADMAP.md` for intent only.
7. Remote mirrors only after local state is understood.

## Non-Claims

This protocol does not provide autonomous recovery, self-healing governance, complete hallucination prevention, or production-grade continuity. It provides deterministic routing and bounded evidence expectations.
