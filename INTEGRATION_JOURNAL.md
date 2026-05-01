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
- NVIDIA next sprint was `Sprint 2: Context Picker` at that time.
- NVIDIA already had shared `agent-core`, pending edits, command jobs, extension host, and MCP infrastructure.
- `npm run agent:audit` is a capability harness, not end-to-end bridge proof.
- No executable ABW bridge was implemented in NVIDIA.

Conclusion:

- The control repo had drifted behind observed reality.
- The bridge contract had to be upgraded before any bridge coding starts.

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
- Sprint 3 had not started at that time.

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
- Sprint 4 had not started at that time
- `npm run agent:audit` is capability evidence, not full end-to-end proof
- rerun/attach were not fully browser E2E verified
- full `/proxy/chat` provider completion was not executed
- `@abw`, `@wiki`, `@gaps`, `@route`, `@decision` remained placeholders only

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
- Sprint 5 had not started at that time
- `@abw`, `@wiki`, `@gaps`, `@route`, `@decision` remained placeholders only

## 2026-04-30 - NVIDIA Sprint 5 Extension UX Toi Thieu Committed And Pushed

NVIDIA Sprint 5 is completed and pushed in `D:\Sandbox\Nvidia`.

Push evidence:

- Commit hash: `9f5e0cf9b47558ba6f71b90d2438a92809ec7e93`
- Commit short hash: `9f5e0cf`
- Commit message: `feat: add Sprint 5 extension UX`
- Push result: `6c93858..9f5e0cf main -> main`
- Local HEAD after push: `9f5e0cf9b47558ba6f71b90d2438a92809ec7e93`
- Remote `origin/main` after push: `9f5e0cf9b47558ba6f71b90d2438a92809ec7e93`
- Local HEAD equals remote main: `YES`
- `git status --short` after push: clean

Verification evidence recorded from NVIDIA Sprint 5 close:

- `node --check tools\nvidia-server.mjs` passed
- `node --check tools\nvidia-cli-agent.mjs` passed
- `node --check tools\extension-host.mjs` passed
- `node --check tools\agent-core.mjs` passed
- `npm run agent:audit` passed `25/25`
- Inline HTML script parse check passed
- Mojibake scan required patterns passed with final count `0`
- `non_ascii_lines=0` in `nvidia_playground.html`
- Extension backend smoke passed:
  - `GET /api/extensions`
  - `GET /api/agent_providers`
  - `GET /api/extensions/search?q=json&size=5`
- Fixture extension lifecycle smoke passed:
  - `install_without_header_status=403`
  - `install_status=success ext_id=localtest.hello-ext`
  - `activate_status=success`
  - `run_status=success result=hello-ok`
  - `disable_enabled=False`
  - `run_when_disabled_status=500`
  - `uninstall_status=success`

Sprint 5 scope implemented:

- backend-truth Extensions panel
- installed extensions list
- enabled/disabled state
- registered extension commands
- agent providers
- local folder install path
- VSIX install path
- Open VSX search/install path
- activate/enable/disable/uninstall paths
- minimal command palette with `Ctrl+Shift+P`
- Enterprise-mode extension guards

Codex audit/fix highlights:

- fixed activation crash caused by `subscriptions` undefined
- removed duplicate `toggleBottomPanel`
- added `showExtensionDetail` IDE guard
- completed hard mojibake cleanup

Explicit limitations:

- no browser E2E visual validation
- `npm run agent:audit` is not full E2E proof
- no ABW bridge implemented
- Sprint 6 had not started at that time

## 2026-04-30 - NVIDIA Sprint 6 Monaco Workbench Committed And Pushed

NVIDIA Sprint 6 is completed and pushed in `D:\Sandbox\Nvidia`.

Push evidence:

- Commit hash: `7975266ae7041e10a2445737ce619c54dd16c7df`
- Commit short hash: `7975266`
- Commit message: `feat: add Sprint 6 Monaco workbench`
- Push result: `9f5e0cf..7975266 main -> main`
- Local HEAD after push: `7975266ae7041e10a2445737ce619c54dd16c7df`
- Remote `origin/main` after push: `7975266ae7041e10a2445737ce619c54dd16c7df`
- Local HEAD equals remote main: `YES`
- `git status --short` after push: clean

Verification evidence recorded from NVIDIA Sprint 6 close:

- `node --check tools\nvidia-server.mjs` passed
- `node --check tools\nvidia-cli-agent.mjs` passed
- `node --check tools\extension-host.mjs` passed
- `node --check tools\agent-core.mjs` passed
- `npm run agent:audit` passed `25/25`
- Inline HTML script parse check passed
- Mojibake scan required patterns passed with final count `0`
- Multi-tab editor static/headless check passed
- Save-path smoke passed with trust/approval checks:
  - `read_before=alpha`
  - `write_without_header_status=403`
  - `write_with_header_status=success`
  - pending edit applied
  - `read_after=bravo`
  - `temp_file_removed=true`

Sprint 6 scope implemented:

- Monaco workbench-style multi-tab editor
- open/switch/close tabs
- duplicate-tab prevention
- per-tab dirty tracking
- Save / Save All
- recent files path-only localStorage
- `Ctrl+S` / `Ctrl+Shift+S`
- `beforeunload` dirty warning

Explicit limitations:

- no browser E2E visual validation
- `npm run agent:audit` is not full E2E proof
- split editor not implemented
- no ABW bridge implemented
- Sprint 7 had not started at that time

