# Roadmap State (Local Snapshot)

Date: 2026-05-19

## Ownership

- Owner: Governance Recorder
- Role: Derived local snapshot for current operational cognition

## SOURCE OF TRUTH

- Canonical strategic roadmap: `05_DECISIONS/ROADMAP.md`
- Canonical latest accepted operational state: `03_OPERATIONS/HANDOFF.md`

## DO NOT DUPLICATE

- Do not restate full roadmap strategy or historical sprint narratives from `05_DECISIONS/ROADMAP.md`.
- Keep this file short, date-scoped, and local-state focused.

## 1. Where the Program Actually Is

- Control governance is updating from local HEAD `8bd6ceb3d71a0a0f7d27f6204f80ccd2c6e40f15`.
- NVIDIA bounded workflow hardening plus review-state UI clarity fix has been accepted locally at commit `a867f892be94c350b9cabcfa168d19f82dc64995`.
- NVIDIA approve bridge Stage 2 is accepted locally at commit `de7c907147de4a4938738e137e3264defe52426e`.
- NVIDIA read-only triage dashboard Stage B is accepted locally at commit `395160cacbdf6464618cf6569dad78ff42596a2d`.
- NVIDIA Q&A-integrated candidate surfacing Stage C is accepted locally at commit `308bdd5fb0bca9237087132b598418092f7ddc95`.
- NVIDIA preview-only approve dry-run Stage D is accepted locally at commit `2e44f4928af8fd362fabdd03138896491b18401a`.
- NVIDIA single-item approve apply Stage E is accepted locally at commit `2332a965429b5e4af29c36062a568d46fbae4123`.
- ABW retrieval guard repair after the failed bounded non-tech approve UI pilot is recorded as `PASS_FIX_MISSING_SOURCE_AND_TRUSTED_RETRIEVAL_GUARDS` at commit `f748a44e2bd87594314bcc0d0af93d9ad64a55e6`.
- Full browser rerun after the retrieval guard fix is now recorded as `WARNING_BOUNDED_NON_TECH_APPROVE_UI_PILOT_AFTER_RETRIEVAL_FIX`.
- Copy-clean full browser rerun after the approval-copy fix is now recorded as `PASS_COPY_CLEAN_BOUNDED_NON_TECH_APPROVE_UI_PILOT`.
- Non-tech Review/Triage UX design is now recorded locally as design evidence only.
- ABW missing-source honesty fix is accepted locally at commit `11fb4c6d36e0e18ba9a516a51674c3e88ce081e8`.
- ABW approve JSON contract Stage 1 is accepted locally at commit `f6e6bdcd7aa2b76758611fb4c1587c2af5ba547f`.
- Latest accepted governance milestones remain bounded (pilot/rerun/audit/planning tracks plus NVIDIA bounded workflow regression/smoke evidence).
- Latest pilot lineage still includes `WARNING_UI_BOUNDED_SANITIZED_RERUN_AFTER_ABW_FIX`, preserved as sanitized full-browser UI warning evidence.
- The browser/proxy missing-source honesty defect is fixed in ABW for explicit missing-source, unsupported, and malformed controls.
- Latest strong-manifest browser UI rerun after the honesty fix is recorded as `WARNING_STRONG_MANIFEST_UI_PILOT_AFTER_HONESTY_FIX`.
- Honesty controls now pass on the browser UI path, but positive controls remain weak `E1_fallback`, trust `45`.
- The ABW backend now exposes a bounded single-draft approve contract with dry-run/apply, confirmation token, stale hash guard, and no-overwrite-by-default.
- Latest NVIDIA UI evidence now includes bounded single-item trusted-source approval:
  - review actions no longer show `[object Object]`
  - preview-only dry-run exists before approval
  - explicit confirmation is required before approval
  - approval remains one-source only
  - trusted-source approval is available only after successful preview and explicit confirmation
- NVIDIA now exposes bounded approve bridge/server support through `/proxy/abw/approve-draft`.
- `/proxy/abw/promote` remains fail-closed.
- The new bridge is infrastructure-only and does not provide the final non-tech UI approve flow.
- The Review/Triage design now defines the non-tech path as ask first, review selectively, and approve one selected item later.
- NVIDIA now exposes a read-only triage dashboard with grouped states, honest empty states, and no approval actions.
- NVIDIA now exposes read-only candidate surfacing from eligible weak answer cards into the triage dashboard.
- NVIDIA now exposes preview-only dry-run review entry points and a preview panel that calls `/proxy/abw/approve-draft` with `dry_run=true` only.
- NVIDIA now exposes a bounded single-item approve apply path that requires successful preview, explicit confirmation token/text, trusted workspace continuity, and non-stale candidate state.
- Preview is not approval by itself, and approval does not imply folder, workspace, or corpus validation.
- The bounded non-tech approve UI pilot previously failed on missing-source / trusted retrieval honesty after approval and was rerun after the retrieval guard fix.
- The focused repair rerun confirms missing-source, unsupported, malformed, and generic ambiguous queries abstain before/after a single factual source is approved.
- The full browser rerun confirms the same honesty behavior on the real UI path, confirms single-item preview/apply approval works, and confirms the approved factual item improves to trusted/wiki `E2_wiki` / trust `72`.
- The warning reason at runtime was UX clarity:
  - Step 3 review copy still said trusted-source approval was unavailable in this UI
  - review summary/action copy still implied manual-only promotion
  - approved factual answer still carried residual weak-source wording noise
