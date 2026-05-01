# ABW x NVIDIA Unified Roadmap

## Current Strategic Direction

The two repos continue independently but evolve toward one shared architecture:

- NVIDIA remains the product shell and active agent runtime.
- ABW remains the canonical governance engine.
- Integration happens through contract and bridge work, not source merging.

## Immediate Priority

- NVIDIA Sprint 2 `Context Picker` is complete.
- NVIDIA Sprint 3 `Terminal/Job Manager UX` is complete.
- NVIDIA Sprint 4 `Enterprise/IDE Mode Toggle` is complete.
- NVIDIA Sprint 5 `Extension UX Toi Thieu` is complete.
- NVIDIA Sprint 6 `Monaco Workbench / Multi-tab Editor` is complete.
- Next immediate NVIDIA work is `Sprint 7: Semantic Index Cache / Context Engine`.
- Keep bridge work separate: ABW bridge remains planned but not implemented.
- Keep future ABW-aware context types reserved:
  - `@abw`
  - `@wiki`
  - `@gaps`
  - `@route`
  - `@decision`

## Next Work

- Review `D:\Sandbox\skill-Anti-brain-wiki_note\README.md`.
- Review `D:\Sandbox\skill-Anti-brain-wiki_note\docs\ABW_ARCHITECTURE_AUDIT_2026-04-30.md`.
- Review `D:\Sandbox\Nvidia\README.md`.
- Review `D:\Sandbox\Nvidia\.nvidia-agent\reports\audit-nvidia-abw-fusion-2026-04-30.md`.
- Keep the control repo aligned with observed ABW and NVIDIA reality.

## Near-Term

1. Execute `Sprint 7: Semantic Index Cache / Context Engine`.
2. Implement `.nvidia-agent/index` cache foundation.
3. Preserve lexical baseline behavior.
4. Add optional embedding/rerank abstraction only if safe.
5. Add incremental index update flow if safe.
6. Add AST/symbol chunking if safe.
7. Add git-aware and recent-file-aware ranking.
8. Preserve Sprint 1/2/3/4/5/6 behavior while implementing Sprint 7.
9. Keep bridge work separate: ABW bridge remains planned but not implemented.
10. Keep ABW release truth aligned across version files, tags, release notes, and control-doc assumptions.

## Mid-Term

1. Add a CLI-first NVIDIA-side ABW bridge for:
   - `abw version`
   - `abw doctor`
   - `abw ask`
2. Surface health, evidence status, warnings, and gaps in NVIDIA UI.
3. Reserve and later implement pending-diff binding to ABW continuation step ids.
4. Expand NVIDIA audit coverage beyond capability presence into bridge and governance behavior.

## Long-Term

1. Consider FastAPI/local API only after the CLI bridge proves useful and stable.
2. Add enterprise knowledge lifecycle flows around `raw/`, `processed/`, `wiki/`, and governed promotion.
3. Evaluate longer-term packaging only after bridge behavior is proven:
   - multi-repo
   - package dependency
   - submodule
   - monorepo
