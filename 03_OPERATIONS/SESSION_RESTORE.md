# Session Restore

## Ownership

- Owner: Operator
- Role: Compact recovery bootstrap

## LAST UPDATED

- 2026-05-17

## CANONICAL REFERENCES

- Latest accepted operational state: `03_OPERATIONS/HANDOFF.md`
- Integration chronology: `07_HISTORY/INTEGRATION_JOURNAL.md`
- Canonical strategic/decision/risk docs: `05_DECISIONS/ROADMAP.md`, `05_DECISIONS/DECISIONS.md`, `05_DECISIONS/RISKS.md`

## SUPERSEDES

- Supersedes repeated "Latest Accepted Mirror State" blocks previously maintained in this file.
- Full operational mirrors remain preserved in `03_OPERATIONS/HANDOFF.md` and pilot evidence reports.

## DO NOT DUPLICATE

- Do not maintain independent latest-state mirrors here.
- Keep this file procedural and lightweight.

## Control Repo

- `D:\Sandbox\ABW_NVIDIA_FUSION_CONTROL`

## Recovery Bootstrap Order

1. Verify exact repo path.
2. Run `git status --short --untracked-files=all`.
3. Run `git rev-parse HEAD`.
4. Read `03_OPERATIONS/HANDOFF.md` first for latest accepted operational truth.
5. Read `05_DECISIONS/DECISIONS.md` and `05_DECISIONS/RISKS.md`.
6. Read `07_HISTORY/INTEGRATION_JOURNAL.md` for chronology details.
7. Inspect implementation repos only after governance context is reconstructed.

## Latest Operational Pointer (No Mirror Copy)

- Latest readiness and gate truth: `03_OPERATIONS/HANDOFF.md` latest dated section.
- Current blockers dashboard: `03_OPERATIONS/CURRENT_BLOCKERS.md`.
- Current architecture/roadmap snapshots: `02_ARCHITECTURE/ARCHITECTURE_STATE.md`, `05_DECISIONS/ROADMAP_STATE.md`.

## Resume Priorities

1. Review/approve `06_VALIDATION/SMALL_REAL_WORK_DOC_PILOT_PLAN.md` before any sanitized pilot execution.
2. Investigate browser smoke inline-edit observability warning.
3. Preserve bounded non-claims and clean-state discipline.

## Historical Snapshot Index (Superseded Mirrors)

- Latest Accepted Mirror State (general)
- Latest Accepted Mirror State (2026-05-16 small sanitized rerun)
- Latest Accepted Mirror State (2026-05-16 NVIDIA minimal chatbot)
- Latest Accepted Mirror State (2026-05-16 NVIDIA minimal ingest UI)
- Latest Accepted Mirror State (2026-05-16 NVIDIA ABW E2E document chat UI)
- 2026-05-16 Snapshot (Post NVIDIA Non-Tech Wizard)

Note:
- Detailed payloads are intentionally not duplicated here.
- Recoverability is preserved through canonical references above.
