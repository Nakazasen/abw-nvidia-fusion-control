# SMALL SANITIZED REAL WORK DOC PILOT RERUN REPORT (Bounded)

## Verdict

SMALL_SANITIZED_REAL_WORK_DOC_PILOT_RERUN_PASS_BOUNDED

## Scope And Data Safety

- Pilot workspace: `D:\Sandbox\_real_user_pilot\small_sanitized_rerun_20260516_132658`
- Data scope: 3 approved/sanitized MP2027 files only.
- Approved files:
  - `D:\Sandbox\MP2027\FORM.xlsx`
  - `D:\Sandbox\MP2027\Cải tiến nhập dữ liệu chung vào file MP.xlsx`
  - `D:\Sandbox\MP2027\headcount_manual.csv`
- Local-only approved manifest used in workspace; not committed.
- No raw pilot data committed.
- No sensitive excerpts included in this report.

## Historical Continuity

- Previous small pilot fail is preserved:
  - `SMALL_SANITIZED_REAL_WORK_DOC_PILOT_FAIL_MUTATION_SAFETY`
- ABW fix after fail:
  - commit: `39a23a288b3df695f618d72d964bb6fdb66e1714`
  - message: `fix: block read-only query runtime artifact writes end-to-end`
  - targeted tests: `180 passed, 7 warnings`
  - mini repro: `.brain 0 -> 0`

## Ingest Evidence

- `ingested=3`
- `skipped=0`
- `generated_drafts=3`
- `review_required=true`
- `promotion_performed=false`
- `unsupported_files=[]`
- `parse_errors=[]`
- `duplicate_count=0`
- warning:
  - drafts require review before trusted wiki use

## Direct ABW Read-Only Evidence

Environment:
- `ABW_READ_ONLY_QUERY=1`
- `PYTHONPATH=src`

Known factual/procedure/troubleshooting/Vietnamese:
- `status=success`
- `retrieval_status=fuzzy_match`
- `evidence=E2_wiki`
- `source=wiki/pilot-reviewed.md`
- trust about `63-72`

Missing-source:
- `status=no_match`
- `retrieval_status=no_match`
- `trust_score=0`
- `evidence=E0_unknown`
- `sources=[]`

Ambiguous/gap-style:
- safe `no_match/E0`
- no strong overclaim

Visibility flags preserved:
- `gap_log_suppressed`
- `would_log_gap`
- `runtime_write_suppressed`

## NVIDIA Bridge Evidence

Precondition:
- active NVIDIA workspace switched to pilot workspace before bridge calls
- no `ABW_CLI_WRONG_WORKSPACE`

Version:
- `/proxy/abw/version` -> `ABW_CLI_OK`
- `runtimeSource=repo`
- `abwRepoPath` correct
- ABW commit payload shows `39a23a2`

Doctor:
- `/proxy/abw/doctor` -> `ABW_CLI_OK`
- warnings surfaced honestly

Ask:
- known questions -> HTTP `200` / `ABW_CLI_OK`
- trust/evidence/source visible
- missing-source -> HTTP `200` / `ABW_CLI_NO_MATCH` / trust `0` / `E0` / `sources=[]`
- ambiguous/weak classifiable -> HTTP `200`
- no opaque `502`

## Mutation Safety Evidence

- `.brain` file count before query batch: `11`
- `.brain` file count after query batch: `11`
- file list unchanged
- no added/removed files
- no new `acceptance_requests`
- no `runner_artifacts`
- no `negative_memory.jsonl`
- no new `used_nonces.json`
- pending edits `0`
- no Apply
- no sync/write-back
- no `execute_command` through bridge path

## Regression Evidence

- ABW targeted tests: `180 passed, 7 warnings`
- NVIDIA bridge tests: `59 passed, 0 failed`
- NVIDIA `npm test`: `PASS`
- browser smoke non-blocking warning remains:
  - `Inline edit widget opens from selection: widget not observable in current smoke state`

## Residual Risks

- bounded scope only (3 sanitized MP2027 files)
- not broad real-work-doc validation
- weak prompt can still match short/general wiki content; may need a later anti-overmatch sprint
- browser smoke inline-edit warning remains
- not `DAILY_USE_READY`

## Non-Claims

- not `DAILY_USE_READY`
- not production-ready
- not full bridge ready
- not Cognitive OS achieved
- not enterprise-grade security
- not packaging-ready
- not broad real-work-doc validation
