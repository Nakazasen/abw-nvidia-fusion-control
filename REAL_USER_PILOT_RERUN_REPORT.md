# REAL USER PILOT RERUN REPORT (Bounded)

## Verdict

REAL_USER_PILOT_RERUN_PASS_BOUNDED

## Scope And Data Safety

- Pilot mode: bounded rerun with synthetic/sanitized safe docs only.
- No real private/work documents were used.
- Forbidden data used: no.
- Sensitive/private snippets included in this report: no.

## Workspace

- Pilot workspace: `D:\Sandbox\_real_user_pilot\rerun_20260516_095848`
- Data class: synthetic/sanitized safe docs only.
- Document set:
  - `raw/repro_agv-technical-manual.txt`
  - `raw/repro_maintenance-sop.txt`
  - `raw/repro_troubleshooting-guide.txt`
  - `raw/repro_ghi-chu-vn.txt`
  - `raw/unsupported.xyz` (intentional unsupported)
  - `raw/broken.docx` (intentional malformed)
  - `wiki/pilot-reviewed.md` (manual reviewed safe wiki setup)

## Fix Commits Under Validation

- ABW:
  - `f753881c11f51cbae6cdddffc40d4050d7603b83`
  - `fix: harden read-only query safety and source honesty`
- NVIDIA:
  - `f8606f05e42d6a7e2cbcbdda11e444755324d14c`
  - `fix: classify bounded ABW bridge nonzero states safely`

## Ingest Evidence

- command:
  - `py -m abw.cli --json --workspace <ws> ingest raw`
- status: `success`
- `ingested`: `0`
- `skipped`: `6`
- `unsupported_files`: `raw/unsupported.xyz`
- `parse_errors`: `raw/broken.docx` invalid zip container
- `generated_drafts`: none in this rerun
- `review_required`: `false`
- `promotion_performed`: `false`
- warnings:
  - `1 unsupported file(s) skipped.`
  - `1 parse error file(s) skipped.`

Note:
- This rerun workspace already contained prior ingested fingerprints, so safe text inputs were reported as `skipped_unchanged` and no new draft-generation evidence was produced in this rerun.

## Direct ABW Read-Only Results

Environment:
- `PYTHONPATH=src`
- `ABW_READ_ONLY_QUERY=1`

Mutation safety snapshot:
- `.brain` file count before query set: `16`
- `.brain` file count after query set: `16`
- `.brain` file list: unchanged

Query summary:
1. factual query:
- `status=success`, `retrieval_status=grounded`, trust `72`, `E2_wiki`, source `wiki/pilot-reviewed.md`, `runtime_write_suppressed=true`
2. procedure query:
- `status=success`, `retrieval_status=grounded`, trust `72`, `E2_wiki`, source `wiki/pilot-reviewed.md`, `runtime_write_suppressed=true`
3. troubleshooting query:
- `status=success`, `retrieval_status=grounded`, trust `72`, `E2_wiki`, source `wiki/pilot-reviewed.md`, `runtime_write_suppressed=true`
4. Vietnamese query:
- `status=success`, `retrieval_status=grounded`, trust `70`, `E2_wiki`, source `wiki/pilot-reviewed.md`, `runtime_write_suppressed=true`
5. missing-source query:
- `status=no_match`, `retrieval_status=no_match`, trust `0`, `E0_unknown`, `sources=[]`, `gap_log_suppressed=true`, `would_log_gap=true`, `runtime_write_suppressed=true`
6. ambiguous/weak query:
- `status=success`, `retrieval_status=grounded`, trust `70`, `E2_wiki`, source `wiki/pilot-reviewed.md`, `runtime_write_suppressed=true`

Interpretation:
- Missing-source trust honesty now remains safe in this rerun.
- Query-time `.brain` mutation did not occur in read-only mode.

## NVIDIA Bridge/API Results

Environment:
- `ABW_REPO_PATH=D:\Sandbox\skill-Anti-brain-wiki_note`
- trusted workspace set to rerun workspace

Runtime metadata:
- `runtimeSource=repo`
- `abwRepoPath=D:\Sandbox\skill-Anti-brain-wiki_note`

Bridge checks:
- `/proxy/abw/version`: `ABW_CLI_OK`
- `/proxy/abw/doctor`: `ABW_CLI_OK` with warnings surfaced

Ask-path summary:
- known/procedure/troubleshoot: `ABW_CLI_OK` with visible trust/evidence/source
- missing-source: `ABW_CLI_NO_MATCH` with trust `0`, `E0_unknown`, `sources=[]`
- Vietnamese in this rerun: safe `ABW_CLI_NO_MATCH` (no overclaim)

Ambiguous classifiable nonzero check:
- mock nonzero JSON case returned HTTP `200`
- bridge status: `ABW_CLI_AMBIGUOUS`
- no opaque `502` when ABW returned classifiable JSON envelope

## Mutation Safety

- pending edits: `0`
- Apply called: no
- sync/write-back called: no
- execute_command through bridge path: no evidence
- repo cleanliness after rerun:
  - Control: clean
  - NVIDIA: clean
  - ABW: clean

## Regression Evidence

- ABW targeted regression:
  - `py -m pytest tests/test_abw_ingest.py tests/test_abw_json_hardening.py tests/test_abw_api.py tests/test_abw_runner.py`
  - `179 passed, 7 warnings`
- NVIDIA bridge regression:
  - `node tests/abw-cli-reader-bridge.test.mjs`
  - `59 passed, 0 failed`
- NVIDIA package regression:
  - `npm test` PASS
  - provider capability `16/0`
  - ABW bridge tests `59/0`
  - manual reliability `122/0`
  - apply proof `30/0`
  - move proof `71/0`
  - agent audit `25/25`
  - browser smoke PASS with known warning:
    - `Inline edit widget opens from selection: widget not observable in current smoke state`

## Historical Continuity

- Previous pilot fail (`REAL_USER_PILOT_FAIL_MUTATION_SAFETY`) remains valid historical truth and is preserved in:
  - `REAL_USER_PILOT_REPORT.md`
- This rerun pass does not rewrite or hide the prior fail.

## Residual Risks

- This is bounded safe/synthetic scope only.
- Not broad real private/work-document validation.
- Ingest rerun used an already-ingested workspace; draft-generation/review-required behavior was not re-proven in this rerun.
- Vietnamese bridge query returned safe no-match in this run; broader Vietnamese robustness still needs more data.
- Browser smoke inline edit warning remains.
- This rerun pass does not upgrade readiness to `DAILY_USE_READY`.

## Non-Claims

- not `DAILY_USE_READY`
- not production-ready
- not full bridge ready
- not write-back bridge
- not sync
- not Cognitive OS achieved
- not enterprise-grade security
- not packaging-ready
- not broad real-work-doc validation
