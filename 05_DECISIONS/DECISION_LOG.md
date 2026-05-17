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

## D-2026-05-17-08: Record NVIDIA Review UI Clarity Fix As Evidence-Only

- Decision: Record NVIDIA commit `a867f892be94c350b9cabcfa168d19f82dc64995` as bounded UI clarity evidence only.
- Status: Accepted for operational recording.
- Commit:
  - `a867f892be94c350b9cabcfa168d19f82dc64995`
  - `fix: clarify ABW review state in UI`
- Evidence:
  - review actions no longer render as `[object Object]`
  - review summary distinguishes review items shown from trusted wiki promotion
  - UI copy explains drafts are not trusted wiki yet
  - UI copy explains trusted-source approval is not available in the UI yet
  - UI copy explains that no auto-promotion was performed
  - `git diff --check` PASS
  - `node --check tools/browser-smoke.mjs` PASS
  - `node --check tools/nvidia-server.mjs` PASS
  - `npm run abw:reader:test` PASS `108/108`
  - `npm run browser:smoke` PASS `149/149`
- Preserved boundary:
  - `/proxy/abw/promote` remains fail-closed
  - no ABW approve path is called from NVIDIA
  - no write-back/sync
  - no auto-promotion
  - no trust-gate weakening
- Non-claim:
  - This does not prove non-technical daily-use readiness.
  - This does not promote `DAILY_USE_READY`, production-ready, enterprise-ready, full bridge ready, autonomous-safe, packaging-ready, broad real-world validation, or Cognitive OS achieved.
- Follow-on blockers preserved:
  - no safe UI trusted-source approve contract yet
  - missing-source honesty still needs separate investigation

## D-2026-05-17-09: Record ABW Missing-Source Honesty Fix As Bounded Backend Evidence

- Decision: Record ABW commit `11fb4c6d36e0e18ba9a516a51674c3e88ce081e8` as the bounded backend fix for missing-source honesty and parser-honesty routing on the browser/proxy path.
- Status: Accepted for operational recording.
- Commit:
  - `11fb4c6d36e0e18ba9a516a51674c3e88ce081e8`
  - `fix: abstain on missing-source and parser-honesty controls`
- Root cause fixed:
  - missing-source control/spec text was treated as answer evidence
  - unsupported and malformed explicit file-reference queries could weak-fallback into unrelated raw/draft content
- Evidence:
  - ABW targeted regressions PASS `6 passed`
  - ABW retrieval-layer guard tests PASS `3 passed`
  - broader ABW abstention/domain/entity regressions PASS `5 passed`
  - NVIDIA `npm run abw:reader:test` PASS `108/108`
  - proxy verification on fresh synthetic workspace `D:\Sandbox\_real_user_pilot\abw_honesty_fix_proxy_20260517_154122`
  - missing-source => `ABW_CLI_NO_MATCH`, `no_match`, `E0_unknown`, trust `0`, `sources=[]`
  - unsupported file => `ABW_CLI_NO_MATCH`, `no_match`, `E0_unknown`, trust `0`, `sources=[]`
  - malformed file => `ABW_CLI_NO_MATCH`, `no_match`, `E0_unknown`, trust `0`, `sources=[]`
  - positive relevant raw/draft fallback preserved => `ABW_CLI_OK`, `raw_or_draft_only`, `E1_fallback`, trust `45`
  - ambiguous control remains weak/cautious `E1_fallback`
  - browser/proxy ask phase `.brain` mutation `no`
  - `query_deep_runs.jsonl` not created/changed
- Preserved caveat:
  - direct CLI JSON hardening regression remains unresolved on this machine due to pre-existing plain-text-vs-JSON behavior
  - this caveat is recorded, not hidden, and not treated as a pass
- Non-claim:
  - This does not promote `DAILY_USE_READY`, production-ready, enterprise-ready, full bridge ready, autonomous-safe, packaging-ready, broad real-world validation, or Cognitive OS achieved.
- Recommended next gate:
  - `RERUN_STRONG_MANIFEST_UI_PILOT_AFTER_HONESTY_FIX`

## D-2026-05-17-10: Record Strong Manifest UI Pilot After Honesty Fix As Warning Evidence

