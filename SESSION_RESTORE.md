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

- Control `9776b425fed74a9ec3e5fe63c026e4fcff43ff9d` clean
- NVIDIA `385f7af85350d6865095021b3ec03c5f5c34b90c` clean
- ABW `de1d8560d3a26000fb113e0acbfe947bd785f721` clean
- Current readiness: `BOUNDED_DAILY_USE_CANDIDATE_LOCAL_FILE_WORKFLOWS`
- Internal scoped label: `LOCAL_FILE_WORKFLOW_VALIDATED_CANDIDATE`
- Latest result: `DAILY_REHEARSAL_RERUN_PASS_COMMITTED_AND_PUSHED`
- Governance artifact added: `PILOT_CHECKLIST.md`
- Accepted evidence:
  - evidence doc `docs/daily-use-rehearsal-abw-read-only.md`
  - bounded rehearsal scope: synthetic/non-sensitive AGV docs only, read-only ABW bridge path, temporary workspace only
  - direct ABW JSON known/no-match/Vietnamese baseline verified
  - NVIDIA bridge/UI known/no-match/Vietnamese baseline verified
  - NVIDIA `npm test` `PASS`
  - ABW targeted tests `177 PASS`
  - query-time `.brain` mutation `no`
- Residual limits:
  - not `DAILY_USE_READY`
  - not production-ready
  - not full bridge ready
  - not write-back bridge
  - not sync
  - not real private/work docs validated
  - synthetic rehearsal scope only
  - parser coverage remains bounded
  - bounded real user pilot execution remains pending
  - broader Vietnamese robustness still needs more tests
  - browser smoke warning remains non-blocking:
    - `Inline edit widget opens from selection: widget not observable in current smoke state`
- Remaining estimate:
  - `2-9` large prompts remain

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

- run bounded real user pilot
- browser smoke warning investigation
- stop and preserve clean state
