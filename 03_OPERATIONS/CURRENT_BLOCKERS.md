# Current Blockers (As of 2026-05-17)

## Ownership

- Owner: Auditor + Governance Recorder
- Role: Active blocker dashboard for current local state

## SOURCE OF TRUTH

- Canonical persistent risks: `05_DECISIONS/RISKS.md`
- Canonical latest accepted operational context: `03_OPERATIONS/HANDOFF.md`

## DO NOT DUPLICATE

- Do not restate full historical evidence reports here.
- Keep blockers date-scoped and operationally actionable.

## Blockers Closed (Preserved Truth)

- Previous manual path blocker `MANUAL_PATH_REVALIDATION_V3_FAIL` is closed by accepted `MANUAL_PATH_REVALIDATION_V3_PASS`.
- Deterministic local-file workflow blocker for bounded path is interpreted as closed.

## Active Blockers / Gating Constraints

1. Readiness promotion blocker
- No evidence supports promotion beyond `BOUNDED_DAILY_USE_CANDIDATE_LOCAL_FILE_WORKFLOWS`.
- `DAILY_USE_READY` and production claims remain blocked.

2. Real-data validation blocker
- Existing accepted passes are bounded to synthetic/sanitized workflows.
- Broad private/work-document readiness remains blocked.

3. Bridge scope blocker
- Full bridge capabilities (write-back/sync/auto-promote/execute-command through ABW path) remain blocked by governance boundaries.

4. UI smoke residual warning blocker
- Browser smoke still carries a recurring non-blocking warning around inline edit widget observability.
- Latest accepted NVIDIA evidence still includes this warning:
  - `Inline edit widget opens from selection: widget not observable in current smoke state`
- This remains a residual confidence gap for UX completeness claims.
- It is warning-only and is not readiness proof.

5. Small sanitized pilot warning gate
- Small sanitized bridge/API pilot evidence is recorded as `WARNING_BOUNDED_SANITIZED_PILOT`.
- Safety boundaries passed:
  - no query-time `.brain` mutation
  - no pending edits after query
  - no NVIDIA Apply
  - no sync/write-back
  - no auto-promotion
  - missing-source returned `ABW_CLI_NO_MATCH`, `E0_unknown`, trust `0`, `sources=[]`
- Warning remains active:
  - unsupported/malformed ask returned `E1_fallback`, trust `45`, draft source, weak-evidence warnings
  - this is not a clean quality pass for that question
- UI evidence remains partial because full browser UI automation was not used.
- Next pilot movement should not be readiness promotion; current recommended gate is `RUN_UI_FULL_BROWSER_SANITIZED_PILOT`.

## Immediate Risk If Ignored

- Overclaim risk rises if bounded smoke evidence is treated as daily-use or production readiness.
- Pilot risk rises if warning/partial-UI evidence is treated as clean broad validation.

