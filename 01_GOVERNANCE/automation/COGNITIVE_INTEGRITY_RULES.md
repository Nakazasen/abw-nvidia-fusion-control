# COGNITIVE_INTEGRITY_RULES

## Purpose

Define machine-checkable principles for keeping the repository recoverable and honest.

## Scope

- Documentation truth, validation evidence, and recovery graph.

## Enforcement Philosophy

- Protect cognition before optimizing layout.
- Preserve uncertainty.
- Make bounded claims explicit.

## Detection Rules

- Every readiness claim must include scope or be listed as a non-claim.
- Every validation artifact must preserve residual limits.
- Every recovery entrypoint must eventually route to `03_OPERATIONS/HANDOFF.md`.
- Every machine-readable contract must avoid claiming runtime enforcement unless it exists.

## Escalation Rules

- Critical: fake readiness or missing recovery path.
- High: validation artifact loses residual-risk section.
- Medium: ambiguous canonicality.
- Low: wording drift.

## Non-Goals

- No guarantee of anti-hallucination.
- No claim of autonomous safety.
- No production-grade governance claim.

## Anti-Pattern Examples

- "All tests pass, therefore daily-use ready."
- "Rerun passed, so delete the fail report."
- "CI plan exists, so governance is enforced."

## Future Automation Hooks

- Keyword scanner for unqualified forbidden claims.
- Recovery graph traversal checker.

