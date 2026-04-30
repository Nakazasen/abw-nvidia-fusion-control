# Handoff

## Current State

Reality-synced state as of 2026-04-30:

- ABW baseline is `v1.1.0` and should be treated as the current governance/runtime truth.
- ABW observed surface includes `/ask`, `/route-query`, `/workspace-intel`, `/gaps`, health/inspect APIs, multi-workspace registry, trust scoring, retrieval status, sources, and warnings handling.
- ABW architectural framing is Hybrid ABW with 4 tiers and 6 lanes.
- NVIDIA Sprint 1 Composer/Diff UX is complete.
- NVIDIA Sprint 2 `Context Picker` is complete and pushed.
- Latest NVIDIA remote `main` is `2357eca3c485d7a51c12578139905e7d97763436`.
- NVIDIA next planned sprint is `Sprint 3: Terminal/Job Manager UX`.
- NVIDIA already has shared `agent-core`, pending edits, command jobs, extension host, and MCP server infrastructure.
- `npm run agent:audit` is useful capability evidence, but it is not full end-to-end proof.
- Fusion bridge is not implemented yet.
- Integration strategy remains bridge-first, not source-merge-first.
- Control workspace remains `D:\Sandbox\ABW_NVIDIA_FUSION_CONTROL`.
- Do not claim Cognitive OS integration is complete.
- Do not claim ABW bridge exists.
- Do not rename `Sprint 3: Terminal/Job Manager UX`.

## Recovery Order For A New Session

Read these in order:

1. `D:\Sandbox\skill-Anti-brain-wiki_note\docs\ABW_ARCHITECTURE_AUDIT_2026-04-30.md`
2. `D:\Sandbox\skill-Anti-brain-wiki_note\README.md`
3. `D:\Sandbox\Nvidia\.nvidia-agent\reports\audit-nvidia-abw-fusion-2026-04-30.md`
4. `D:\Sandbox\Nvidia\README.md`
5. `D:\Sandbox\ABW_NVIDIA_FUSION_CONTROL\README.md`
6. `D:\Sandbox\ABW_NVIDIA_FUSION_CONTROL\ROADMAP.md`
7. `D:\Sandbox\ABW_NVIDIA_FUSION_CONTROL\DECISIONS.md`
8. `D:\Sandbox\ABW_NVIDIA_FUSION_CONTROL\RISKS.md`
9. `D:\Sandbox\ABW_NVIDIA_FUSION_CONTROL\INTEGRATION_JOURNAL.md`
10. `D:\Sandbox\ABW_NVIDIA_FUSION_CONTROL\BRIDGE_CONTRACT.md`
11. `D:\Sandbox\ABW_NVIDIA_FUSION_CONTROL\HANDOFF.md`

## Immediate Next Action

Prepare Sprint 3 planning while preserving current truth: Sprint 2 is pushed, bridge implementation does not exist yet, and Sprint 3 remains `Terminal/Job Manager UX`.

Constraints for the next builder:

- Keep bridge work CLI-first and API-second.
- Do not modify NVIDIA source or ABW source during contract-only work.
- Do not claim integration exists until a real bridge is implemented and verified.
