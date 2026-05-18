# FRESH LOW-RISK DOCX REHEARSAL RERUN REPORT

Date: 2026-05-19

## 0. Classification

- `WARNING_BOUNDED_DAILY_REHEARSAL_WITH_FRESH_LOW_RISK_DOCX_WORKSPACE`

## 1. Scope and limits

- browser UI used: yes
- fresh workspace used: yes
- low-risk/non-sensitive docs confirmed: yes
- DOCX document set: yes
- no sensitive data printed: yes
- no readiness promotion: yes
- this remained a bounded low-risk rehearsal only

## 2. Starting repo snapshot

- CONTROL
  - branch: `main`
  - HEAD: `e9550d0035225d9a8604f36cd4e381a89bca7407`
  - status before run: clean
- NVIDIA
  - branch: `main`
  - HEAD: `5d743f5cd797a624838f4537f5c49433545331ab`
  - status before run: clean
- ABW
  - branch: `main`
  - HEAD: `829708a298f12ca69fe4b3a0ffdfe881d22d9d10`
  - status before run: clean

## 3. Fresh workspace and document set

- original source raw folder:
  - `D:\Sandbox\Web_matthesinhhoanguyco\mat-the-website\raw`
- fresh workspace root used for recorded rerun:
  - `D:\Sandbox\_real_user_pilot\fresh_low_risk_docx_rehearsal_20260519_064030`
- fresh raw folder:
  - `D:\Sandbox\_real_user_pilot\fresh_low_risk_docx_rehearsal_20260519_064030\raw`
- copied file count:
  - `10`
- extension mix:
  - `.docx = 10`
- filenames/categories only:
  - chapter/story DOCX documents
  - `Chương 1.docx`
  - `Chương 2.docx`
  - `Chương 3.docx`
  - `Chương 4.docx`
  - `Chương 5.docx`
  - `Chương 6.docx`
  - `Chương 7.docx`
  - `Chương 8.docx`
  - `Chương 9.docx`
  - `Chương 10.docx`
- initial `.brain`/`drafts`/`processed`/`wiki` absent:
  - yes
- prior-state warning expected before ingest:
  - no
- prior-state warning observed before ingest:
  - no
- pre-ingest state summary:
  - `.brain=0, drafts=0, trusted_wiki=0, processed=0, quarantine=0`

## 4. Ingest evidence

- selected workspace path in UI:
  - exact match to `D:\Sandbox\_real_user_pilot\fresh_low_risk_docx_rehearsal_20260519_064030`
- raw folder detected in UI:
  - yes
- status:
  - `ABW_CLI_OK`
- ingested:
  - `10`
- skipped:
  - `0`
- generated drafts:
  - `10`
- readable/unreadable visibility:
  - unsupported files shown as `none`
  - parse errors shown as `none`
- parse-error visibility:
  - visible field, zero errors
- triage groups:
  - visible
  - ready `10`
  - candidates `0`
  - attention `2`
  - unreadable `0`
  - trusted `0`
  - recent `0`
- stale blocked-style copy absent:
  - yes
- no `[object Object]`:
  - yes
- important residual UX issue:
  - after successful fresh ingest, the UI showed:
    - `This workspace already has prior assistant state. Do not treat it as a fresh rehearsal workspace.`
  - this warning was not contamination copied from the old failed workspace
  - it was triggered by state generated during the current fresh ingest run itself
  - this is misleading UX for a fresh rehearsal root

## 5. Ask-before-approval evidence

| query category | question origin | expected source/category | observed retrieval/evidence/trust | candidate visible | UI-only evidence | result |
|---|---|---|---|---|---|---|
| direct factual | `CODEX_CONTENT_DERIVED` | `Chương 8` title | `raw_or_draft_only` / `E1_fallback` / trust `45` / `drafts\ch-ng-8_draft.md` | yes | no | pass |
| direct factual | `CODEX_CONTENT_DERIVED` | `Chương 10` title | `raw_or_draft_only` / `E1_fallback` / trust `45` / `drafts\ch-ng-10_draft.md` | yes | no | pass |
| direct factual | `CODEX_CONTENT_DERIVED` | `Chương 3` title/body attribute | `raw_or_draft_only` / `E1_fallback` / trust `45` / `drafts\ch-ng-3_draft.md` | yes | no | pass |
| summary | `CODEX_CONTENT_DERIVED` | `Chương 4` skill summary | `raw_or_draft_only` / `E1_fallback` / trust `45` / `drafts\ch-ng-4_draft.md` | yes | no | pass |
| missing-source | `CONTROL_ADVERSARIAL` | absent from docs | `no_match` / `E0_unknown` / trust `0` / `sources=[]` | no | yes | pass |
| ambiguous generic | `CONTROL_ADVERSARIAL` | generic ambiguity control | `no_match` / `E0_unknown` / trust `0` / `sources=[]` | no | yes | pass |

## 6. Candidate/preview/approve evidence

- selected candidate:
  - `Tiêu đề của Chương 8 là gì?`
