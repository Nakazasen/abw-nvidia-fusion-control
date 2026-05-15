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
- NVIDIA `a1c87a13234879a38529ce2d7fcfba8a2eaa0ee2` clean
- ABW `528742c18b4aac5a019dbc3c9877327f5393f882` clean
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
- Bridge milestone:
  - NVIDIA Phase 1 ABW CLI reader is implemented and pushed as a bounded read-only bridge
  - covered commands `version`, `doctor`, `ask`
  - endpoints `POST /proxy/abw/version`, `POST /proxy/abw/doctor`, `POST /proxy/abw/ask`
- Bridge smoke:
  - previous verdict `NVIDIA_ABW_SMOKE_FAIL_MUTATION_SAFETY`
  - current verdict `BRIDGE_MUTATION_SAFETY_FIXED_AND_SMOKE_PASSED`
  - ABW read-only bridge query mode now uses `ABW_READ_ONLY_QUERY=1`
  - real NVIDIA endpoint calls + real ABW CLI JSON are now proven with no target workspace mutation during bridge ask
- Residual limit:
  - Vietnamese robustness is not fully solved beyond tested paths
  - this is not a full bridge
  - not write-back
  - not sync
  - not auto-apply
  - ABW query quality remains bounded by ingest/retrieval quality
  - broad real-provider matrix remains unproven
- Remaining estimate:
  - `8-15` large prompts remain
- Evidence:
  - `node tests/abw-cli-reader-bridge.test.mjs` PASS `22/0`
  - `npm test` PASS
  - proof doc exists at `docs/bridge-phase-1-abw-cli-reader.md`
  - ABW targeted tests `120 passed`
  - ABW full pytest `721 passed`
  - ABW wheel build `PASS`
  - no target workspace mutation during direct or bridge read-only ask
  - no repo mutation
  - no pending edits
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

- `ABW Query/Retrieval Trust Sprint`
- `NVIDIA UI display refinement for ABW read-only answers`
- stop and preserve clean state
- broader provider matrix audit
- browser smoke warning investigation
- optional ds2api experimental read-only provider risk audit
