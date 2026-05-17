# NEXT

## Ownership

- Owner: Operator
- Role: Immediate next actions only

## LAST UPDATED

- 2026-05-17

## CANONICAL REFERENCES

- Operational truth: `03_OPERATIONS/HANDOFF.md`
- Blockers: `03_OPERATIONS/CURRENT_BLOCKERS.md`
- Strategic decisions/risks: `05_DECISIONS/DECISIONS.md`, `05_DECISIONS/RISKS.md`, `05_DECISIONS/ROADMAP.md`

## SUPERSEDES

- Supersedes prior long helper prompt and duplicated governance context.

## DO NOT DUPLICATE

- Do not store milestone/readiness mirrors here.
- Keep this file concise and action-oriented.

## Immediate Next Actions

1. Review `06_VALIDATION/NVIDIA_QA_CANDIDATE_SURFACING_STAGE_C_REPORT.md`.
2. Treat the Stage C result as bounded read-only UI evidence only, not readiness promotion.
3. Preserve the current boundary: `/proxy/abw/approve-draft` exists, while `/proxy/abw/promote` remains fail-closed.
4. Implement Stage D next: `IMPLEMENT_PREVIEW_ONLY_APPROVE_DRY_RUN_STAGE_D`.
5. Preserve the remaining product blockers: no preview-only approve UI and no single-item approve UI yet.
6. Preserve that Q&A remains available without approval, candidates are not trusted or approved, drafts are not trusted yet, and approval stays selected-item only.
7. Preserve the direct CLI JSON hardening issue, the weak positive `E1_fallback` product gap, and the inline-edit browser smoke warning as residual caveats, not hidden passes.

## If Context Is Lost

1. Open `03_OPERATIONS/SESSION_RESTORE.md`.
2. Follow restore bootstrap order.

