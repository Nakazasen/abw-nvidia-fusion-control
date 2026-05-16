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

- Control `fa866d4b0cdea9339bdcb5fe38db430a9101d9e8` clean
- NVIDIA `f8606f05e42d6a7e2cbcbdda11e444755324d14c` clean
- ABW `f753881c11f51cbae6cdddffc40d4050d7603b83` clean
- Current readiness: `BOUNDED_DAILY_USE_CANDIDATE_LOCAL_FILE_WORKFLOWS`
- Internal scoped label: `LOCAL_FILE_WORKFLOW_VALIDATED_CANDIDATE`
- Latest result: `REAL_USER_PILOT_RERUN_PASS_BOUNDED`
- Governance artifacts:
  - `PILOT_CHECKLIST.md`
  - `REAL_USER_PILOT_RERUN_REPORT.md`
- Accepted evidence:
  - rerun workspace `D:\Sandbox\_real_user_pilot\rerun_20260516_095848`
  - bounded safe/synthetic scope only, read-only ABW bridge path only
  - direct ABW read-only query-time `.brain` unchanged `16 -> 16`
  - missing-source now `no_match` / trust `0` / `E0_unknown` / `sources=[]`
  - bridge classifiable ambiguous nonzero JSON now maps HTTP `200` + `ABW_CLI_AMBIGUOUS`
  - NVIDIA `npm test` `PASS`
  - NVIDIA bridge tests `59 PASS`
  - ABW targeted tests `179 PASS`
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
  - ingest rerun reused already-ingested workspace; draft-generation/review-required behavior was not re-proven in that rerun
  - broader Vietnamese robustness still needs more tests
  - browser smoke warning remains non-blocking:
    - `Inline edit widget opens from selection: widget not observable in current smoke state`
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

- decide next bounded pilot expansion criteria
- browser smoke warning investigation
- stop and preserve clean state
