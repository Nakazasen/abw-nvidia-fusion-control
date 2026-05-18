# Current Blockers (As of 2026-05-19)

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
- The next executable gate is limited to low-risk/non-sensitive rehearsal documents only.
- No rehearsal should start until the user confirms the selected document set is non-sensitive.

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
- Next movement should not be readiness promotion; this warning lineage is preserved, but the immediate follow-up is now `RERUN_STRONG_MANIFEST_UI_PILOT_AFTER_HONESTY_FIX`.

6. Non-tech Review/Triage and approve UX blocker
- NVIDIA Stage 2 approve bridge/server support is now recorded at commit `de7c907147de4a4938738e137e3264defe52426e`.
- NVIDIA Stage B read-only triage dashboard is now recorded at commit `395160cacbdf6464618cf6569dad78ff42596a2d`.
- NVIDIA Stage C Q&A-integrated candidate surfacing is now recorded at commit `308bdd5fb0bca9237087132b598418092f7ddc95`.
- NVIDIA Stage D preview-only approve dry-run UI is now recorded at commit `2e44f4928af8fd362fabdd03138896491b18401a`.
- NVIDIA Stage E single-item approve apply UI is now recorded at commit `2332a965429b5e4af29c36062a568d46fbae4123`.
- `/proxy/abw/approve-draft` now exists as bounded bridge infrastructure only.
- `/proxy/abw/promote` remains fail-closed by design.
- This closes the prior blocker that NVIDIA approve bridge/server support was missing.
- The missing Review/Triage design blocker is now closed by recorded design evidence.
- The missing read-only triage dashboard blocker is now closed by recorded Stage B UI evidence.
- The missing Q&A-integrated candidate surfacing blocker is now closed by recorded Stage C UI evidence.
- The missing preview-only approve dry-run UI blocker is now closed by recorded Stage D UI evidence.
- The missing single-item approve apply UI blocker is now closed by recorded Stage E UI evidence.
- This does not close the product blocker for non-technical implementation UX.
- Stage E now provides a bounded single-item preview-plus-confirm approval flow only.
- The bounded non-tech approve UI pilot was rerun and failed on source honesty / trusted retrieval guard behavior, not approval mutation safety.
- The failed pilot is preserved as `FAIL_BOUNDED_NON_TECH_APPROVE_UI_PILOT`.
- The repair gate `FIX_MISSING_SOURCE_AND_TRUSTED_RETRIEVAL_GUARDS_AFTER_APPROVAL` is now recorded as bounded fix evidence.
- The next full browser UI pilot was rerun on `2026-05-18` and recorded as `WARNING_BOUNDED_NON_TECH_APPROVE_UI_PILOT_AFTER_RETRIEVAL_FIX`.
- Safety and honesty controls passed in that rerun:
  - Q&A worked before approval
  - exactly one source was previewed and approved
  - trusted factual retrieval improved after approval
  - missing-source, unsupported, malformed, and ambiguous generic remained abstain-only before and after approval
  - ask/query did not mutate `.brain`
  - `query_deep_runs.jsonl` was not created/changed
  - `/proxy/abw/promote` remained unused
- The remaining blocker is now UX/product clarity, not source honesty:
  - Step 3 review copy still says trusted-source approval is unavailable in this UI
  - review summary/action copy still implies manual-only promotion although the triage preview/apply path exists and works
  - approved factual answer still carries residual weak-source wording noise
- Follow-up status:
  - the stale approval-availability copy has now been fixed in local NVIDIA UI wording and browser smoke/regression checks passed
  - the warning classification is preserved historically because the pilot ran before that copy fix
  - the clean rerun on corrected wording now passed as `PASS_COPY_CLEAN_BOUNDED_NON_TECH_APPROVE_UI_PILOT`
- No bulk approval exists.
- No corpus approval exists.
- Manual CLI approval remains unacceptable as product UX for non-technical users.
- This does not prove broader non-technical daily-use readiness.

7. Retrieval honesty after approval blocker
- The immediate missing-source/trusted-retrieval guard failure is fixed in the ABW retrieval layer at commit `f748a44e2bd87594314bcc0d0af93d9ad64a55e6` and recorded in `06_VALIDATION/FIX_MISSING_SOURCE_AND_TRUSTED_RETRIEVAL_GUARDS_AFTER_APPROVAL_REPORT.md`.
- Missing-source internal-IP queries now abstain before and after unrelated factual approval:
  - `no_match`
  - `E0_unknown`
  - trust `0`
  - `sources=[]`
- Unrelated approved/trusted wiki sources are no longer reused for missing-source questions in the focused synthetic rerun.
- Unsupported and malformed explicit file queries remain abstain-only in the focused rerun.
- Generic ambiguous document queries abstain unless direct support exists.
- The full browser UI rerun after the fix now confirms the same abstention behavior on the real UI path.
- This closes the immediate honesty/rerun requirement, but it does not close the broader UX/readiness blocker.

8. Strong manifest positive-usefulness blocker
- The browser/proxy missing-source honesty failure is closed by ABW commit `11fb4c6d36e0e18ba9a516a51674c3e88ce081e8`, and the browser UI rerun preserves that fix as `WARNING_STRONG_MANIFEST_UI_PILOT_AFTER_HONESTY_FIX`.
- Missing-source, unsupported, and malformed explicit file/control queries now abstain correctly on the browser UI path:
  - `ABW_CLI_NO_MATCH`
  - `no_match`
  - `E0_unknown`
  - trust `0`
  - `sources=[]`
- Ambiguous remains weak/cautious, which is acceptable for this gate.
- Positive controls remain weak:
  - factual, Vietnamese, procedure, and troubleshooting still return `raw_or_draft_only`
  - `E1_fallback`
  - trust `45`
