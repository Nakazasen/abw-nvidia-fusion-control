# REAL USER PILOT REPORT (Bounded)

## Verdict

REAL_USER_PILOT_FAIL_MUTATION_SAFETY

## Scope And Data Safety

- Pilot mode: bounded real-user pilot procedure executed with sanitized/synthetic docs only.
- No real private/work documents were used in this run.
- Forbidden data used: no.
- Sensitive/private snippets included in this report: no.

## Workspace

- Pilot workspace: `D:\Sandbox\_real_user_pilot\run_20260516_074745`
- Document set (safe only):
  - `raw/agv-technical-manual.txt`
  - `raw/maintenance-sop.txt`
  - `raw/troubleshooting-guide.txt`
  - `raw/ghi-chu-vn.txt`
  - `raw/unsupported.xyz` (intentional unsupported)
  - `raw/broken.docx` (intentional malformed)
- Manual reviewed wiki setup: yes.
  - `wiki/pilot-reviewed.md` created manually from sanitized content.
  - This was explicit pilot setup, not auto-promotion.

## Ingest Result

- Command: `py -m abw.cli --workspace <ws> --json ingest raw`
- Result status: `success`
- `ingested`: `4`
- `skipped`: `2`
- `unsupported_files`: `raw/unsupported.xyz`
- `parse_errors`: `raw/broken.docx` invalid zip container
- `generated_drafts`:
  - `drafts/agv-technical-manual_draft.md`
  - `drafts/ghi-chu-vn_draft.md`
  - `drafts/maintenance-sop_draft.md`
  - `drafts/troubleshooting-guide_draft.md`
- `review_required`: `true`
- `promotion_performed`: `false`
- Warnings preserved:
  - `1 unsupported file(s) skipped.`
  - `1 parse error file(s) skipped.`
  - `Drafts were created and still require review before any trusted wiki use.`

## Direct ABW Read-Only Results

Environment: `ABW_READ_ONLY_QUERY=1`

1. `q1_direct_factual`
- status: `success`
- retrieval_status: `exact_match`
- trust_score: `72`
- evidence tier: `E2_wiki`
- sources: `wiki/pilot-reviewed.md`
- warnings: none
- gap_log_suppressed: `false`
- would_log_gap: `false`
- runtime_write_suppressed: `true`
- query-time mutation: yes (workspace-level; see Mutation Safety)

2. `q2_procedure`
- status: `success`
- retrieval_status: `fuzzy_match`
- trust_score: `70`
- evidence tier: `E2_wiki`
- sources: `wiki/pilot-reviewed.md`
- warnings: none
- gap_log_suppressed: `false`
- would_log_gap: `false`
- runtime_write_suppressed: `true`
- query-time mutation: yes (workspace-level; see Mutation Safety)

3. `q3_troubleshooting`
- status: `success`
- retrieval_status: `fuzzy_match`
- trust_score: `70`
- evidence tier: `E2_wiki`
- sources: `wiki/pilot-reviewed.md`
- warnings: none
- gap_log_suppressed: `false`
- would_log_gap: `false`
- runtime_write_suppressed: `true`
- query-time mutation: yes (workspace-level; see Mutation Safety)

4. `q4_vietnamese`
- status: `success`
- retrieval_status: `fuzzy_match`
- trust_score: `70`
- evidence tier: `E2_wiki`
- sources: `wiki/pilot-reviewed.md`
- warnings: none
- gap_log_suppressed: `false`
- would_log_gap: `false`
- runtime_write_suppressed: `true`
- query-time mutation: yes (workspace-level; see Mutation Safety)

5. `q5_missing_source`
- status: `success`
- retrieval_status: `fuzzy_match`
- trust_score: `72`
- evidence tier: `E2_wiki`
- sources: `wiki/pilot-reviewed.md`
- warnings: none
- gap_log_suppressed: `false`
- would_log_gap: `false`
- runtime_write_suppressed: `true`
- query-time mutation: yes (workspace-level; see Mutation Safety)
- note: this was intended as missing-source but returned sourced success.

6. `q6_ambiguous_weak`
- status: `no_match`
- retrieval_status: `no_match`
- trust_score: `0`
- evidence tier: null
- sources: none
- warnings: `No supporting sources were returned.`
- gap_log_suppressed: `false`
- would_log_gap: `false`
- runtime_write_suppressed: `false`
- query-time mutation: yes (workspace-level; see Mutation Safety)

## NVIDIA Bridge/UI Results

