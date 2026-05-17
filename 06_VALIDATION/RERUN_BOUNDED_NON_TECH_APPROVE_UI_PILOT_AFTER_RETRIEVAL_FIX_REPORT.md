# BOUNDED NON-TECH APPROVE UI PILOT AFTER RETRIEVAL FIX REPORT

Date: 2026-05-18

## 0. Scope and limits

- Browser UI path used on local NVIDIA server.
- Fresh sanitized/synthetic workspace used:
  - `D:\Sandbox\_real_user_pilot\nontech_approve_ui_after_retrieval_fix_20260518_055145`
- No sensitive/private/customer/HR/legal/finance/contract/incident data used.
- No push was performed.
- No readiness promotion is made.

## 1. Pre-run repo snapshot

- CONTROL
  - branch: `main`
  - HEAD: `9dda3d1b7bad27a9ee4ecdb35fe65bbafcea5dbe`
  - status before run: clean
- NVIDIA
  - branch: `main`
  - HEAD: `2332a965429b5e4af29c36062a568d46fbae4123`
  - status before run: clean
- ABW
  - branch: `main`
  - HEAD: `f748a44e2bd87594314bcc0d0af93d9ad64a55e6`
  - status before run: clean

## 2. Workspace and manifest

- Workspace path:
  - `D:\Sandbox\_real_user_pilot\nontech_approve_ui_after_retrieval_fix_20260518_055145`
- File categories created:
  - factual note
  - procedure checklist
  - missing-source control note
  - unsupported extension marker
  - malformed DOCX placeholder
- Sanitized status:
  - synthetic/sanitized only
  - no internal IP or sensitive source copied
- Initial runtime state after ingest setup:
  - `.brain` existed after ingest as expected
  - `.brain` file count before ask phase: `10`
  - `query_deep_runs.jsonl`: absent before ask phase
  - generated drafts: `3`
  - trusted wiki: none before approval

## 3. UI ingest and triage evidence

- Ingest result:
  - `ingested=3`
  - `skipped=2`
  - `generated_drafts=3`
  - `review_required=true`
  - `promotion_performed=false`
- Triage groups visible:
  - `Ready to ask, not trusted yet`
  - `Good candidates to review`
  - `Needs attention`
  - `Could not read`
  - `Already trusted`
  - `Recently used in answers`
- Unsupported/parse-error visibility:
  - unsupported row visible for `raw/unsupported_marker.xyz`
  - parse-error row visible for `raw/malformed_placeholder.docx`
- Q&A-without-approval copy visible:
  - yes
- No approve-all/corpus wording visible:
  - yes
- No `[object Object]` observed:
  - yes

## 4. Ask-before-approval evidence

| Query category | Observed status/retrieval/evidence/trust | Source category | Candidate visible | Expected result | Result |
|---|---|---|---|---|---|
| factual | `ABW_CLI_OK` / `raw_or_draft_only` / `E1_fallback` / `45` | draft | yes | weak sourceful fallback allowed | pass |
| procedure | `ABW_CLI_OK` / `raw_or_draft_only` / `E1_fallback` / `45` | draft | yes | weak sourceful fallback allowed | pass |
| missing-source | `ABW_CLI_NO_MATCH` / `no_match` / `E0_unknown` / `0` | none | no | abstain | pass |
| unsupported | `ABW_CLI_NO_MATCH` / `no_match` / `E0_unknown` / `0` | none | no | abstain | pass |
| malformed | `ABW_CLI_NO_MATCH` / `no_match` / `E0_unknown` / `0` | none | no | abstain | pass |
| ambiguous generic | `ABW_CLI_NO_MATCH` / `no_match` / `E0_unknown` / `0` | none | no | abstain/cautious | pass |

## 5. Candidate/preview/approve evidence

- Candidate selected:
  - factual Lantern draft `drafts/factual-lantern-note_draft.md`
- Candidate state before preview:
  - `Not trusted yet`
  - `E1_fallback`
  - trust `45`
- Preview dry-run result:
  - succeeded
  - request used `/proxy/abw/approve-draft` with `dry_run=true`
- Confirmation used:
  - yes
- Apply result:
  - request used `/proxy/abw/approve-draft` with `dry_run=false`
  - `approved=true`
  - `promotionPerformed=true`
  - approved wiki path: `wiki/factual-lantern-note.md`
  - audit id: `approve-281a08603d20`
  - review log: `.brain/review_log.jsonl`
- Mutation scope:
  - ask phase: no mutation
  - approval phase: one-source approval only
  - `.brain` count changed `10 -> 11` only at approval stage
  - added review log and queue state change only during explicit apply

## 6. Ask-after-approval evidence

| Query | Before result | After result | Trusted/wiki used | Improvement | Candidate visible | Result |
|---|---|---|---|---|---|---|
| factual Lantern | `raw_or_draft_only` / `E1_fallback` / `45` | `exact_match` / `E2_wiki` / `72` | yes | yes | no | pass |
| missing-source IP | `no_match` / `E0_unknown` / `0` | `no_match` / `E0_unknown` / `0` | no | n/a | no | pass |
| unsupported | `no_match` / `E0_unknown` / `0` | `no_match` / `E0_unknown` / `0` | no | n/a | no | pass |
| malformed | `no_match` / `E0_unknown` / `0` | `no_match` / `E0_unknown` / `0` | no | n/a | no | pass |
| ambiguous generic | `no_match` / `E0_unknown` / `0` | `no_match` / `E0_unknown` / `0` | no | n/a | no | pass |

