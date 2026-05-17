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

## D-2026-05-17-12: Record NVIDIA Approve Bridge Stage 2 As Bounded Bridge Infrastructure

- Decision: Record NVIDIA commit `de7c907147de4a4938738e137e3264defe52426e` as the bounded Stage 2 implementation of NVIDIA approve bridge/server support for the ABW approve JSON contract.
- Status: Accepted for operational recording.
- Commit:
  - `de7c907147de4a4938738e137e3264defe52426e`
  - `feat: add bounded ABW approve bridge support`
- Scope:
  - NVIDIA-only
  - no CONTROL edits during implementation
  - no ABW edits during implementation
  - no push
  - no readiness promotion
  - no final non-tech UI approve flow
- Recorded capability:
  - bounded approve command support in `tools/abw-cli-reader.mjs`
  - explicit `POST /proxy/abw/approve-draft`
  - dry-run preview mapping
  - apply approved mapping
  - structured blocked approve mapping
  - trust and active-workspace guards
  - batch/array reject
  - wildcard reject
  - missing confirmation reject
  - invalid ABW JSON fail-closed
  - ask/Q&A remains available without approve
  - ask path does not trigger approve
- Preserved boundary:
  - `/proxy/abw/promote` remains fail-closed
  - this is infrastructure only
  - this is not non-tech daily-use approve UX
  - this is not bulk approval
  - this is not corpus approval
  - approval is not required before Q&A
  - non-tech Review/Triage UX is still required before friendly daily approval UX
- Evidence:
  - `git diff --check` PASS with LF/CRLF warnings only
  - `node --check tools/abw-cli-reader.mjs` PASS
  - `node --check tools/nvidia-server.mjs` PASS
  - `node --check tests/abw-cli-reader-bridge.test.mjs` PASS
  - `npm run abw:reader:test` PASS `162 passed, 0 failed`
  - `npm run browser:smoke` PASS `149 passed, 0 failed`
  - warning retained:
    - `Inline edit widget opens from selection: widget not observable in current smoke state`
  - browser smoke verdict retained:
    - `HARDENING_BASELINE_PASS_NOT_DAILY_USE_READY`
- Non-claim:
  - This does not promote `DAILY_USE_READY`, production-ready, enterprise-ready, full bridge ready, autonomous-safe, packaging-ready, broad real-world validation, or Cognitive OS achieved.
- Recommended next gate:
  - `DESIGN_NON_TECH_REVIEW_TRIAGE_FLOW`

## D-2026-05-17-13: Record Non-Tech Review/Triage UX Design As Design Evidence Only

- Decision: Record the non-tech Review/Triage UX design as bounded governance/design evidence only, and use it to guide staged UI implementation without implying shipped UX.
- Status: Accepted for operational recording.
- Scope:
  - CONTROL-only record
  - no NVIDIA edits during design
  - no ABW edits during design
  - no push
  - no readiness promotion
  - no implementation claim
- Product problem recorded:
  - non-technical users may ingest many documents/pages
  - they cannot read or approve everything manually
  - approval must not mean whole-corpus validation
  - approval should mean trusting one specific previewed item
  - Q&A must remain available before approval
- UX principles recorded:
  - ask first
  - trust gradually
  - approve selected knowledge items only
  - never require approval before Q&A
  - never imply whole-corpus validation
  - reduce workload by surfacing candidates rather than forcing blanket review
- Design direction recorded:
  - user-facing states for readable, weak, candidate, trusted, unsupported, parse-error, missing-source, and ambiguous paths
  - triage dashboard groups by user action, not by file path
  - Q&A-integrated review flow: ask -> inspect source -> optionally review selected item
  - approval candidates are suggestions only
  - safe approve entry points are limited to single-item preview contexts
  - forbidden approve entry points include bulk/corpus/unsupported/parse-error/missing-source/ambiguous/unpreviewed paths
  - Stage B is read-only triage dashboard only
