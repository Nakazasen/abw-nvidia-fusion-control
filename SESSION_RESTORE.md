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

- Control `840278ca6f778558075d5f3bf29f0ef015861dfd` clean
- NVIDIA `7639f441d7e39020d924e8014d68c86d8a0eb8d2` clean
- ABW `39d7e95635d3bee924122791a1ecfc29a0a878f4` clean
- Current readiness: `BOUNDED_DAILY_USE_CANDIDATE_LOCAL_FILE_WORKFLOWS`
- Closed blocker: `MANUAL_PATH_REVALIDATION_V3_FAIL` is closed; `MANUAL_PATH_REVALIDATION_V3_PASS` is the accepted manual result
- Closed validation hygiene gap: package-level `npm test` is now available and passes
- Known npm test warning:
  - `Inline edit widget opens from selection: widget not observable in current smoke state`

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

## Resume From

- governance readiness review
- broader provider matrix audit
- optional ds2api experimental read-only provider risk audit
- do not start bridge/sync/packaging without governance approval
