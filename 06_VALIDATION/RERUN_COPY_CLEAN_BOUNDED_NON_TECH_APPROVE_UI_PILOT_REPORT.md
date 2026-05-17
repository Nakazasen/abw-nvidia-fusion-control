# COPY-CLEAN BOUNDED NON-TECH APPROVE UI PILOT REPORT

Date: 2026-05-18

## 0. Scope and limits

- Browser UI path used on local NVIDIA server.
- Fresh sanitized/synthetic workspace used:
  - `D:\Sandbox\_real_user_pilot\copy_clean_nontech_approve_ui_pilot_20260518_061924`
- No sensitive/private/customer/HR/legal/finance/contract/incident data used.
- No push was performed.
- No readiness promotion is made.

## 1. Pre-run repo snapshot

- CONTROL
  - branch: `main`
  - HEAD: `6e19f8027171ef02e7e5511f1576f29b1016c3ff`
  - status before run: clean
- NVIDIA
  - branch: `main`
  - HEAD: `8b2473bc01b629d919efd0d8b5d61b2a3a3662e8`
  - status before run: clean
- ABW
  - branch: `main`
  - HEAD: `f748a44e2bd87594314bcc0d0af93d9ad64a55e6`
  - status before run: clean

## 2. Workspace and manifest

- Workspace path:
  - `D:\Sandbox\_real_user_pilot\copy_clean_nontech_approve_ui_pilot_20260518_061924`
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

## 3. UI copy and ingest evidence

- Copy consistency result:
  - pass
- Stale approval-unavailable wording absent:
  - yes
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
| procedure | `ABW_CLI_OK` / `raw_or_draft_only` / `E1_fallback` / `45` | raw | yes | weak sourceful fallback allowed | pass |
| missing-source | `ABW_CLI_NO_MATCH` / `no_match` / `E0_unknown` / `0` | none | no | abstain | pass |
| unsupported | `ABW_CLI_NO_MATCH` / `no_match` / `E0_unknown` / `0` | none | no | abstain | pass |
| malformed | `ABW_CLI_NO_MATCH` / `no_match` / `E0_unknown` / `0` | none | no | abstain | pass |
| ambiguous generic | `ABW_CLI_NO_MATCH` / `no_match` / `E0_unknown` / `0` | none | no | abstain/cautious | pass |

## 5. Candidate/preview/approve evidence

- Candidate selected:
  - factual Lantern draft `drafts/factual-lantern-note_draft.md`
- Candidate state before preview:
  - `Not trusted yet`
  - `Review candidate only`
  - `E1_fallback`
  - trust `45`
- Preview dry-run result:
  - succeeded
  - request used `/proxy/abw/approve-draft` with `dry_run=true`
- Confirmation used:
  - yes
- Apply result:
  - request used `/proxy/abw/approve-draft` with `dry_run=false`
  - preview state moved `ready -> approved`
  - approved wiki path: `wiki/factual-lantern-note.md`
  - audit id: `approve-93b22a4db63c`
  - review log: `.brain/review_log.jsonl`
  - queue transition: `review_needed -> approved`
- Mutation scope:
  - ask phase: no mutation
  - approval phase: one-source approval only
  - `.brain` count changed `10 -> 11` only at approval stage
  - review log and queue-state mutation appeared only during explicit apply

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
  - no

## 9. UX assessment for non-tech user

- Understandable:
  - Q&A works before approval
  - draft/raw answers are visibly not trusted yet
  - candidate marking is clearly review-only
  - preview clearly says no approval happens there
  - approval is clearly one selected source only
  - unsupported/parse-error visibility is honest
- What remains confusing:
  - weak fallback answers still include noisy backend-style evidence text
- User forced to approve many docs:
  - no
- Q&A works without approval:
  - yes
- Approval clearly one item only:
  - yes
- Missing-source behavior understandable:
  - yes, it abstains and offers no candidate action

## 10. Result classification

- `PASS_COPY_CLEAN_BOUNDED_NON_TECH_APPROVE_UI_PILOT`

## 11. CONTROL updates

- Added:
  - `06_VALIDATION/RERUN_COPY_CLEAN_BOUNDED_NON_TECH_APPROVE_UI_PILOT_REPORT.md`
- Updated:
  - `03_OPERATIONS/HANDOFF.md`
  - `03_OPERATIONS/CURRENT_BLOCKERS.md`
  - `03_OPERATIONS/NEXT.md`
  - `05_DECISIONS/ROADMAP_STATE.md`
  - `07_HISTORY/INTEGRATION_JOURNAL.md`

## 12. Final repo snapshot

- CONTROL
  - branch: `main`
  - HEAD: `6e19f8027171ef02e7e5511f1576f29b1016c3ff`
  - status after recording step: pending CONTROL report/governance updates only
- NVIDIA
  - branch: `main`
  - HEAD: `8b2473bc01b629d919efd0d8b5d61b2a3a3662e8`
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

- `A. RECORD_AND_ADVANCE_TO_BOUNDED_DAILY_REHEARSAL_DESIGN`

## 15. Questions for user

- none