## 7. Honesty controls

- Missing-source before approval:
  - abstained with `no_match` / `E0_unknown` / trust `0` / `sources=[]`
- Missing-source after approval:
  - remained `no_match` / `E0_unknown` / trust `0` / `sources=[]`
  - did not reuse approved Lantern wiki
- Unsupported:
  - abstained before and after approval
  - UI kept it non-candidate
- Malformed:
  - abstained before and after approval
  - UI kept it non-candidate
- Ambiguous generic:
  - abstained before and after approval
  - UI kept it non-candidate

## 8. Safety and mutation evidence

- Ingest mutation expected:
  - yes
- Approval mutation exactly one source:
  - yes
- Query mutation:
  - no
- `query_deep_runs.jsonl` created/changed:
  - no
- Apply/sync/write-back used:
  - apply used only inside bounded approve flow
  - sync/write-back outside that flow: no
- `/proxy/abw/promote` used:
  - no
- Repo dirty during validation runtime:
  - CONTROL/NVIDIA/ABW stayed clean during runtime validation

## 9. UX assessment for non-tech user

- Understandable:
  - Q&A works before approval
  - triage grouping is readable
  - unsupported/parse-error visibility is honest
  - preview/apply copy clearly says one source only and not whole folder
- Confusing:
  - Step 3 review panel still says trusted-source approval is unavailable in this UI
  - review summary/action copy still implies manual-only promotion even though triage preview/apply exists and works
  - post-approval factual answer improves to `E2_wiki`, but residual source-warning copy remains noisy in the answer card
- User forced to approve many docs:
  - no
- Approval clearly one item only:
  - yes
- Missing-source behavior understandable:
  - yes, it abstains and offers no candidate action

## 10. Result classification

- `WARNING_BOUNDED_NON_TECH_APPROVE_UI_PILOT_AFTER_RETRIEVAL_FIX`

Why warning instead of pass:

- Safety and honesty controls passed on the real browser UI path.
- Single-item preview/apply passed with explicit confirmation.
- Trusted factual retrieval improved after approval.
- Remaining UX clarity is still inconsistent because some visible UI copy says trusted-source approval is unavailable even though the triage approve path exists and works.

## 11. CONTROL updates

- Added:
  - `06_VALIDATION/RERUN_BOUNDED_NON_TECH_APPROVE_UI_PILOT_AFTER_RETRIEVAL_FIX_REPORT.md`
- Updated:
  - `03_OPERATIONS/HANDOFF.md`
  - `03_OPERATIONS/CURRENT_BLOCKERS.md`
  - `03_OPERATIONS/NEXT.md`
  - `05_DECISIONS/ROADMAP_STATE.md`
  - `07_HISTORY/INTEGRATION_JOURNAL.md`
  - `05_DECISIONS/DECISIONS.md`
- Commit:
  - none

## 12. Final repo snapshot

- CONTROL
  - branch: `main`
  - HEAD: `9dda3d1b7bad27a9ee4ecdb35fe65bbafcea5dbe`
  - status after recording step: dirty in CONTROL only because governance/report files were updated
- NVIDIA
  - branch: `main`
  - HEAD: `2332a965429b5e4af29c36062a568d46fbae4123`
  - status after validation: clean
- ABW
  - branch: `main`
  - HEAD: `f748a44e2bd87594314bcc0d0af93d9ad64a55e6`
  - status after validation: clean

## 13. Forbidden claims preserved

The following remain forbidden:

- `DAILY_USE_READY`
- production-ready
- enterprise-ready
- Cognitive OS achieved
- full bridge ready
- autonomous-safe
- packaging-ready
- broad real-world validation

## 14. Recommended next gate

- `B. FIX_REMAINING_NON_TECH_UI_OR_RETRIEVAL_ISSUES`

## 15. Questions for user

- none

## Addendum - 2026-05-18 stale approval copy follow-up

- The original runtime classification remains:
  - `WARNING_BOUNDED_NON_TECH_APPROVE_UI_PILOT_AFTER_RETRIEVAL_FIX`
- Reason the warning is preserved historically:
  - the pilot was executed while Step 3 / review-panel copy still contradicted the real Stage E single-item preview/apply flow
- Follow-up completed after the pilot:
  - NVIDIA UI copy was updated so approval is described as available only for one selected source after successful preview and explicit confirmation
  - candidate marking is now described as review-only, not approval
  - review-state copy no longer says trusted-source approval is unavailable in this UI
  - bulk/corpus/workspace approval wording remains absent
- Follow-up validation:
  - `node --check tools/browser-smoke.mjs` PASS
  - `node --check tools/nvidia-server.mjs` PASS
  - `node --check tools/abw-cli-reader.mjs` PASS
  - `node --test tests/abw-cli-reader-bridge.test.mjs` PASS
  - `npm test` PASS
- Safety/honesty interpretation unchanged:
  - no readiness promotion
  - no change to the passed ask/query mutation controls
  - no change to the passed missing-source / unsupported / malformed / ambiguous abstention controls
- Recommended next gate after the copy fix:
  - `A. RERUN_COPY_CLEAN_BOUNDED_NON_TECH_APPROVE_UI_PILOT`