- Preserved boundary:
  - this does not implement review/triage UI
  - this does not implement approve UI
  - this does not create bulk approval or corpus approval
  - this does not make approval required before Q&A
  - this does not promote `DAILY_USE_READY`, production-ready, enterprise-ready, full bridge ready, autonomous-safe, packaging-ready, broad real-world validation, or Cognitive OS achieved
- Recommended next gate:
  - `IMPLEMENT_READ_ONLY_TRIAGE_DASHBOARD_STAGE_B`

## D-2026-05-17-14: Record NVIDIA Read-Only Triage Dashboard Stage B As Bounded UI Evidence

- Decision: Record NVIDIA commit `395160cacbdf6464618cf6569dad78ff42596a2d` as the bounded Stage B implementation of the read-only ABW triage dashboard.
- Status: Accepted for operational recording.
- Commit:
  - `395160cacbdf6464618cf6569dad78ff42596a2d`
  - `feat: add read-only ABW triage dashboard`
- Scope:
  - NVIDIA-only
  - no CONTROL edits during implementation
  - no ABW edits during implementation
  - no push
  - no readiness promotion
  - read-only triage dashboard only
- Recorded capability:
  - read-only triage dashboard in `nvidia_playground.html`
  - browser smoke coverage in `tools/browser-smoke.mjs`
  - groups:
    - `Ready to ask, not trusted yet`
    - `Good candidates to review`
    - `Needs attention`
    - `Could not read`
    - `Already trusted`
    - `Recently used in answers`
  - honest empty states for unreadable/unpopulated states
  - copy explaining Q&A works before review and drafts are not trusted yet
  - unsupported and parse-error content shown under `Could not read`
  - trusted group does not confuse review items with trusted wiki
  - candidate group excludes missing-source and ambiguous cases
- Preserved boundary:
  - this is read-only only
  - no approve UI exists yet
  - no approve dry-run product UI exists yet
  - no approve apply UI exists yet
  - no approve-all
  - no batch or corpus approval
  - no hidden trust mutation
  - `/proxy/abw/promote` remains fail-closed
  - `/proxy/abw/approve-draft` remains infrastructure only
  - Q&A remains available without approval
  - this does not prove non-technical daily-use readiness
- Evidence:
  - `git diff --check` PASS with LF/CRLF warnings only
  - `node --check tools/browser-smoke.mjs` PASS
  - `node --check tools/nvidia-server.mjs` PASS
  - `node --check tools/abw-cli-reader.mjs` PASS
  - `npm run abw:reader:test` PASS `162 passed, 0 failed`
  - `npm run browser:smoke` PASS `159 passed, 0 failed`
  - warning retained:
    - `Inline edit widget opens from selection: widget not observable in current smoke state`
  - browser smoke verdict retained:
    - `HARDENING_BASELINE_PASS_NOT_DAILY_USE_READY`
- Non-claim:
  - This does not promote `DAILY_USE_READY`, production-ready, enterprise-ready, full bridge ready, autonomous-safe, packaging-ready, broad real-world validation, or Cognitive OS achieved.
- Recommended next gate:
  - `IMPLEMENT_QA_INTEGRATED_CANDIDATE_SURFACING_STAGE_C`

## D-2026-05-17-15: Record NVIDIA Q&A-Integrated Candidate Surfacing Stage C As Bounded UI Evidence

- Decision: Record NVIDIA commit `308bdd5fb0bca9237087132b598418092f7ddc95` as the bounded Stage C implementation of Q&A-integrated ABW review candidate surfacing.
- Status: Accepted for operational recording.
- Commit:
  - `308bdd5fb0bca9237087132b598418092f7ddc95`
  - `feat: surface ABW review candidates from Q&A`
- Scope:
  - NVIDIA-only
  - no CONTROL edits during implementation
  - no ABW edits during implementation
  - no push
  - no readiness promotion
  - read-only candidate surfacing only
- Recorded capability:
  - candidate suggestion UI on eligible weak answer cards
  - local session-only candidate state
  - `Mark as candidate` action
  - `Remove candidate` action
  - candidate rendering inside `Good candidates to review`
  - missing-source no-review message
  - unsupported/parse-error non-candidate message
  - ambiguous clarification message
