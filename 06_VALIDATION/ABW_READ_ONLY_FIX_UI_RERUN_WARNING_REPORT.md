# ABW Read-Only Fix and UI Rerun Warning Report

Date: 2026-05-17

## Scope

- Evidence class: bounded sanitized full-browser UI rerun evidence after ABW read-only suppression fix.
- Raw pilot documents are not copied into CONTROL.
- This is not readiness promotion.

## Repositories

- CONTROL: `e52252d525bc60fd1aa789689b7e23195dc5adca`
- NVIDIA: `6ddf31561a3636e3f8e3c5cadbd4854cf0923114`
- ABW: `c877051ef303e99b77d92315a402415d5512997d`

## ABW Fix Evidence

- ABW commit: `c877051ef303e99b77d92315a402415d5512997d`
- Commit message: `fix: suppress deep query logs in read-only mode`
- Root cause fixed: read-only `query_deep` could write `.brain/query_deep_runs.jsonl`.
- Direct CLI read-only ask after fix:
  - `.brain` before: `0`
  - `.brain` after: `0`
  - `query_deep_runs.jsonl=false`
  - `runtimeWriteSuppressed=true`
  - `deepRunLogSuppressed=true`
- NVIDIA bridge read-only ask after fix:
  - `.brain` before: `0`
  - `.brain` after: `0`
  - `query_deep_runs.jsonl=false`
  - `runtimeWriteSuppressed=true`
  - `deepRunLogSuppressed=true`

## Test Evidence

- `py -m pytest tests/test_abw_query_deep.py tests/test_abw_runner.py -q`
  - PASS: `99 passed`
- `py -m pytest tests/test_abw_query_deep.py tests/test_abw_runner.py tests/test_abw_api.py -q`
  - PASS: `118 passed, 2 warnings, 7 subtests passed`
- `npm run abw:reader:test`
  - PASS: `108/108`

## UI Rerun Evidence

- Result: `WARNING_UI_BOUNDED_SANITIZED_RERUN_AFTER_ABW_FIX`
- Full browser UI used; no bridge/API fallback for the gate.
- Fresh sanitized workspace:
  - `D:\Sandbox\_real_user_pilot\ui_sanitized_rerun_after_abw_fix_20260517_131612`
- Document categories:
  - 3 approved sanitized work-like files
  - 1 synthetic unsupported extension file
  - 1 synthetic malformed DOCX placeholder
- UI ingest:
  - `ingested=3`
  - `skipped=2`
  - `generated_drafts=3`
  - `review_required=true`
  - `promotion_performed=false`
  - unsupported row readable
  - parse-error row readable
  - `[object Object]` did not appear

## Safety Evidence

- Query-time `.brain` mutation: no
- `.brain` before query: `10`
- `.brain` after query: `10`
- changed files: `[]`
- `query_deep_runs.jsonl` before query: no
- `query_deep_runs.jsonl` after query: no
- pending edits: none
- Apply used: no
- sync/write-back used: no
- auto-promotion: no
- CONTROL/NVIDIA/ABW remained clean

## Remaining Warnings

- Vietnamese remained no-match.
- Procedure and troubleshooting remained no-match on the fresh workspace.
- Some answers remained weak/fallback: `E1_fallback`, trust `45`.
- Answer quality/retrieval coverage is still limited and not enough for daily-use claims.

## Non-Claims

Still forbidden:

- `DAILY_USE_READY`
- production-ready
- enterprise-ready
- Cognitive OS achieved
- full bridge ready
- autonomous-safe
- packaging-ready
- broad real-world validation

## Recommended Next Gate

`INVESTIGATE_BACKEND_RETRIEVAL_OR_VIETNAMESE_COVERAGE`
