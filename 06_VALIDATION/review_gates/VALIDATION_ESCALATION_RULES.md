# Validation Escalation Rules

LAST UPDATED: 2026-05-17

## Purpose

Define when execution evidence requires stronger validation or governance escalation.

## Escalate To Human Review

- Dirty repo state is relevant to the result.
- Validation warning is known and unresolved.
- Test scope does not cover the claimed behavior.
- Real/private docs are involved.
- Mutation, promotion, trust, or git state is affected.
- Evidence would be used for readiness promotion.

## Escalate To Governance Decision

- New readiness label.
- New bridge mutation capability.
- New auto-promotion behavior.
- New CI blocking policy.
- Release/packaging claim.
- Change to source-of-truth hierarchy.

## Escalate To Blocker

- Existing recovery path is broken.
- Validation fails in the target scope.
- Safety boundary is bypassed.
- Runtime claims success without evidence.
- Read-only operation mutates state.

## Rerun Expectations

- Preserve original failure.
- State what changed.
- State exact rerun scope.
- Record pass/fail/warnings.
- Do not erase residual uncertainty.
