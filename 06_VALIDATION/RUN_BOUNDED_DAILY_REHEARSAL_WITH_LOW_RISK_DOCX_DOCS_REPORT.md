# BOUNDED DAILY REHEARSAL WITH LOW-RISK DOCX DOCS REPORT

Date: 2026-05-19

## 0. Classification

- `FAIL_BOUNDED_DAILY_REHEARSAL_WITH_LOW_RISK_DOCS`

## 1. Scope and limits

- browser UI used: yes
- low-risk/non-sensitive docs confirmed: yes
- DOCX document set: yes
- no sensitive data: yes
- no readiness promotion: yes
- workspace root selected in UI:
  - `D:\Sandbox\Web_matthesinhhoanguyco\mat-the-website`
- raw folder used under that workspace:
  - `D:\Sandbox\Web_matthesinhhoanguyco\mat-the-website\raw`
- this was a bounded low-risk rehearsal only
- this was not a production or readiness gate

## 2. Starting repo snapshot

- CONTROL
  - branch: `main`
  - HEAD: `8bd6ceb3d71a0a0f7d27f6204f80ccd2c6e40f15`
  - status before run: clean
- NVIDIA
  - branch: `main`
  - HEAD: `8b2473bc01b629d919efd0d8b5d61b2a3a3662e8`
  - status before run: clean
- ABW
  - branch: `main`
  - HEAD: `f748a44e2bd87594314bcc0d0af93d9ad64a55e6`
  - status before run: clean

## 3. Workspace and document set

- selected workspace root path:
  - `D:\Sandbox\Web_matthesinhhoanguyco\mat-the-website`
- raw folder path:
  - `D:\Sandbox\Web_matthesinhhoanguyco\mat-the-website\raw`
- file count:
  - `10`
- extension mix:
  - `.docx = 10`
- file categories only:
  - chapter/story DOCX documents
- filenames:
  - `Chuong 1.docx`
  - `Chuong 2.docx`
  - `Chuong 3.docx`
  - `Chuong 4.docx`
  - `Chuong 5.docx`
  - `Chuong 6.docx`
  - `Chuong 7.docx`
  - `Chuong 8.docx`
  - `Chuong 9.docx`
  - `Chuong 10.docx`
- low-risk confirmation:
  - user-confirmed low-risk/non-sensitive
- disallowed categories absent:
  - yes by filename review

## 4. Ingest evidence

- selected workspace path in UI:
  - exact match to `D:\Sandbox\Web_matthesinhhoanguyco\mat-the-website`
- raw folder detected in UI:
  - yes
- browser-path ingest request:
  - `POST /proxy/abw/ingest`
- network result:
  - `status=ABW_CLI_OK`
  - `ingested=10`
  - `skipped=0`
  - `generated_drafts=10`
  - `review_required=true`
  - `promotion_performed=false`
- generated draft examples:
  - `drafts/ch-ng-1_draft.md`
  - `drafts/ch-ng-4_draft.md`
  - `drafts/ch-ng-10_draft.md`
- readable/unreadable visibility:
  - no unsupported files reported
  - no parse errors reported
- no `[object Object]` observed:
  - yes
- important UI defect:
  - although the ingest network call succeeded, the visible Step 2 summary stayed stale/incorrect:
    - summary showed `Bi chan vi chua tin cay.`
    - status showed `version=ABW_CLI_OK, doctor=ABW_CLI_OK, warnings=5`
  - this is a UX/rendering inconsistency on the real workspace path

## 5. Ask-before-approval evidence

| query category | expected source/category | observed retrieval/evidence/trust | candidate visible | result |
|---|---|---|---|---|
| direct factual | chapter title from `Chuong 1.docx` | `grounded` / `E2_wiki` / `72` from preexisting `wiki\sources\chapters-1-5.md` | no | warning evidence only; answer did not come from a fresh draft-only state |
| direct factual | chapter title from `Chuong 4.docx` | `raw_or_draft_only` / `E1_fallback` / `45` from `drafts\ch-ng-4_draft.md` | yes | pass for weak sourceful pre-approval candidate behavior |
| missing-source | definitely absent internal-IP question | `no_match` / `E0_unknown` / `0` / `sources=[]` | no | pass |
| ambiguous generic | generic `Tai lieu nay noi gi?` | `grounded` / `E2_wiki` / `72` from unrelated `wiki\quarantine_wrong_workspace\agv.md` | no | fail |

Additional direct/story questions were also run in the browser UI. They were not needed to determine the gate outcome because the ambiguous-generic contamination and mutation failure were already sufficient to fail the rehearsal.

## 6. Candidate/preview/approve evidence

