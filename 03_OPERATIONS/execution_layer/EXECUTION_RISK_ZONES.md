# Execution Risk Zones

LAST UPDATED: 2026-05-17

## Purpose

Identify zones where execution can create false confidence, data mutation, or governance drift.

## Ownership

- Canonical owner: `03_OPERATIONS/execution_layer/`
- Related blockers: `03_OPERATIONS/CURRENT_BLOCKERS.md`

## High-Risk Zones

| Zone | Risk | Boundary |
| --- | --- | --- |
| ABW promotion | Drafts become trusted knowledge too early | Human review required; no auto-promote |
| NVIDIA Apply | Pending edit becomes disk mutation | Review + Apply evidence required |
| Git discard/reset | User work can be lost | Forbidden without explicit approval |
| Real/private docs | Privacy and overgeneralized validation | Requires explicit data policy and pilot scope |
| Readiness labels | Bounded pass becomes broad claim | Governance decision required |
| Bridge expansion | Read-only bridge becomes write-back/sync | Explicit architecture decision required |
| Shell execution | Local state can change unpredictably | Trust, command evidence, and scope required |
| Legacy ABW sync/promote surfaces | Older commands may bypass current intent | Treat as human-review-required or forbidden-autonomy |

## Medium-Risk Zones

- Smoke tests with temp artifacts.
- Ingest report generation.
- Workspace switch/trust UI.
- Runtime logs containing only partial evidence.
- Dirty repo validation.

## Low-Risk Zones

- Reading governance docs.
- Running report-only status tools.
- Parsing machine-readable contracts.
- Running read-only status endpoints.

## Fake Progress Patterns

- "Executed" without command/result evidence.
- "Reviewed" without recording what was reviewed.
- "Promoted" when promote endpoint failed closed.
- "Safe" because no warning appeared.
- "Ready" because tests passed.

## Escalation

When risk class is unclear, classify upward. Bounded-risk becomes human-review-required; human-review-required becomes stop-and-ask.