- Candidate boundary:
  - candidate appears only when the answer is weak, sourceful, draft/raw based, not missing-source, not unsupported/parse-error, not ambiguous, and useful enough to show a real answer body
  - candidate is not trusted
  - candidate is not approved
  - no approval happens in this flow
- Preserved boundary:
  - no approve UI exists yet
  - no approve dry-run product UI exists yet
  - no approve apply UI exists yet
  - no approval endpoint is called from the Stage C UI flow
  - no approve-all
  - no batch or corpus approval
  - `/proxy/abw/promote` remains fail-closed
  - Q&A remains available without approval
  - this does not prove non-technical daily-use readiness
- Evidence:
  - `git diff --check` PASS with LF/CRLF warnings only
  - `node --check tools/browser-smoke.mjs` PASS
  - `node --check tools/nvidia-server.mjs` PASS
  - `node --check tools/abw-cli-reader.mjs` PASS
  - `npm run abw:reader:test` PASS `162 passed, 0 failed`
  - `npm run browser:smoke` PASS `165 passed, 0 failed`
  - warning retained:
    - `Inline edit widget opens from selection: widget not observable in current smoke state`
  - browser smoke verdict retained:
    - `HARDENING_BASELINE_PASS_NOT_DAILY_USE_READY`
  - explicit smoke outcomes retained:
    - weak sourceful answer can become candidate
    - candidate appears in `Good candidates to review`
    - candidate is not trusted
    - missing-source does not show candidate
    - unsupported/parse-error does not show candidate
    - ambiguous asks for clarification instead of candidate action
    - candidate action does not call `/proxy/abw/approve-draft`
    - candidate action does not call `/proxy/abw/promote`
- Non-claim:
  - This does not promote `DAILY_USE_READY`, production-ready, enterprise-ready, full bridge ready, autonomous-safe, packaging-ready, broad real-world validation, or Cognitive OS achieved.
- Recommended next gate:
  - `IMPLEMENT_PREVIEW_ONLY_APPROVE_DRY_RUN_STAGE_D`

## D-2026-05-17-16: Record NVIDIA Preview-Only Approve Dry-Run Stage D As Bounded UI Evidence

- Decision: Record NVIDIA commit `2e44f4928af8fd362fabdd03138896491b18401a` as the bounded Stage D implementation of preview-only approve dry-run UI.
- Status: Accepted for operational recording.
- Commit:
  - `2e44f4928af8fd362fabdd03138896491b18401a`
  - `feat: add preview-only ABW approve dry-run UI`
- Scope:
  - NVIDIA-only
  - no CONTROL edits during implementation
  - no ABW edits during implementation
  - no push
  - no readiness promotion
  - preview-only dry-run UI only
- Recorded capability:
  - preview-only dry-run state in `nvidia_playground.html`
  - preview request helper
  - preview panel
  - Preview review entry points
  - explicit `/proxy/abw/approve-draft` preview path from the UI
  - UI sends `dry_run=true` only
  - no confirm payload is sent from the UI in Stage D
  - preview panel shows draft path, current `Not trusted yet` state, target trusted path if returned, preview summary, warnings, blocking errors, and future confirmation token/text only
- Preserved boundary:
  - preview is not approval
  - candidate remains not trusted yet
  - no apply UI exists yet
  - `dry_run=false` is never sent from the UI
  - no approve-all
  - no batch or corpus approval
  - missing-source cannot preview
  - unsupported/parse-error cannot preview
  - ambiguous without clear source cannot preview
  - `/proxy/abw/promote` remains fail-closed
  - Q&A remains available without approval
  - this does not prove non-technical daily-use readiness
