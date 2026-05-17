# Runtime Decision Boundary

LAST UPDATED: 2026-05-17

## Purpose

Define what runtime tooling may decide versus what requires governance or human review.

## Runtime May Decide

- Whether a required local file is present.
- Whether JSON parses.
- Whether git status is dirty.
- Whether a configured command exited nonzero.
- Whether a known warning pattern appeared.
- Whether a workspace path appears outside the active workspace.

## Runtime May Recommend

- Rerun tests.
- Inspect blockers.
- Review handoff.
- Use dry-run first.
- Escalate to human review.

## Runtime Must Not Decide

- Readiness promotion.
- Production suitability.
- Whether private data is acceptable.
- Whether failed evidence can be erased.
- Whether ABW drafts can be trusted without review.
- Whether sync/write-back is approved.

## Governance Decision Required

- New readiness label.
- Bridge mutation expansion.
- Auto-promotion behavior.
- CI hard-blocking based on governance status.
- Release or packaging claims.

## Non-Goal

This boundary does not create autonomous policy enforcement.
