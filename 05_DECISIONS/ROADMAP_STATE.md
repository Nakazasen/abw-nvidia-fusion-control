# Roadmap State (Local Snapshot)

Date: 2026-05-17

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

- Control governance is updating from local HEAD `816ad0953a08c860a61bcf82ecadfaa773aa2f54`.
- NVIDIA bounded workflow hardening plus review-state UI clarity fix has been accepted locally at commit `a867f892be94c350b9cabcfa168d19f82dc64995`.
- NVIDIA approve bridge Stage 2 is accepted locally at commit `de7c907147de4a4938738e137e3264defe52426e`.
- NVIDIA read-only triage dashboard Stage B is accepted locally at commit `395160cacbdf6464618cf6569dad78ff42596a2d`.
- NVIDIA Q&A-integrated candidate surfacing Stage C is accepted locally at commit `308bdd5fb0bca9237087132b598418092f7ddc95`.
- NVIDIA preview-only approve dry-run Stage D is accepted locally at commit `2e44f4928af8fd362fabdd03138896491b18401a`.
- NVIDIA single-item approve apply Stage E is accepted locally at commit `2332a965429b5e4af29c36062a568d46fbae4123`.
- ABW retrieval guard repair after the failed bounded non-tech approve UI pilot is recorded as `PASS_FIX_MISSING_SOURCE_AND_TRUSTED_RETRIEVAL_GUARDS` at commit `f748a44e2bd87594314bcc0d0af93d9ad64a55e6`.
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
- The bounded non-tech approve UI pilot failed on missing-source / trusted retrieval honesty after approval and must be rerun after the retrieval guard fix.
- The focused repair rerun confirms missing-source, unsupported, malformed, and generic ambiguous queries abstain before/after a single factual source is approved.
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
- immediate validation focus moves to rerunning a bounded non-tech approve UI pilot after the retrieval guard fix
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

1. Review `06_VALIDATION/NVIDIA_SINGLE_ITEM_APPROVE_APPLY_STAGE_E_REPORT.md`.
2. Treat the Stage E result as bounded single-item approve apply evidence only, not readiness promotion.
3. Preserve the honesty improvement and the no-mutation safety result on the browser UI path.
4. Rerun a bounded non-tech approve UI pilot after the retrieval guard fix before any broader approval claim.
5. Keep the bounded pilot gap, direct CLI JSON hardening caveat, weak positive `E1_fallback` trust `45`, broader real-world validation gap, and browser smoke inline-edit observability as active warning/blocker items until separately addressed.

