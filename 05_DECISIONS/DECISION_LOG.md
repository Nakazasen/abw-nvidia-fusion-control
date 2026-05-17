# Decision Log (Derived From Local Governance + Repo Reality)

Date: 2026-05-17

## Ownership

- Owner: Governance Recorder
- Role: Derived working decision notes tied to local audit state

## SOURCE OF TRUTH

- Canonical accepted decisions: `05_DECISIONS/DECISIONS.md`

## DO NOT DUPLICATE

- Do not treat this file as authoritative for long-term accepted decisions.
- Promote accepted entries into `05_DECISIONS/DECISIONS.md` and keep this as supporting context.

## D-2026-05-17-01: Keep Local-First Truth Order

- Decision: Governance and architecture state must be inferred from local repos before remote comparison.
- Status: Accepted and applied in this audit.
- Evidence:
  - All three repos inspected for status/HEAD/commit history.
  - NVIDIA local dirty sprint state detected despite matching remote commit hash.

## D-2026-05-17-02: Preserve Current Readiness Label Without Promotion

- Decision: Keep readiness at `BOUNDED_DAILY_USE_CANDIDATE_LOCAL_FILE_WORKFLOWS`.
- Status: Accepted.
- Rationale:
  - Existing milestones are bounded and non-production by explicit governance language.
  - No new broad real-data evidence was added in this audit.

## D-2026-05-17-03: Treat NVIDIA Local Uncommitted Work as In-Progress

- Decision: Record NVIDIA uncommitted UI/server/test deltas as active sprint state until audited, tested, split-committed, and governance-recorded.
- Status: Superseded by `D-2026-05-17-05`.
- Evidence:
  - `docs/abw-non-tech-ui-quickstart.md`
  - `nvidia_playground.html`
  - `tools/abw-cli-reader.mjs`
  - `tools/browser-smoke.mjs`
  - `tools/nvidia-server.mjs`
  - `tests/abw-cli-reader-bridge.test.mjs`
  - `tests/fixtures/mock-abw-cli.mjs`

## D-2026-05-17-04: Keep Bridge Boundary Conservative

- Decision: Maintain read-only ABW ask boundary and trust-gated ingest boundary as current safe operating line.
- Status: Accepted.
- Rationale:
  - Governance posture and local code trajectory both emphasize mutation safety, trust gates, and honest no-match behavior.

## D-2026-05-17-05: Accept NVIDIA Bounded Workflow Evidence Without Readiness Promotion

- Decision: Accept the NVIDIA split-commit evidence ending at `0e760ac3d842299b0514df1da97d436e7c7be925` as bounded local regression/smoke evidence only.
- Status: Accepted.
- Accepted commits:
  - `aa2a105` `fix: harden ABW bridge JSON handling`
  - `3f968dd` `test: cover bounded ABW bridge edge cases`
  - `79c8750` `test: expand browser smoke ABW workflow coverage`
  - `e7af952` `feat: refine ABW document assistant workflow`
  - `0e760ac` `docs: document bounded ABW UI workflow`
- Evidence:
  - `npm run abw:reader:test` PASS `108/108`
  - `npm run browser:smoke` PASS `145/145`
  - guard matrix PASS `16/16`
  - verdict `HARDENING_BASELINE_PASS_NOT_DAILY_USE_READY`
- Warning retained:
  - inline edit widget not observable in current smoke state
  - warning-only, not readiness proof
- Preserved boundaries:
  - read-only ABW ask/query
  - trust-gated ingest/review
  - promote fail-closed
  - no write-back/sync
  - no auto-promotion
  - no silent mutation
- Non-claim:
  - This does not promote `DAILY_USE_READY`, production-ready, enterprise-ready, full bridge ready, autonomous-safe, packaging-ready, broad real-world validation, or Cognitive OS achieved.

## D-2026-05-17-07: Record ABW Read-Only Fix and UI Rerun As Warning Evidence

- Decision: Accept ABW commit `c877051ef303e99b77d92315a402415d5512997d` as the fix for read-only `query_deep_runs.jsonl` mutation, and record the full browser UI sanitized rerun as warning evidence.
- Status: Accepted for operational recording.
- Result:
  - `WARNING_UI_BOUNDED_SANITIZED_RERUN_AFTER_ABW_FIX`
- Evidence:
  - direct CLI read-only ask no longer mutates `.brain`
  - NVIDIA bridge read-only ask no longer mutates `.brain`
  - `query_deep_runs.jsonl=false`
  - `runtimeWriteSuppressed=true`
  - `deepRunLogSuppressed=true`
  - ABW tests PASS `99 passed`
  - ABW broader targeted tests PASS `118 passed, 2 warnings, 7 subtests passed`
  - NVIDIA bridge test PASS `108/108`
  - full browser UI rerun used fresh sanitized workspace `D:\Sandbox\_real_user_pilot\ui_sanitized_rerun_after_abw_fix_20260517_131612`
  - UI ingest `ingested=3`, `skipped=2`, `generated_drafts=3`, `review_required=true`, `promotion_performed=false`
  - query-time `.brain` stayed `10 -> 10`; changed files `[]`
  - `query_deep_runs.jsonl` not created/changed
- Warning retained:
  - Vietnamese no-match
  - procedure/troubleshooting no-match on fresh workspace
  - some answers remain `E1_fallback`, trust `45`
- Non-claim:
  - This does not promote `DAILY_USE_READY`, production-ready, enterprise-ready, full bridge ready, autonomous-safe, packaging-ready, broad real-world validation, or Cognitive OS achieved.

## D-2026-05-17-06: Record Small Sanitized Pilot As Warning Evidence

- Decision: Record `WARNING_BOUNDED_SANITIZED_PILOT` as bounded sanitized bridge/API pilot evidence only.
- Status: Accepted for operational recording.
- Evidence:
  - sanitized/synthetic pilot workspace `D:\Sandbox\_real_user_pilot\small_sanitized_run_20260517_110628`
  - NVIDIA bridge/API fallback path used
  - full browser UI automation was not used, so UI evidence is partial
  - ingest `ingested=3`, `skipped=2`, `generated_drafts=3`, `review_required=true`, `promotion_performed=false`
  - unsupported file and malformed DOCX were reported honestly
  - missing-source returned `ABW_CLI_NO_MATCH`, `E0_unknown`, trust `0`, `sources=[]`
  - query-time `.brain` signature unchanged
  - no pending edits after query, no Apply, no sync/write-back, no auto-promotion
- Warning retained:
  - unsupported/malformed ask returned `E1_fallback`, trust `45`, draft source, weak-evidence warnings
  - this is not a clean quality pass for that question
- Non-claim:
  - This does not promote `DAILY_USE_READY`, production-ready, enterprise-ready, full bridge ready, autonomous-safe, packaging-ready, broad real-world validation, or Cognitive OS achieved.

