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

- Control `3f5d4abf5755645033fb377e67dec05129a44fae` clean
- NVIDIA `3d32881a567ed15791dc44d499bf6f2d6c581e09` clean
- ABW `de1d8560d3a26000fb113e0acbfe947bd785f721` clean
- Current readiness: `BOUNDED_DAILY_USE_CANDIDATE_LOCAL_FILE_WORKFLOWS`
- Internal scoped label: `LOCAL_FILE_WORKFLOW_VALIDATED_CANDIDATE`
- Latest result: `ABW_QUERY_HONESTY_COMMITTED_AND_PUSHED`
- Closed blocker:
  - supplier-contract missing-source query no longer succeeds from draft boilerplate
- Accepted evidence:
  - ABW targeted tests `127/0`
  - ABW full pytest `730/0`
  - ABW wheel build `PASS`
  - mini rehearsal supplier-contract query `no_match` / `E0_unknown` / no source
  - query-time `.brain` mutation `no`
- Residual limits:
  - not `DAILY_USE_READY`
  - not production-ready
  - not full bridge ready
  - full daily-use rehearsal rerun remains pending
  - parser coverage remains bounded
  - broader Vietnamese robustness still needs more tests
  - browser smoke warning remains non-blocking:
    - `Inline edit widget opens from selection: widget not observable in current smoke state`
- Remaining estimate:
  - `4-11` large prompts remain

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

- rerun full daily-use rehearsal
- browser smoke warning investigation
- stop and preserve clean state
