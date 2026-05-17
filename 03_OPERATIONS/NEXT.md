# NEXT

## Ownership

- Owner: Operator
- Role: Immediate next actions only

## LAST UPDATED

- 2026-05-18

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

1. Review `06_VALIDATION/RERUN_BOUNDED_NON_TECH_APPROVE_UI_PILOT_AFTER_RETRIEVAL_FIX_REPORT.md` and its stale-copy addendum.
2. Preserve that the original rerun result stays warning at runtime, not readiness promotion.
3. Preserve the validated safety line:
   - Q&A works before approval
   - approval is one source only
   - ask/query remains read-only
   - `/proxy/abw/promote` remains fail-closed and unused
4. Treat the stale approval-availability copy as fixed in NVIDIA and validated by regression/smoke checks.
5. Run the next bounded validation gate:
   - `A. RERUN_COPY_CLEAN_BOUNDED_NON_TECH_APPROVE_UI_PILOT`
6. Preserve the direct CLI JSON hardening issue, broader real-world validation gap, and inline-edit browser smoke warning as residual caveats, not hidden passes.

## If Context Is Lost

1. Open `03_OPERATIONS/SESSION_RESTORE.md`.
2. Follow restore bootstrap order.