- Decision: Record the strong manifest browser UI rerun after ABW honesty fix as bounded warning evidence, not a clean pass and not a readiness promotion.
- Status: Accepted for operational recording.
- Result:
  - `WARNING_STRONG_MANIFEST_UI_PILOT_AFTER_HONESTY_FIX`
- Workspace:
  - `D:\Sandbox\_real_user_pilot\strong_manifest_after_honesty_fix_20260517_161115`
- Evidence:
  - browser UI used
  - fresh sanitized/synthetic workspace used
  - UI clarity remained good
  - missing-source abstained: `ABW_CLI_NO_MATCH`, `no_match`, `E0_unknown`, trust `0`, `sources=[]`
  - unsupported abstained: `ABW_CLI_NO_MATCH`, `no_match`, `E0_unknown`, trust `0`, `sources=[]`
  - malformed abstained: `ABW_CLI_NO_MATCH`, `no_match`, `E0_unknown`, trust `0`, `sources=[]`
  - ambiguous remained weak/cautious: `ABW_CLI_OK`, `raw_or_draft_only`, `E1_fallback`, trust `45`
  - positive factual/Vietnamese/procedure/troubleshooting remained weak: `ABW_CLI_OK`, `raw_or_draft_only`, `E1_fallback`, trust `45`
  - no query-time `.brain` mutation
  - no `query_deep_runs.jsonl`
  - no pending edits
  - no Apply
  - no sync/write-back
  - no auto-promotion
  - CONTROL/NVIDIA/ABW remained clean
- Product interpretation:
  - source honesty is materially improved for non-technical UX
  - positive answer usefulness remains weak
  - no safe non-tech UI trusted-source approve contract exists yet
  - manual CLI approval is not acceptable as non-tech daily-use UX
- Preserved caveat:
  - direct CLI JSON hardening caveat remains active
- Non-claim:
  - This does not promote `DAILY_USE_READY`, production-ready, enterprise-ready, full bridge ready, autonomous-safe, packaging-ready, broad real-world validation, or Cognitive OS achieved.
- Recommended next gate:
  - `DESIGN_SAFE_NON_TECH_UI_APPROVE_CONTRACT`

## D-2026-05-17-11: Record ABW Approve JSON Contract Stage 1 As Bounded Backend Evidence

- Decision: Record ABW commit `f6e6bdcd7aa2b76758611fb4c1587c2af5ba547f` as the bounded Stage 1 implementation of the safe single-draft approve JSON contract.
- Status: Accepted for operational recording.
- Commit:
  - `f6e6bdcd7aa2b76758611fb4c1587c2af5ba547f`
  - `feat: add safe approve draft JSON contract`
- Scope:
  - ABW-only
  - no NVIDIA edits
  - no CONTROL edits during implementation
  - no push
  - no readiness promotion
  - no UI wiring
- Contract features:
  - single-draft only
  - dry-run preview with no mutation
  - apply requires explicit confirmation token/text
  - stale draft hash guard
  - queue status validation
  - target wiki collision block
  - path traversal block
  - structured blocked responses
  - no fake success
  - API endpoint `/approve-draft`
  - CLI `--json approve` contract
  - manual CLI compatibility preserved
- Evidence:
  - `py -m pytest tests/test_abw_review.py tests/test_abw_api.py tests/test_abw_json_hardening.py -q` PASS `56 passed`
  - `py -m compileall src scripts tests/test_abw_review.py tests/test_abw_api.py tests/test_abw_json_hardening.py` PASS
  - missing-source/read-only targeted tests PASS `6 passed`
  - retrieval guard tests PASS `3 passed`
  - broader abstention/domain/entity regressions PASS `5 passed`
  - `git diff --check` PASS with LF/CRLF warnings only
  - NVIDIA compatibility check `npm run abw:reader:test` PASS `108/108`
- Preserved limitation:
  - NVIDIA approve bridge/server support is not implemented yet
  - non-tech UI approve flow is not implemented yet
  - `/proxy/abw/promote` remains fail-closed
  - this does not prove non-tech daily-use UX
- Non-claim:
  - This does not promote `DAILY_USE_READY`, production-ready, enterprise-ready, full bridge ready, autonomous-safe, packaging-ready, broad real-world validation, or Cognitive OS achieved.
- Recommended next gate:
  - `IMPLEMENT_NVIDIA_APPROVE_BRIDGE_STAGE_2`

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

