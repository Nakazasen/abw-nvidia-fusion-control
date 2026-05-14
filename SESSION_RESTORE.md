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
- ABW `be20a03f01ad8d89e02b2adc6bc10941df683728` clean
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
- Bridge-contract limitation:
  - NVIDIA bridge is not implemented yet
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
