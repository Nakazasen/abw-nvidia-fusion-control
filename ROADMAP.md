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
- NVIDIA Sprint 7 `Semantic Index Cache / Context Engine` is complete.
- NVIDIA Sprint 8 `LSP Diagnostics / Problems Panel` is complete.
- Next immediate NVIDIA work is `Sprint 9: Browser E2E Smoke Harness`.
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

1. Execute `Sprint 9: Browser E2E Smoke Harness`.
2. Launch local NVIDIA server and open playground page.
3. Verify Enterprise/IDE mode toggle in browser smoke flow.
4. Verify Composer/Diff basic UI paths.
5. Verify Context Picker opens.
6. Verify Terminal/Jobs basic panel.
7. Verify Problems panel basic render.
8. Verify Monaco tab open path if safe.
9. Collect screenshot/log artifact if safe.
10. Preserve Sprint 1/2/3/4/5/6/7/8 behavior while implementing Sprint 9.
11. Keep bridge work separate: ABW bridge remains planned but not implemented.
12. Keep ABW release truth aligned across version files, tags, release notes, and control-doc assumptions.

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