- This is not a source-honesty failure, but it is still a product blocker for non-technical daily use.
- The bounded non-tech approve UI rerun after retrieval fix now shows that selective approval materially improves the approved factual item from `E1_fallback` / trust `45` to `E2_wiki` / trust `72`.
- The selective-approval proof and copy-clean browser evidence now both exist on a sanitized/synthetic workspace.
- The Review/Triage design now exists as recorded governance evidence.
- The read-only triage dashboard, candidate surfacing, preview-only dry-run, and Stage E single-item approve apply UI now all exist as bounded evidence.
- Positive controls before approval still remain weak `E1_fallback` / trust `45`, but the approved factual source now cleanly improves to trusted/wiki evidence on the browser path.
- The bounded daily rehearsal design is now recorded in `06_VALIDATION/BOUNDED_DAILY_REHEARSAL_DESIGN.md`.
- Next movement should not be readiness promotion; the next executable gate is `RUN_BOUNDED_DAILY_REHEARSAL_WITH_LOW_RISK_DOCS`.
- That gate remains blocked until the operator confirms the rehearsal set is low-risk and non-sensitive.

9. Direct CLI JSON hardening caveat
- A pre-existing direct CLI JSON hardening regression remains unresolved on this machine.
- The failing command family is:
  - `py -m pytest tests/test_abw_json_hardening.py -k "ask_json_contract_no_match or ask_json_contract_runtime_write_suppressed or ask_json_contract_raw_only_query_marks_weak_evidence"`
- Observed issue:
  - plain-text-vs-JSON CLI behavior
- Governance status:
  - recorded caveat
  - not hidden
  - not treated as a pass
  - not equivalent to a browser/proxy path regression
- This remains relevant future hardening work if the direct CLI JSON surface is still considered supported.

10. Low-risk rehearsal workspace-state blocker
- The bounded low-risk rehearsal on `2026-05-19` is recorded as `FAIL_BOUNDED_DAILY_REHEARSAL_WITH_LOW_RISK_DOCS`.
- The selected workspace root was correct and the raw folder did contain the user-confirmed `10` low-risk `.docx` files.
- Browser-path ingest also succeeded at the network layer:
  - `ingested=10`
  - `skipped=0`
  - `generated_drafts=10`
  - `review_required=true`
  - `promotion_performed=false`
- The rehearsal still failed for four reasons:
  - the real workspace already contained extensive preexisting `.brain`, `drafts`, `processed`, and `wiki` state
  - a generic question reused unrelated existing quarantine/wiki content such as `wiki\quarantine_wrong_workspace\agv.md`
  - ask/query mutated workspace `.brain` during the ask-before-approval phase
  - visible ingest/trust status remained stale or misleading despite ingest success
- This is not a sensitivity failure and not a readiness promotion path.
- It is a bounded product/workspace-hygiene failure on the real low-risk workspace path.
- Next movement should be:
  - `A. FIX_LOW_RISK_REHEARSAL_UX_BLOCKERS`

11. Fresh low-risk DOCX rerun still pending
- The blocker-fix gate is now recorded as `PASS_FIX_LOW_RISK_REHEARSAL_UX_BLOCKERS`.
- Focused synthetic contamination repro now shows:
  - prior assistant state warning is visible
  - quarantine/wrong-workspace files are surfaced as warnings
  - generic contaminated-workspace ask abstains
  - missing-source abstains
  - direct supported ask improves from `E1_fallback` / trust `45` to `E2_wiki` / trust `72` after one-source approval
  - ask/query does not mutate `.brain`
  - `query_deep_runs.jsonl` remains absent during ask
- The failed real DOCX rehearsal is preserved historically and is not rewritten as a pass.
- The remaining blocker is now rerun hygiene, not the original quarantine/generic/query-mutation bug set:
  - the next real low-risk DOCX rehearsal should use a fresh workspace copy or fresh workspace root
  - the previous contaminated real workspace should be preserved as failure evidence, not deleted silently
- This still does not prove daily-use readiness or broad real-world validation.

12. Fresh low-risk DOCX rerun warning remains
- The fresh rerun is now recorded as `WARNING_BOUNDED_DAILY_REHEARSAL_WITH_FRESH_LOW_RISK_DOCX_WORKSPACE`.
- Safety and honesty controls passed on the fresh workspace path:
  - no contaminated state was copied
  - ingest succeeded on `10` low-risk `.docx` files
  - direct positive controls returned weak but sourceful `E1_fallback` answers before approval
  - one-source preview/apply approval worked
  - the approved direct question improved to trusted/wiki `E2_wiki`
  - missing-source abstained before and after approval
  - ambiguous generic abstained before and after approval
  - no quarantine source was used
  - ask/query did not mutate `.brain`
  - `query_deep_runs.jsonl` remained absent
- The remaining blocker is UX clarity on the fresh path:
  - after the current fresh ingest creates `.brain`, `drafts`, and `processed`, the UI warns that the workspace already has prior assistant state
  - this is misleading because the warning is triggered by current-run generated state rather than copied contamination
- This is not a new honesty failure, but it is still a non-technical UX blocker for bounded rehearsal quality.

## Immediate Risk If Ignored

- Overclaim risk rises if bounded smoke evidence is treated as daily-use or production readiness.
- Pilot risk rises if warning evidence is treated as clean broad validation.
- UX overclaim risk rises if backend approve contract completion is mistaken for a shipped non-tech approve flow.
- Workspace contamination risk rises if a real low-risk workspace with preexisting wiki/quarantine state is treated as isolated fresh-ingest evidence.