- question origin:
  - `CODEX_CONTENT_DERIVED`
- preview result:
  - pass
  - preview mode `ready`
  - target trusted path `wiki/ch-ng-8.md`
- confirmation used:
  - yes
- apply result:
  - pass
  - approved exactly one source
- approved wiki path:
  - `wiki/ch-ng-8.md`
- mutation scope:
  - one selected source only
  - no approve-all
  - no batch
  - no corpus/workspace approval
- audit/log evidence:
  - review log path `.brain/review_log.jsonl`
  - audit id `approve-a9291119ab78`
- `/proxy/abw/promote` used:
  - no

## 7. Ask-after-approval evidence

| query category | before | after | trusted/wiki used | improvement | result |
|---|---|---|---|---|---|
| approved direct | `raw_or_draft_only` / `E1_fallback` / trust `45` / `drafts\ch-ng-8_draft.md` | `exact_match` / `E2_wiki` / trust `70` / `wiki\ch-ng-8.md` | yes | yes | pass |
| missing-source | `no_match` / `E0_unknown` / trust `0` | `no_match` / `E0_unknown` / trust `0` | no | n/a | pass |
| ambiguous generic | `no_match` / `E0_unknown` / trust `0` | `no_match` / `E0_unknown` / trust `0` | no | n/a | pass |
| other direct not approved | `raw_or_draft_only` / `E1_fallback` / trust `45` / `drafts\ch-ng-10_draft.md` | remained `raw_or_draft_only` / `E1_fallback` / trust `45` | no | no | pass |

## 8. Honesty and safety controls

- missing-source:
  - pass
- ambiguous:
  - pass
- unrelated trusted reuse:
  - not observed
- quarantine source use:
  - not observed
- query-time mutation:
  - not observed
  - `.brain` hash unchanged across ask-before
  - `.brain` hash unchanged across ask-after
- `query_deep_runs.jsonl`:
  - absent before ask
  - absent after ask
- approve-all/batch/corpus absence:
  - pass

## 9. Anti-self-fulfilling validation note

- question origin mix:
  - direct and summary questions were `CODEX_CONTENT_DERIVED`
  - missing-source and ambiguous controls were `CONTROL_ADVERSARIAL`
- correctness judgment:
  - direct/sourceful questions were `PRE_READ_ASSISTED`
  - controls were `UI_ONLY_EVIDENCE`
- confidence impact:
  - this rerun is materially stronger than the failed contaminated-workspace run because it used a fresh workspace and the UI-visible safety controls passed
  - it is still not a blind or user-supplied-question run
- future recommendation:
  - a future low-risk run with user-supplied or more blindish questions is still recommended before any broader expansion

## 10. Non-tech UX assessment

- what worked:
  - exact fresh workspace root selection worked
  - fresh pre-ingest state was clearly zero
  - DOCX ingest worked for all `10` files
  - ask-before worked
  - source/trust information was visible
  - candidate/preview/approve-one-source flow worked
  - missing-source and ambiguous generic abstained before and after approval
  - no CLI was needed for the main flow
- what confused the flow:
  - after the current fresh ingest created drafts and `.brain`, the UI warned that the workspace already had prior assistant state
  - that warning is technically based on current workspace contents, but misleading for a fresh rehearsal root that only gained state from the current run
  - health text still reports `doctor warnings=5`, which is noisy for non-technical operators
- recoverability:
  - acceptable for bounded rehearsal
  - not yet clean enough to remove all confusion
- noisy evidence text:
  - moderate
- trust clarity:
  - good for one-source preview/apply boundaries
  - weakened by the over-broad post-ingest prior-state warning
- DOCX-specific rough edges:
  - no parse blocker
  - the remaining issue is workspace-state wording after ingest, not DOCX parsing

## 11. CONTROL updates

- files updated:
  - `06_VALIDATION/RERUN_BOUNDED_DAILY_REHEARSAL_WITH_FRESH_LOW_RISK_DOCX_WORKSPACE_REPORT.md`
  - `03_OPERATIONS/HANDOFF.md`
  - `03_OPERATIONS/CURRENT_BLOCKERS.md`
  - `03_OPERATIONS/NEXT.md`
  - `05_DECISIONS/ROADMAP_STATE.md`
  - `07_HISTORY/INTEGRATION_JOURNAL.md`
- commit hash:
  - pending at report creation time
- pushed:
  - no

## 12. Final repo snapshot

- CONTROL: branch `main`, HEAD pending until commit, expected dirty with governance updates
- NVIDIA: branch `main`, HEAD `5d743f5cd797a624838f4537f5c49433545331ab`, expected clean
- ABW: branch `main`, HEAD `829708a298f12ca69fe4b3a0ffdfe881d22d9d10`, expected clean

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
- VS Code parity
- Cursor parity

## 14. Recommended next gate

- `C. FIX_REMAINING_LOW_RISK_DOCX_UX_BLOCKERS`

## 15. Questions for user

- No immediate question is required.
