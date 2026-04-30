# Integration Journal

This file records the shared ABW x NVIDIA integration history in the control repo.

## 2026-04-30 - Control Repo Created

Control workspace established at:

```text
D:\Sandbox\ABW_NVIDIA_FUSION_CONTROL
```

Initial operating principles:

- NVIDIA remains the product shell and active agent runtime.
- ABW remains the canonical governance engine and constitutional layer.
- Source trees are not merged.
- Integration proceeds through shared philosophy, explicit contract, and bridge work.

## 2026-04-30 - ABW Architecture Audit Recorded

Observed from ABW-side audit artifacts:

- ABW is larger than its minimal CLI framing suggests.
- ABW already contains adaptive routing, grounded memory, continuation control, evidence gates, and local API surfaces.
- ABW should be treated as the canonical governance engine, not as a product shell.
- CLI bridge should come before any FastAPI or service bridge.
- No NVIDIA integration was proven in that audit pass.

## 2026-04-30 - Reality Sync Review

Observed repositories reviewed for current-state sync:

- ABW repo reviewed from local source and `docs/ABW_ARCHITECTURE_AUDIT_2026-04-30.md`.
- NVIDIA repo reviewed from local source and `.nvidia-agent/reports/audit-nvidia-abw-fusion-2026-04-30.md`.
- Control repo reviewed against its current governance documents.

Observed reality:

- ABW current governance/runtime baseline is `v1.1.0`.
- ABW observed surface includes `/ask`, `/route-query`, `/workspace-intel`, `/gaps`, workspace registry, trust scoring, retrieval status, sources, and warnings handling.
- ABW architectural framing is Hybrid ABW with a 4-tier and 6-lane operating model.
- Remaining ABW risks still include release-truth drift, warnings discipline, encoding issues, and no newly confirmed HMAC audit evidence.
- NVIDIA Sprint 1 Composer/Diff UX is complete.
- NVIDIA next sprint is `Sprint 2: Context Picker`.
- NVIDIA already has shared `agent-core`, pending edits, command jobs, extension host, and MCP infrastructure.
- `npm run agent:audit` is a capability harness, not end-to-end bridge proof.
- No executable ABW bridge is implemented in NVIDIA yet.

Conclusion:

- The control repo had drifted behind observed reality.
- The bridge contract must be upgraded before any bridge coding starts.

## 2026-04-30 - NVIDIA Sprint 2 Context Picker Committed And Pushed

NVIDIA Sprint 2 is completed and pushed in `D:\Sandbox\Nvidia`.

Push evidence:

- Commit hash: `2357eca3c485d7a51c12578139905e7d97763436`
- Commit message: `feat: add Sprint 2 context picker`
- Push result: `b61266e..2357eca main -> main`
- Local HEAD after push: `2357eca3c485d7a51c12578139905e7d97763436`
- Remote `origin/main` after push: `2357eca3c485d7a51c12578139905e7d97763436`
- Local HEAD equals remote main: `YES`
- `git status --short` after push: clean

Verification evidence recorded from NVIDIA Sprint 2 close:

- `node --check tools\nvidia-server.mjs` passed (exit 0)
- `node --check tools\nvidia-cli-agent.mjs` passed (exit 0)
- `node --check tools\extension-host.mjs` passed (exit 0)
- `node --check tools\agent-core.mjs` passed (exit 0)
- `npm run agent:audit` returned `ok true`, `25/25`
- Inline HTML script parse check: OK
- `/proxy/chat` context payload smoke: HTTP 200

Sprint 2 context picker scope implemented for:

- `@file`
- `@folder`
- `@git`
- `@terminal`
- `@selection`
- `@problems`

Future ABW context placeholders are reserved but disabled:

- `@abw`
- `@wiki`
- `@gaps`
- `@route`
- `@decision`

Explicit limitations:

- ABW bridge is not implemented.
- `npm run agent:audit` is capability evidence, not full end-to-end proof.
- Sprint 3 has not started.

## 2026-04-30 - NVIDIA Sprint 3 Terminal/Job Manager UX Committed And Pushed

NVIDIA Sprint 3 is completed and pushed in `D:\Sandbox\Nvidia`.

Push evidence:

- Commit hash: `745711380bc86c648290296bc02b7ecff885a1cb`
- Commit short hash: `7457113`
- Commit message: `feat: add Sprint 3 job manager UX`
- Push result: `2357eca..7457113 main -> main`
- Local HEAD after push: `745711380bc86c648290296bc02b7ecff885a1cb`
- Remote `origin/main` after push: `745711380bc86c648290296bc02b7ecff885a1cb`
- Local HEAD equals remote main: `YES`
- `git status --short` after push: clean

