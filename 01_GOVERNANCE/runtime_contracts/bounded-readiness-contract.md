# Bounded Readiness Contract

LAST UPDATED: 2026-05-17

## Purpose

Preserve bounded-readiness discipline when runtime tooling, validation, or documentation reports progress.

## Ownership

- Canonical owner: `01_GOVERNANCE/runtime_contracts/`
- Non-claims source: `00_SYSTEM/NON_CLAIMS.md`
- Roadmap intent: `05_DECISIONS/ROADMAP.md`
- Current state: `05_DECISIONS/ROADMAP_STATE.md`

## Current Boundary

The accepted posture remains bounded local-file workflow maturity only where evidence supports it. This contract does not promote the project to daily-use ready or production ready.

## Forbidden Promotions Without Governance Decision

- `DAILY_USE_READY`
- Production-ready
- Full bridge ready
- Cognitive OS achieved
- Enterprise-grade security
- Packaging-ready
- VS Code parity
- Cursor parity
- Autonomous governance
- Self-healing governance

## Runtime Output Rules

Runtime output may say:

- "warning"
- "advisory"
- "missing"
- "stale"
- "present"
- "dirty working tree"
- "manual review required"

Runtime output must not say:

- "certified"
- "safe"
- "compliant"
- "ready for production"
- "fully governed"
- "autonomously enforced"

## Readiness Change Requirements

Any readiness promotion requires:

- Local-first repo audit.
- Validation evidence.
- Blocker review.
- Decision log entry.
- Handoff update.
- Explicit non-claims preservation.

## Anti-Pattern Examples

- Renaming a bounded candidate as ready because blockers decreased.
- Treating governance docs as implementation evidence.
- Treating one successful manual rerun as broad workflow readiness.
- Hiding uncertainty to make the repo appear stable.
