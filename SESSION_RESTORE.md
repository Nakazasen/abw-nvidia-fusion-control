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
- NVIDIA `e9c6493253d165724a39abdcb7ca291e995aff21` clean
- ABW `401d9d1f985c20bf8a57cc31b385296ffdc89954` clean
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
- Trust refinement:
  - `ABW Query/Retrieval Trust Sprint` completed at `401d9d1f985c20bf8a57cc31b385296ffdc89954`
  - wiki is preferred over weaker raw/draft hits when both are present
  - weak local evidence now maps to `E1_fallback` / `raw_or_draft_only`
  - weak evidence warnings are explicit
  - no-match honesty remains preserved
  - read-only ask smoke left `.brain` untouched `0 -> 0`
  - readable UTF-8 Vietnamese grounded query baseline is now covered
- UI/server refinement:
  - NVIDIA UI/server now displays ABW read-only answer trust details
  - `/abw-ask ...` renders an `ABW Read-Only Answer` card in the chat surface
  - visible fields include answer, retrieval status, trust score, evidence tier, sources, warnings, read-only indicators, and explicit no-match state
  - `/proxy/abw/ask` now includes `readOnly: true` and `evidenceTier` while preserving the original `abw` envelope
  - read-only boundary remains explicit: no pending edits, no Apply, no `execute_command`, no sync, no auto-promote, no write-back
- Residual limit:
  - Vietnamese robustness is not fully solved beyond tested paths
  - this is not a full bridge
  - not write-back
  - not sync
  - not auto-apply
  - ABW query quality remains bounded by ingest/retrieval quality
  - broad real-provider matrix remains unproven
- Remaining estimate:
  - `6-13` large prompts remain
- Evidence:
  - `node tests/abw-cli-reader-bridge.test.mjs` PASS `44/0`
  - `npm test` PASS
  - proof doc exists at `docs/bridge-phase-1-abw-cli-reader.md`
  - ABW targeted tests `123 passed`
  - ABW full pytest `724 passed`
  - ABW wheel build `PASS`
  - repo-source CLI read-only smoke PASS
  - `.brain` before/after asks `0 -> 0`
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

- `ABW ingest reliability sprint`
- real-workspace daily-use rehearsal
- stop and preserve clean state
- broader provider matrix audit
- browser smoke warning investigation
- optional ds2api experimental read-only provider risk audit
