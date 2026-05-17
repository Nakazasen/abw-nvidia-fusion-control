# Uncertainty Surfacing Contract

LAST UPDATED: 2026-05-17

## Purpose

Require execution tooling and agents to surface uncertainty instead of converting it into confidence.

## Must Surface

- Dirty repo state.
- Stale handoff or stale audit state.
- Partial test coverage.
- Known warnings.
- Ambiguous workspace.
- Missing canonical docs.
- Missing before/after evidence.
- Unsupported files, parse errors, no-match results, weak evidence tiers.

## Must Not Convert To Certainty

- No warning -> safe.
- One pass -> readiness.
- No-match -> system failure.
- Draft generated -> trusted knowledge.
- Runtime status clean -> governance compliance.

## Escalation Threshold

If uncertainty affects mutation, promotion, trust, git state, or readiness interpretation, stop for human review.

## Output Pattern

Use bounded language:

- "observed"
- "not proven"
- "blocked"
- "warning"
- "requires review"
- "scope-limited"

Avoid:

- "guaranteed"
- "certified"
- "safe"
- "production-ready"
- "fully autonomous"