- Evidence:
  - `git diff --check` PASS with LF/CRLF warnings only
  - `node --check tools/browser-smoke.mjs` PASS
  - `node --check tools/nvidia-server.mjs` PASS
  - `node --check tools/abw-cli-reader.mjs` PASS
  - `npm run abw:reader:test` PASS `162 passed, 0 failed`
  - `npm run browser:smoke` PASS
  - warning retained:
    - `Inline edit widget opens from selection: widget not observable in current smoke state`
  - browser smoke verdict retained:
    - `HARDENING_BASELINE_PASS_NOT_DAILY_USE_READY`
  - explicit smoke outcomes retained:
    - preview calls `dry_run=true`
    - `dry_run=false` is never sent
    - preview panel renders
    - blocked preview is shown honestly
    - candidate remains `Not trusted yet`
    - no apply UI
    - weak sourceful answer can be previewed after candidate marking
    - missing-source does not show preview/candidate action
    - unsupported/parse-error do not show preview/candidate action
    - ambiguous without clear source does not show preview action
    - preview does not call `/proxy/abw/promote`
- Non-claim:
  - This does not promote `DAILY_USE_READY`, production-ready, enterprise-ready, full bridge ready, autonomous-safe, packaging-ready, broad real-world validation, or Cognitive OS achieved.
- Recommended next gate:
  - `IMPLEMENT_SINGLE_ITEM_APPROVE_APPLY_STAGE_E`

## D-2026-05-17-17: Record NVIDIA Single-Item Approve Apply Stage E As Bounded UI Evidence

- Decision: Record NVIDIA commit `2332a965429b5e4af29c36062a568d46fbae4123` as the bounded Stage E implementation of single-item approve apply UI.
- Status: Accepted for operational recording.
- Commit:
  - `2332a965429b5e4af29c36062a568d46fbae4123`
  - `feat: add single-item ABW approve apply UI`
- Scope:
  - NVIDIA-only
  - no CONTROL edits during implementation
  - no ABW edits during implementation
  - no push
  - no readiness promotion
  - single-item approve apply UI only
- Recorded capability:
  - single-item approve apply flow in `nvidia_playground.html`
  - approval eligibility checks
  - explicit confirmation UI
  - approved-source local state
  - honest success and blocked rendering
  - Stage E smoke coverage in `tools/browser-smoke.mjs`
- Apply boundary:
  - approval applies to exactly one selected, previewed source
  - approval is not folder approval
  - approval is not workspace approval
  - approval is not corpus approval
  - no approve-all
  - no batch approval
  - Q&A remains available without approval
  - apply requires successful preview first
  - apply requires explicit confirmation token/text
  - `dry_run=false` is only sent from the explicit confirmation path
  - blocked apply keeps the candidate not trusted
  - success marks exactly one source trusted
  - missing-source cannot approve
  - unsupported/parse-error cannot approve
  - ambiguous without clear source cannot approve
  - `/proxy/abw/promote` remains fail-closed and unused
- Evidence:
  - `git diff --check` PASS with LF/CRLF warnings only
  - `node --check tools/browser-smoke.mjs` PASS
  - `node --check tools/nvidia-server.mjs` PASS
  - `node --check tools/abw-cli-reader.mjs` PASS
  - `npm run abw:reader:test` PASS `162 passed, 0 failed`
  - `npm run browser:smoke` PASS
  - warning retained:
    - `Inline edit widget opens from selection: widget not observable in current smoke state`
  - browser smoke verdict retained:
    - `HARDENING_BASELINE_PASS_NOT_DAILY_USE_READY`
  - explicit smoke outcomes retained:
    - apply unavailable before preview
    - preview still uses `dry_run=true`
    - apply enables only after explicit confirmation
    - apply sends `dry_run=false` only after confirmation
    - apply includes expected hash, queue status, and confirmation token/text
    - success marks exactly one source trusted
    - blocked apply is shown honestly
    - blocked apply keeps candidate untrusted
    - missing-source cannot approve
    - unsupported/parse-error cannot approve
    - ambiguous without clear source cannot approve
    - no approve-all, batch, or corpus wording
    - no `/proxy/abw/promote` call
- Non-claim:
  - This does not promote `DAILY_USE_READY`, production-ready, enterprise-ready, full bridge ready, autonomous-safe, packaging-ready, broad real-world validation, or Cognitive OS achieved.
- Recommended next gate:
  - `RERUN_BOUNDED_NON_TECH_APPROVE_UI_PILOT`

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

