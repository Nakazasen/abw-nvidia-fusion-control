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

- Control `d78a2fea1292bd3cff6ef9fdbd6d90a1732e6eed` clean
- NVIDIA `207a30bce6bc3a9f9171dd236df789fa6ec10ca8` clean
- ABW `39d7e95635d3bee924122791a1ecfc29a0a878f4` clean
- Current readiness: `BOUNDED_DAILY_USE_CANDIDATE_LOCAL_FILE_WORKFLOWS`
- Closed blocker: `MANUAL_PATH_REVALIDATION_V3_FAIL` is closed; `MANUAL_PATH_REVALIDATION_V3_PASS` is the accepted manual result

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
- package-level npm test

## Resume From

- governance readiness review
- add package-level npm test script in NVIDIA
- broader provider matrix audit
- optional ds2api experimental read-only provider risk audit
- do not start bridge/sync/packaging without governance approval
