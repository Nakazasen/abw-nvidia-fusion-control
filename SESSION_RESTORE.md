# Session Restore

## Control Repo

- `D:\Sandbox\ABW_NVIDIA_FUSION_CONTROL`

## Restore Order

1. Verify exact repo path.
2. Run `git status --short --untracked-files=all`.
3. Run `git rev-parse HEAD`.
4. Compare local `HEAD` against the latest recorded Control state.
5. Read `HANDOFF.md`.
6. Read `DECISIONS.md` and `RISKS.md`.
7. Only then inspect implementation repos if scope requires it.

## Latest Accepted Mirror State

- Control `719b0d84cd8d5f835968b62fee135c9b160e7531` clean
- NVIDIA `f8606f05e42d6a7e2cbcbdda11e444755324d14c` clean
- ABW `f753881c11f51cbae6cdddffc40d4050d7603b83` clean
- Current readiness: `BOUNDED_DAILY_USE_CANDIDATE_LOCAL_FILE_WORKFLOWS`
- Internal scoped label: `LOCAL_FILE_WORKFLOW_VALIDATED_CANDIDATE`
- Latest result: `REAL_USER_PILOT_RERUN_PASS_BOUNDED`
- Latest strengthening evidence result: `SPRINT_B_AUDIT_PASS`
- Latest gate decision: `A. PROCEED_TO_SMALL_SANITIZED_REAL_WORK_DOC_PILOT_PLANNING`
- Governance artifacts:
  - `PILOT_CHECKLIST.md`
  - `REAL_USER_PILOT_RERUN_REPORT.md`
  - `SPRINT_B_VIETNAMESE_INGEST_RERUN_REPORT.md`
  - `SMALL_REAL_WORK_DOC_PILOT_PLAN.md`
- Accepted evidence:
  - rerun workspace `D:\Sandbox\_real_user_pilot\rerun_20260516_095848`
  - bounded safe/synthetic scope only, read-only ABW bridge path only
  - direct ABW read-only query-time `.brain` unchanged `16 -> 16`
  - missing-source now `no_match` / trust `0` / `E0_unknown` / `sources=[]`
  - bridge classifiable ambiguous nonzero JSON now maps HTTP `200` + `ABW_CLI_AMBIGUOUS`
  - NVIDIA `npm test` `PASS`
  - NVIDIA bridge tests `59 PASS`
  - ABW targeted tests `179 PASS`
  - Sprint B fresh ingest audit workspace `D:\Sandbox\_real_user_pilot\fresh_ingest_vi_audit_20260516_124153`:
    - `ingested=4`, `generated_drafts=4`, `review_required=true`, `promotion_performed=false`, `duplicate_count=0`
    - `unsupported_files` includes `raw/unsupported.xyz`
    - `parse_errors` includes malformed `raw/broken.docx` invalid zip container
  - Sprint B read-only query audit:
    - known-safe Vietnamese `success` / `grounded` / `E2_wiki` / trust `72` / source `wiki/pilot-reviewed.md`
    - English and Vietnamese missing-source both `no_match` / `E0_unknown` / trust `0` / `sources=[]`
    - `.brain` unchanged `10 -> 10`, no query-time runtime artifacts added
- Residual limits:
  - not `DAILY_USE_READY`
  - not production-ready
  - not full bridge ready
  - not write-back bridge
  - not sync
  - not real private/work docs validated
  - safe/synthetic bounded pilot scope only
  - parser coverage remains bounded
  - not broad real private/work-doc validation
  - rerun report reused already-ingested workspace; fresh ingest behavior is now re-proved in Sprint B audit on a new workspace
  - broader Vietnamese robustness still needs more tests
  - NVIDIA bridge tests were not rerun in Sprint B audit because NVIDIA was unchanged
  - browser smoke warning remains non-blocking:
    - `Inline edit widget opens from selection: widget not observable in current smoke state`
  - small sanitized real-work pilot is still planning-only at this point (no run yet)
- Remaining estimate:
  - `0-7` large prompts remain

## Still Not Proven

- `DAILY_USE_READY`
- production-ready
- full bridge ready
- Cognitive OS achieved
- enterprise-grade security
- packaging-ready
- VS Code parity
- Cursor parity
- broader real-provider matrix
- broad sustained daily-use durability

## Resume From

- review/approve `SMALL_REAL_WORK_DOC_PILOT_PLAN.md`
- run sanitized small real-work pilot only after explicit approval
- browser smoke warning investigation
- stop and preserve clean state
