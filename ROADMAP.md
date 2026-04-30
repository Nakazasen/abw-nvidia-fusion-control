# ABW x NVIDIA Unified Roadmap

## Current Strategic Direction

The two repos continue independently but evolve toward one shared architecture:

- NVIDIA remains the product shell and active agent runtime.
- ABW remains the canonical governance engine.
- Integration happens through contract and bridge work, not source merging.

## Immediate Priority

- NVIDIA `Sprint 2: Context Picker` is complete.
- NVIDIA `Sprint 3: Terminal/Job Manager UX` is complete.
- Next immediate NVIDIA work is `Sprint 4: Enterprise/IDE Mode Toggle`.
- Keep bridge work separate: ABW bridge remains planned after or alongside context/job UX, but is not implemented yet.
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

1. Execute `Sprint 4: Enterprise/IDE Mode Toggle`.
2. Add `uiMode` setting with clear enterprise vs IDE behavior boundaries.
3. Ensure enterprise mode hides dangerous IDE panels/tools while IDE mode exposes full workbench.
4. Persist mode via localStorage and/or `.nvidia-agent/profile.json`.
5. Add shortcut `Ctrl+Alt+Shift+I` only if safe and non-conflicting.
6. Preserve all Sprint 1/2/3 behavior while implementing Sprint 4.
7. Keep bridge work separate: ABW bridge remains planned but not implemented.
8. Keep ABW release truth aligned across version files, tags, release notes, and control-doc assumptions.

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
