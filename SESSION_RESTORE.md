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

- Control `d0ee8d011c5197c32d2f404bfded4f75a36d1a96` clean
- NVIDIA `7639f441d7e39020d924e8014d68c86d8a0eb8d2` clean
- ABW `2a38ff25e4e238d8efc10271f93e12e519343bcc` clean
- Current readiness: `BOUNDED_DAILY_USE_CANDIDATE_LOCAL_FILE_WORKFLOWS`
- Internal scoped label: `LOCAL_FILE_WORKFLOW_VALIDATED_CANDIDATE`
- Closed blocker: `MANUAL_PATH_REVALIDATION_V3_FAIL` is closed; `MANUAL_PATH_REVALIDATION_V3_PASS` is the accepted manual result
- Closed validation hygiene gap: package-level `npm test` is now available and passes
- Closed ABW CLI bridge-contract gap:
  - covered commands `ask`, `doctor`, `version`, `ingest`, `review`
- Accepted ABW evidence:
  - targeted tests `117/0`
  - full tests `718/0`
  - wheel build `PASS`
- Latest ABW regression closure:
  - ABW CLI JSON known-query contract is stable on Windows short-path/long-path behavior
  - root cause: unresolved `workspace_root` before citation validation
  - known query now returns `status=success`
  - no-match query still returns `no_match`
  - JSON envelope remains preserved
- Bridge-contract limitation:
  - NVIDIA bridge is not implemented yet
- Residual limit:
  - Vietnamese robustness is not fully solved beyond tested paths
- Remaining estimate:
  - `10-17` large prompts remain
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
- broad sustained daily-use durability

## Resume From

- `NVIDIA Phase 1 ABW CLI Reader Sprint`
- stop and preserve clean state
- broader provider matrix audit
- browser smoke warning investigation
- optional ds2api experimental read-only provider risk audit
