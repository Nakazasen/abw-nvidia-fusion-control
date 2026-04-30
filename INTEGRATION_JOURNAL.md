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