- selected candidate:
  - weak sourceful Chapter 4 answer from `drafts\ch-ng-4_draft.md`
- candidate marking:
  - worked
  - candidate appeared in the triage flow as not trusted yet / review candidate only
- preview result:
  - succeeded
  - dry-run path used `/proxy/abw/approve-draft` with `dry_run=true`
- confirmation used:
  - yes
- apply result:
  - succeeded
  - `/proxy/abw/approve-draft` used with `dry_run=false`
  - approved exactly one selected source
- approved wiki path:
  - `wiki\ch-ng-4.md`
- mutation scope:
  - one selected source only
  - no approve-all
  - no batch approval
  - no corpus/workspace approval
- audit/log evidence:
  - `.brain/review_log.jsonl` updated during explicit approval
- `/proxy/abw/promote` used:
  - no

## 7. Ask-after-approval evidence

The approved-source path was created and the follow-up ask cycle completed in the browser session. Supplemental read-only checking afterward confirmed the same high-level outcome pattern:

| query category | before | after | trusted/wiki used | improvement | result |
|---|---|---|---|---|---|
| approved direct question | `raw_or_draft_only` / `E1_fallback` / `45` | stronger post-approval trusted result on the approved Chapter 4 path | yes | yes | pass |
| missing-source | `no_match` / `E0_unknown` / `0` | remained missing-source/no grounded answer | no | n/a | pass |
| ambiguous generic | already wrongly grounded from unrelated wiki content | remained wrongly grounded from unrelated wiki content | yes, but unrelated | no | fail |

The main gate result does not depend on a borderline interpretation here; it already failed before final classification because unrelated generic reuse and query-time mutation were both observed.

## 8. Honesty and safety controls

- missing-source:
  - pass
  - internal-IP control abstained
- ambiguous generic:
  - fail
  - generic question resolved to unrelated `wiki\quarantine_wrong_workspace\agv.md`
- unrelated trusted reuse:
  - fail on generic contamination path
  - the returned AGV wiki was unrelated to the 10 confirmed DOCX chapters
- query-time mutation:
  - fail
  - ask-before phase changed workspace `.brain` state
- `query_deep_runs.jsonl`:
  - pre-existing file already existed in this workspace
  - it was not the file that changed during the rehearsal check
- approve-all / batch / corpus approval:
  - absent
- one-source-only approval boundary:
  - preserved

## 9. Non-tech UX assessment

- what worked:
  - user could select the exact parent workspace root in the UI
  - browser-path ingest endpoint processed all 10 DOCX files
  - Q&A worked before approval
  - candidate preview/apply one-source flow worked
- what confused the flow:
  - ingest network success was not reflected honestly in the visible summary/status copy
  - health/status text still showed a workspace-mismatch-style message after the switch
  - weak evidence strings remained technical/noisy for a non-technical user
  - the workspace already contained a large preexisting ABW corpus, so the user could not tell that generic answers were being contaminated by older wiki state
- CLI needed for main flow:
  - no
- recoverability:
  - limited
  - the UI did not surface the contamination problem clearly enough for a non-technical user
- trust clarity:
  - one-source-only preview/approve boundary was understandable
  - trusted vs untrusted became unclear once unrelated preexisting wiki content was reused
- DOCX-specific rough edges:
  - none on pure parse support in this run
  - the main issue was workspace-state contamination, not DOCX parsing

## 10. Main failure reasons

1. The real workspace root was not a fresh 10-DOCX-only ABW state.
   - It already contained extensive `.brain`, `drafts`, `processed`, and `wiki` content.
   - It already contained unrelated quarantine entries such as:
     - `wiki\quarantine_wrong_workspace\agv.md`
     - `wiki\quarantine_wrong_workspace\mom.md`
     - `wiki\quarantine_wrong_workspace\wms.md`
2. Generic query handling was not bounded to the user-confirmed 10-document rehearsal set.
   - The generic question `Tai lieu nay noi gi?` returned grounded `E2_wiki` content from unrelated AGV wiki material.
3. Ask/query mutated `.brain` during the ask-before-approval phase.
   - The rehearsal did not preserve the required read-only query boundary on this workspace state.
4. The UI presented stale or misleading ingest/trust status even while the ingest network call succeeded.

## 11. Recommended next gate

- `A. FIX_LOW_RISK_REHEARSAL_UX_BLOCKERS`

This should focus on:

- workspace-state hygiene/isolation for low-risk rehearsal
- generic-query contamination from preexisting wiki/quarantine content
- ask/query mutation on non-clean real workspace state
- stale ingest/trust/health UI rendering after successful workspace switch and ingest

## 12. Forbidden claims preserved

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
