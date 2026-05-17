# Governance Principles (Local-Derived)

Date: 2026-05-17

## Core Principles

- Local repositories are primary truth; remotes are synchronization references.
- Evidence beats narrative. Claims require reproducible artifacts, tests, and commit context.
- Governance set must stay consistent: `05_DECISIONS/ROADMAP.md`, `05_DECISIONS/DECISIONS.md`, `05_DECISIONS/RISKS.md`, `03_OPERATIONS/HANDOFF.md`, `07_HISTORY/INTEGRATION_JOURNAL.md`.
- Bounded passes must remain bounded in wording and interpretation.
- If evidence is weaker than claim, downgrade claim.

## Readiness and Claim Discipline

- Current accepted readiness label: `BOUNDED_DAILY_USE_CANDIDATE_LOCAL_FILE_WORKFLOWS`.
- Forbidden without explicit governance promotion:
  - `DAILY_USE_READY`
  - production-ready
  - full bridge ready
  - Cognitive OS achieved
  - enterprise-grade security
  - packaging-ready
  - VS Code parity
  - Cursor parity

## Mutation and Trust Principles

- Never fake success.
- Never bypass review/apply boundaries.
- Never bypass workspace trust.
- Never silently discard or reset dirty work.
- Keep Control/NVIDIA/ABW boundaries explicit in every sprint close.
- Prefer regression/audit before feature expansion.

## Role Discipline

- Architect defines scope/boundaries, does not overclaim.
- Builder makes minimal scoped change and records exact pass/fail evidence.
- Auditor verifies claims vs code/tests/docs and blocks overclaim.
- Governance Recorder updates cross-file governance truth without silent promotion.

## Operational Sequence (Recovery / Close)

1. Verify repo path.
2. Check git status.
3. Check HEAD.
4. Compare against latest accepted governance state.
5. Read `03_OPERATIONS/HANDOFF.md` first, then `05_DECISIONS/DECISIONS.md` and `05_DECISIONS/RISKS.md`.
6. Inspect implementation repos only after governance context is reconstructed.