- The stale approval-availability copy has now been fixed afterward in local NVIDIA UI wording and validated by NVIDIA regression plus browser smoke.
- The bounded copy-clean rerun now confirms that the active browser UI copy is consistent with the Stage E single-item preview/apply path.
- Missing-source, unsupported, malformed, and generic ambiguous questions abstain before and after approval on the corrected-copy browser path.
- The bounded daily rehearsal design is now recorded in `06_VALIDATION/BOUNDED_DAILY_REHEARSAL_DESIGN.md`.
- The next executable gate is now `RUN_BOUNDED_DAILY_REHEARSAL_WITH_LOW_RISK_DOCS`.
- That next gate is constrained to user-confirmed low-risk/non-sensitive documents only.
- The bounded low-risk rehearsal has now been run on the confirmed `10`-DOCX workspace and recorded as `FAIL_BOUNDED_DAILY_REHEARSAL_WITH_LOW_RISK_DOCS`.
- The failure is not a sensitivity/policy failure; it is a real-workspace product/hygiene failure:
  - existing workspace wiki/quarantine content contaminated generic retrieval
  - ask/query mutation was observed in that failed real-workspace rehearsal and is preserved in the historical record
  - ingest/trust UI state stayed stale despite ingest success
- The blocker-fix gate is now recorded as `PASS_FIX_LOW_RISK_REHEARSAL_UX_BLOCKERS`.
- Focused contaminated-workspace repro now confirms:
  - quarantine/wrong-workspace files are excluded from trusted retrieval
  - generic contaminated-workspace asks abstain instead of reusing unrelated wiki content
  - missing-source still abstains
  - direct supported ask improves from `E1_fallback` / trust `45` to `E2_wiki` / trust `72` after one-source approval
  - ask/query does not mutate `.brain` in focused repro
  - `query_deep_runs.jsonl` remains absent during ask
- The next executable gate is now `RERUN_BOUNDED_DAILY_REHEARSAL_WITH_FRESH_LOW_RISK_DOCX_WORKSPACE`.
- The fresh low-risk DOCX rerun is now recorded as `WARNING_BOUNDED_DAILY_REHEARSAL_WITH_FRESH_LOW_RISK_DOCX_WORKSPACE`.
- The fresh rerun confirms:
  - no contaminated state was copied into the new workspace root
  - browser-path ingest succeeded on all `10` low-risk `.docx` files
  - direct positive controls returned weak but sourceful `E1_fallback` / trust `45` before approval
  - one-source preview/apply approval worked
  - the approved direct question improved to `E2_wiki` / trust `70`
  - missing-source abstained before and after approval
  - ambiguous generic abstained before and after approval
  - no quarantine source was used
  - ask/query did not mutate `.brain`
  - `query_deep_runs.jsonl` remained absent
- The fresh rerun warning is now UX-specific:
  - after successful fresh ingest, the UI still warns that the workspace already has prior assistant state
  - that warning is triggered by state created during the current run, not by copied contamination
- The next executable gate is now `FIX_REMAINING_LOW_RISK_DOCX_UX_BLOCKERS`.
- A pre-existing direct CLI JSON hardening caveat remains unresolved and is preserved as residual work, not hidden success.

## 2. Confirmed Direction

- Near-term direction after accepted NVIDIA changes:
  - non-tech ABW document-assistant UX refinement
  - trust-first workspace and ingest behavior clarity
  - honest review-state wording for non-technical operators
  - smoke-test hardening around layout/focus/trust states
- safe non-tech Review/Triage implementation starting with a read-only triage dashboard
- safe non-tech trusted-source approval implementation only after read-only triage and candidate surfacing stages
- preview-only approve dry-run is now recorded before apply
- single-item approve apply Stage E is now recorded before any broader pilot or validation claim
- immediate validation focus moves to refining fresh-workspace low-risk rehearsal UX clarity after the warning rerun
- This is hardening and usability work inside bounded bridge scope.

## 3. What Is Not Yet True

- Not `DAILY_USE_READY`.
- Not production-ready.
- Not enterprise-ready.
- Not full bridge ready.
- Not autonomous-safe.
- Not packaging-ready.
- Not broad real private/work-document validated.
- Not Cognitive OS achieved.

## 4. Immediate Next Governance-Grade Steps

1. Review `06_VALIDATION/RERUN_BOUNDED_DAILY_REHEARSAL_WITH_FRESH_LOW_RISK_DOCX_WORKSPACE_REPORT.md`.
2. Preserve the failed contaminated-workspace run as historical evidence and the fresh rerun as warning evidence only.
3. Fix the post-ingest prior-state warning so fresh current-run generated state is not mislabeled as copied prior assistant contamination.
4. Keep the direct CLI JSON hardening caveat, broader real-world validation gap, anti-self-fulfilling caution, and browser smoke inline-edit observability warning as active residual items until separately addressed.