Verification evidence recorded from NVIDIA Sprint 3 close:

- `node --check tools\nvidia-server.mjs` passed (exit 0)
- `node --check tools\nvidia-cli-agent.mjs` passed (exit 0)
- `node --check tools\extension-host.mjs` passed (exit 0)
- `node --check tools\agent-core.mjs` passed (exit 0)
- `npm run agent:audit` returned `ok true`, `25/25`
- Inline HTML script parse check: OK
- Short command job smoke: completed, output `job smoke ok` appeared exactly once
- Cancel job smoke: status transitioned to `cancelled`
- `/api/command_jobs` list worked
- `/proxy/chat` `contextTerminalJobs` path did not crash local server path

Sprint 3 scope implemented:

- Job Manager panel
- running/completed/failed/cancelled job display
- view output
- cancel job
- rerun job UI/path
- attach job output to chat context path
- incremental stdout/stderr polling
- offset-safe stdout/stderr chunking

Codex audit/fix highlights:

- fixed command-job stdout/stderr duplication risk
- added `stdoutNextOffset` / `stderrNextOffset` for offset-safe paging

Explicit limitations:

- ABW bridge is not implemented
- Sprint 4 has not started
- `npm run agent:audit` is capability evidence, not full end-to-end proof
- rerun/attach were not fully browser E2E verified
- full `/proxy/chat` provider completion was not executed
- `@abw`, `@wiki`, `@gaps`, `@route`, `@decision` remain placeholders only

## 2026-04-30 - NVIDIA Sprint 4 Enterprise/IDE Mode Toggle Committed And Pushed

NVIDIA Sprint 4 is completed and pushed in `D:\Sandbox\Nvidia`.

Push evidence:

- Commit hash: `6c93858230bb6cef67d2085575bee339d805844b`
- Commit short hash: `6c93858`
- Commit message: `feat: add Sprint 4 enterprise IDE mode toggle`
- Push result: `7457113..6c93858 main -> main`
- Local HEAD after push: `6c93858230bb6cef67d2085575bee339d805844b`
- Remote `origin/main` after push: `6c93858230bb6cef67d2085575bee339d805844b`
- Local HEAD equals remote main: `YES`
- `git status --short` after push: clean

Verification evidence recorded from NVIDIA Sprint 4 close:

- `node --check tools\nvidia-server.mjs` passed (exit 0)
- `node --check tools\nvidia-cli-agent.mjs` passed (exit 0)
- `node --check tools\extension-host.mjs` passed (exit 0)
- `node --check tools\agent-core.mjs` passed (exit 0)
- `npm run agent:audit` returned `ok true`, `25/25`
- Inline HTML script parse check passed
- Enterprise mode safety static check passed
- Profile API smoke passed:
  - `GET /api/profile` returned enterprise profile
  - `POST /api/profile {"uiMode":"enterprise"}` persisted enterprise
  - `POST /api/profile {"uiMode":"ide"}` persisted ide
  - `POST /api/profile {"uiMode":"bad"}` returned `400`
  - final profile was restored to enterprise

Sprint 4 scope implemented:

- `uiMode` supports `enterprise` and `ide`
- Enterprise mode hides dangerous IDE surfaces
- IDE mode restores full workbench
- localStorage persistence uses `nvidia.uiMode`
- backend profile API exposes `GET /api/profile` and `POST /api/profile`
- profile is stored at `.nvidia-agent/profile.json`
- invalid `uiMode` is rejected with `400`
- `Ctrl+Alt+Shift+I` toggles mode
- URL mode parsing supports `?mode=ide` and `?mode=enterprise`

Codex audit/fix highlights:

- fixed Enterprise mode exposures for code viewer
- fixed Enterprise mode exposures for pinned context
- fixed Enterprise mode exposures for slash menu
- fixed Enterprise mode exposures for pending edit cards
- fixed Enterprise mode exposures for Auto-Accept
- fixed Enterprise mode exposures for the legacy destructive frontend path
- added profile `enabledPanels` sanitization so Enterprise mode does not persist IDE-only panels

Explicit limitations:

- no full browser E2E visual mode switching was run
- `npm run agent:audit` is capability evidence, not full end-to-end proof
- no ABW bridge is implemented
- Sprint 5 has not started
- `@abw`, `@wiki`, `@gaps`, `@route`, `@decision` remain placeholders only
