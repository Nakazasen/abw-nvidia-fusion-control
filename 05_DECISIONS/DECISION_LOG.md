# Decision Log (Derived From Local Governance + Repo Reality)

Date: 2026-05-17

## Ownership

- Owner: Governance Recorder
- Role: Derived working decision notes tied to local audit state

## SOURCE OF TRUTH

- Canonical accepted decisions: `05_DECISIONS/DECISIONS.md`

## DO NOT DUPLICATE

- Do not treat this file as authoritative for long-term accepted decisions.
- Promote accepted entries into `05_DECISIONS/DECISIONS.md` and keep this as supporting context.

## D-2026-05-17-01: Keep Local-First Truth Order

- Decision: Governance and architecture state must be inferred from local repos before remote comparison.
- Status: Accepted and applied in this audit.
- Evidence:
  - All three repos inspected for status/HEAD/commit history.
  - NVIDIA local dirty sprint state detected despite matching remote commit hash.

## D-2026-05-17-02: Preserve Current Readiness Label Without Promotion

- Decision: Keep readiness at `BOUNDED_DAILY_USE_CANDIDATE_LOCAL_FILE_WORKFLOWS`.
- Status: Accepted.
- Rationale:
  - Existing milestones are bounded and non-production by explicit governance language.
  - No new broad real-data evidence was added in this audit.

## D-2026-05-17-03: Treat NVIDIA Local Uncommitted Work as In-Progress

- Decision: Record NVIDIA uncommitted UI/server/test deltas as active sprint state, not accepted milestone closure.
- Status: Accepted.
- Evidence:
  - `docs/abw-non-tech-ui-quickstart.md`
  - `nvidia_playground.html`
  - `tools/abw-cli-reader.mjs`
  - `tools/browser-smoke.mjs`
  - `tools/nvidia-server.mjs`
  - `tests/abw-cli-reader-bridge.test.mjs`
  - `tests/fixtures/mock-abw-cli.mjs`

## D-2026-05-17-04: Keep Bridge Boundary Conservative

- Decision: Maintain read-only ABW ask boundary and trust-gated ingest boundary as current safe operating line.
- Status: Accepted.
- Rationale:
  - Governance posture and local code trajectory both emphasize mutation safety, trust gates, and honest no-match behavior.

