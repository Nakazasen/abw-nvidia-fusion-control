# SPRINT B VIETNAMESE INGEST RERUN REPORT (Bounded Audit Evidence)

## Sprint And Verdict

- Sprint:
  - `INSERT_VIETNAMESE_ROBUSTNESS_AND_INGEST_RERUN_SPRINT`
- Builder result:
  - `SPRINT_B_NO_CODE_CHANGE_EVIDENCE_PASS`
- Auditor verdict:
  - `SPRINT_B_AUDIT_PASS`

## Scope

- bounded audit evidence only
- synthetic/sanitized safe docs only
- no private/work docs
- read-only query boundary only (`ABW_READ_ONLY_QUERY=1`)
- no write-back, no sync, no Apply flow in this audit

## Repo Integrity At Audit Time

- Control:
  - clean, local=remote, HEAD `9d286c86a7b5e4ed99f0a54482cf2a3dbae703da`
- NVIDIA:
  - clean, local=remote, HEAD `f8606f05e42d6a7e2cbcbdda11e444755324d14c`
- ABW:
  - clean, local=remote, HEAD `f753881c11f51cbae6cdddffc40d4050d7603b83`

## Fresh Ingest Evidence

- Audit workspace:
  - `D:\Sandbox\_real_user_pilot\fresh_ingest_vi_audit_20260516_124153`
- Ingest command:
  - `py -m abw.cli --workspace <ws> --json ingest raw`
- Observed result:
  - `ingested=4`
  - `skipped=2`
  - `generated_drafts=4`
  - `review_required=true`
  - `unsupported_files` includes `raw/unsupported.xyz`
  - `parse_errors` includes `raw/broken.docx` invalid zip container
  - `promotion_performed=false`
  - `duplicate_count=0`
- Warnings surfaced:
  - `1 unsupported file(s) skipped.`
  - `1 parse error file(s) skipped.`
  - `Drafts were created and still require review before any trusted wiki use.`

## Manual Reviewed Wiki Setup

- Manually prepared from synthetic content:
  - `wiki/pilot-reviewed.md`
- Coverage in reviewed wiki:
  - AGV protocol
  - shift/maintenance checks
  - battery threshold
  - Vietnamese equivalent facts
- Missing-source topics (supplier contract approval) intentionally excluded.

## Vietnamese And Source-Trust Evidence

- Known-safe Vietnamese query:
  - `Giao thuc AGV la gi?`
  - result:
    - `status=success`
    - `retrieval_status=grounded`
    - `evidence tier=E2_wiki`
    - `trust_score=72`
    - `source=wiki/pilot-reviewed.md`
- English missing-source query:
  - `Who approves supplier contract signoff?`
  - result:
    - `status=no_match`
    - `retrieval_status=no_match`
    - `evidence tier=E0_unknown`
    - `trust_score=0`
    - `sources=[]`
- Vietnamese missing-source query:
  - `Nha cung cap nao phe duyet hop dong?`
  - result:
    - `status=no_match`
    - `retrieval_status=no_match`
    - `evidence tier=E0_unknown`
    - `trust_score=0`
    - `sources=[]`
- Ambiguous/weak query:
  - safe `no_match/E0`
  - no false strong `E2` overclaim

## Read-Only Mutation Safety Evidence

- Read-only flag:
  - `ABW_READ_ONLY_QUERY=1`
- `.brain` file count before query batch:
  - `10`
- `.brain` file count after query batch:
  - `10`
- file list changed:
  - `false`
- query-time artifacts not created:
  - no `.brain/acceptance_requests/*`
  - no `.brain/runner_artifacts/*`
  - no nonce logs
  - no negative-memory logs

## Regression Evidence

- ABW targeted tests:
  - `py -m pytest tests/test_abw_ingest.py tests/test_abw_json_hardening.py tests/test_abw_api.py tests/test_abw_runner.py`
  - `179 passed, 7 warnings`
- NVIDIA bridge tests:
  - not rerun in Sprint B audit because NVIDIA was unchanged in this sprint

## Interpretation

- Sprint B provides bounded strengthening evidence for:
  - fresh ingest behavior on a completely new workspace
  - Vietnamese known-safe retrieval behavior
  - missing-source honesty in both English and Vietnamese
  - read-only query-time no-mutation safety
- Sprint B does not upgrade readiness.

## Residual Risks

- bounded/safe/synthetic scope only
- not broad real private/work-document validation
- NVIDIA bridge tests not rerun in Sprint B audit because NVIDIA was unchanged
- browser smoke inline edit warning remains:
  - `Inline edit widget opens from selection: widget not observable in current smoke state`

## Non-Claims

- not `DAILY_USE_READY`
- not production-ready
- not full bridge ready
- not Cognitive OS achieved
- not enterprise-grade security
- not packaging-ready
- not broad real-work-doc validation