Environment:
- `ABW_REPO_PATH=D:\Sandbox\skill-Anti-brain-wiki_note`
- trusted workspace switched via `/api/workspace`

Bridge runtime checks:
- `/proxy/abw/version`: `ABW_CLI_OK`, runtimeSource=`repo`, readOnly=`true`.
- `/proxy/abw/doctor`: `ABW_CLI_OK`, ABW status=`warning` with structured checks/warnings.

Question path (`POST /proxy/abw/ask`):

1. Direct factual
- bridge status: `ABW_CLI_OK`
- ABW status: `success`
- display quality: clear answer text returned
- trust/evidence/source: visible (`72`, `E2_wiki`, `wiki/pilot-reviewed.md`)
- warnings display: none
- read-only indicators: `readOnly=true`, runtimeSource=`repo`

2. Procedure
- bridge status: `ABW_CLI_OK`
- ABW status: `success`
- trust/evidence/source visible (`70`, `E2_wiki`, `wiki/pilot-reviewed.md`)
- warnings display: none
- read-only indicators: present

3. Troubleshooting
- bridge status: `ABW_CLI_OK`
- ABW status: `success`
- trust/evidence/source visible (`70`, `E2_wiki`, `wiki/pilot-reviewed.md`)
- warnings display: none
- read-only indicators: present

4. Vietnamese
- bridge status: `ABW_CLI_OK`
- ABW status: `success`
- trust/evidence/source visible (`70`, `E2_wiki`, `wiki/pilot-reviewed.md`)
- warnings display: none
- read-only indicators: present

5. Missing-source
- bridge status: `ABW_CLI_OK`
- ABW status: `success`
- trust/evidence/source visible (`72`, `E2_wiki`, `wiki/pilot-reviewed.md`)
- warnings display: none
- read-only indicators: present
- note: intended missing-source behavior did not abstain.

6. Ambiguous/weak
- bridge status: HTTP `502`
- bridge error status body: `ABW_CLI_NONZERO_EXIT` (`exitCode=3`)
- display quality: failed response path
- trust/evidence/source display: unavailable due failure
- warnings display: unavailable due failure
- read-only indicators: payload still marked `readOnly=true`, runtimeSource=`repo`

UI `/abw-ask ...` path:
- not manually exercised in an interactive browser session during this run.
- API bridge path was exercised directly through `/proxy/abw/*`.

## Mutation Safety

- Control repo clean after pilot: yes.
- NVIDIA repo clean after pilot: yes.
- ABW repo clean after pilot: yes.
- pending edits created: no.
- Apply called: no.
- sync/write-back called: no.
- execute_command through bridge: no evidence observed.
- Query-time workspace mutation in read-only mode: **yes**.
  - `.brain` file count changed from `10` to `13` during direct ABW query phase.
  - additional runtime artifacts observed under `.brain/acceptance_requests` and `.brain/runner_artifacts`.

## Regression Results

- NVIDIA `npm test`: PASS
  - provider capability: PASS `16/0`
  - ABW reader bridge tests: PASS `53/0`
  - manual reliability: PASS `122/0`
  - apply proof: PASS `30/0`
  - move proof: PASS `71/0`
  - agent audit: PASS `25/25`
  - browser smoke: PASS with known warning:
    - `Inline edit widget opens from selection: widget not observable in current smoke state`
- ABW targeted test suite:
  - `py -m pytest tests/test_abw_ingest.py tests/test_abw_json_hardening.py tests/test_abw_api.py tests/test_abw_runner.py`
  - PASS `177 passed`

## Subjective Usefulness

- usefulness: partial
- what worked:
  - ingest diagnostics are explicit and useful.
  - bridge metadata/read-only indicators are visible and structured.
  - most known/procedure/troubleshooting/Vietnamese asks return useful grounded-style output.
- what blocked daily usage:
  - mutation-safety expectation failed under direct read-only ask path (`.brain` changed during queries).
  - intended missing-source question returned sourced success.
  - one ambiguous ask failed on bridge with `502 / ABW_CLI_NONZERO_EXIT`.

## Blockers

- Blocker 1: query-time workspace mutation occurred in read-only mode.
- Blocker 2: missing-source trust behavior did not abstain for supplier-contract style question.
- Blocker 3: ambiguous bridge ask failed with `ABW_CLI_NONZERO_EXIT`.

## Non-Claims

- not `DAILY_USE_READY`
- not production-ready
- not full bridge ready
- not enterprise-ready
- pilot scope remains bounded
- parser coverage remains bounded
- browser smoke inline edit warning remains open