## 2026-04-30 - NVIDIA Sprint 7 Semantic Index Cache Committed And Pushed

NVIDIA Sprint 7 is completed and pushed in `D:\Sandbox\Nvidia`.

Push evidence:

- Commit hash: `03d2ae0c9f1a8f7ddc3677948b6b10f42b9b4141`
- Commit short hash: `03d2ae0`
- Commit message: `feat: add Sprint 7 semantic index cache`
- Push result: `7975266..03d2ae0 main -> main`
- Local HEAD after push: `03d2ae0c9f1a8f7ddc3677948b6b10f42b9b4141`
- Remote `origin/main` after push: `03d2ae0c9f1a8f7ddc3677948b6b10f42b9b4141`
- Local HEAD equals remote main: `YES`
- `git status --short` after push: clean

Verification evidence recorded from NVIDIA Sprint 7 close:

- `node --check tools\nvidia-server.mjs` passed
- `node --check tools\nvidia-cli-agent.mjs` passed
- `node --check tools\extension-host.mjs` passed
- `node --check tools\agent-core.mjs` passed
- `npm run agent:audit` passed `25/25`
- Inline HTML script parse check passed
- Mojibake scan required patterns passed with final count `0`
- Index build/search smoke passed
- Incremental add/delete smoke passed
- Runtime `.nvidia-agent/index` files were not staged

Sprint 7 scope implemented:

- persistent `.nvidia-agent/index` cache
- `index-meta.json` / `index-files.json` / `index-chunks.json`
- `GET /api/index/status`
- `POST /api/index/build`
- `POST /api/index/refresh`
- `GET /api/index/search?q=...`
- `POST /api/index_search`
- lexical/offline provider fallback
- search ranking with lexical/path/exact/recent/git bonuses
- incremental refresh
- IDE-only Index Engine UI
- `@index` NVIDIA-side context attachment

Codex audit/fix highlights:

- fixed `skippedFiles` accounting
- added `scannedFiles` and `eligibleFiles` metadata

Explicit limitations:

- no browser E2E visual validation
- `npm run agent:audit` is not full E2E proof
- AST/symbol chunking not implemented
- no ABW bridge implemented
- Sprint 8 had not started at that time

## 2026-04-30 - NVIDIA Sprint 8 LSP Diagnostics / Problems Panel Committed And Pushed

NVIDIA Sprint 8 is completed and pushed in `D:\Sandbox\Nvidia`.

Push evidence:

- Commit hash: `09e8d8933f3ed0c4dd3b7855ad0ce443842ffccf`
- Commit short hash: `09e8d89`
- Commit message: `feat: add Sprint 8 diagnostics problems panel`
- Push result: `03d2ae0..09e8d89 main -> main`
- Local HEAD after push: `09e8d8933f3ed0c4dd3b7855ad0ce443842ffccf`
- Remote `origin/main` after push: `09e8d8933f3ed0c4dd3b7855ad0ce443842ffccf`
- Local HEAD equals remote main: `YES`
- `git status --short` after push: clean

Verification evidence recorded from NVIDIA Sprint 8 close:

- `node --check tools\nvidia-server.mjs` passed
- `node --check tools\nvidia-cli-agent.mjs` passed
- `node --check tools\extension-host.mjs` passed
- `node --check tools\agent-core.mjs` passed
- `npm run agent:audit` passed `25/25`
- Inline HTML script parse check passed
- diagnostics API smoke passed (`GET /api/diagnostics`, `POST /api/diagnostics/refresh`, `POST /api/diagnostics/clear`, `POST /api/diagnostics/update`)
- syntax-error smoke passed:
  - temp diagnostic detected
  - after delete and refresh, diagnostic removed
- Monaco marker sync debounced and bounded
- Problems UI uses safe `data-*` click binding
- `runManualCommand` regression fixed

Sprint 8 scope implemented:

- minimal diagnostics model
- Problems panel
- diagnostics API refresh/clear/update
- Monaco marker sync
- syntax-error diagnostics smoke
- file/line navigation to Monaco
- `@problems` uses real diagnostics context

Codex audit/fix highlights:

- fixed Problems UI payload binding (`diagnostics` vs `result`)
- fixed `renderProblems` filePath field handling
- removed risky inline `onclick` path injection
- added diagnostics validation, stable IDs, and dedupe
- fixed `runManualCommand` regression
- removed duplicate input/selection DOM block

Explicit limitations:

- minimal diagnostics layer, not full LSP server
- no browser E2E visual validation
- `npm run agent:audit` is not full E2E proof
- no ABW bridge implemented
- Sprint 9 has not started

## 2026-04-30 - Master Roadmap v1 Established

Reason:

- avoid sprint-by-sprint drift

Decision:

- create roadmap from Sprint 1 to Sprint 80+

Key ranges:

- Sprint 1-16 Internal Daily-Use Agent IDE
- Sprint 17-28 Cursor/Antigravity-like Agent IDE
- Sprint 29-40 ABW-Governed Internal Cognitive Workspace
- Sprint 41-52 Governed Knowledge Ingestion / Self-Growing Wiki v1
- Sprint 53-60 Self-Improving Agent IDE / Controlled Tool Generation
- Sprint 61-80 Enterprise Cognitive OS Runtime

Current state:

- Sprint 1-8 done, Sprint 9 next

Warning:

- control repo is the source of truth, not chat memory
