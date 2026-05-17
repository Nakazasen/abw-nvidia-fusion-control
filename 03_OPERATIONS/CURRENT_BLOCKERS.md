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

5. Sanitized full UI rerun warning gate
- ABW read-only `query_deep_runs.jsonl` mutation blocker is closed by ABW commit `c877051ef303e99b77d92315a402415d5512997d`.
- Full browser UI sanitized rerun after the ABW fix is recorded as `WARNING_UI_BOUNDED_SANITIZED_RERUN_AFTER_ABW_FIX`.
- Safety boundaries passed:
  - no query-time `.brain` mutation
  - `.brain` count stayed `10 -> 10`
  - `query_deep_runs.jsonl` was not created/changed
  - no pending edits after query
  - no NVIDIA Apply
  - no sync/write-back
  - no auto-promotion
  - CONTROL/NVIDIA/ABW remained clean
- UI clarity passed:
  - unsupported/parse-error rows readable
  - weak/fallback warning visible
  - missing-source visible
  - no readiness overclaim visible
- Remaining warning remains active:
  - Vietnamese no-match
  - procedure/troubleshooting no-match on fresh workspace
  - some answers are `E1_fallback`, trust `45`
  - this is not a clean answer-quality or retrieval-coverage pass
- Next movement should not be readiness promotion; current recommended gate is `INVESTIGATE_BACKEND_RETRIEVAL_OR_VIETNAMESE_COVERAGE`.

## Immediate Risk If Ignored

- Overclaim risk rises if bounded smoke evidence is treated as daily-use or production readiness.
- Pilot risk rises if warning evidence is treated as clean broad validation.

