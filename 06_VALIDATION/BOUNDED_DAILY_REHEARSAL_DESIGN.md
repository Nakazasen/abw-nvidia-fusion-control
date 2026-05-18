# BOUNDED DAILY REHEARSAL DESIGN

Date: 2026-05-19

## 0. Classification

- `PASS_BOUNDED_DAILY_REHEARSAL_DESIGN_READY`

## 1. Purpose and boundary

- This is a bounded rehearsal design only.
- This is not a real private-document pilot.
- This is not readiness promotion.
- This does not mean `DAILY_USE_READY`.
- This does not mean production-ready.
- This does not mean broad real-world validation.

## 2. Scope

- bounded rehearsal only
- non-sensitive / low-risk documents only
- low-risk/non-sensitive operator validation only
- browser UI path preferred
- no private/customer/HR/legal/finance/contract/incident-sensitive data
- no NVIDIA or ABW code change required for this design gate

## 3. Entry criteria

- CONTROL repo clean before rehearsal start
- NVIDIA repo clean before rehearsal start
- ABW repo clean before rehearsal start
- latest bounded synthetic UI pilot is accepted as:
  - `PASS_COPY_CLEAN_BOUNDED_NON_TECH_APPROVE_UI_PILOT`
- UI starts on the local NVIDIA path
- tests pass, or any known environment limitation is documented before the run
- operator understands the active forbidden claims and stop conditions
- operator confirms the rehearsal document set is non-sensitive before ingest

## 4. Allowed document types

- public documents
- synthetic documents
- personal low-risk notes
- toy `markdown`/`txt` files
- low-risk exported notes
- simple `DOCX` or `PDF` only if explicitly marked non-sensitive

## 5. Disallowed document types

- HR documents
- legal documents
- finance documents
- contracts
- credentials
- server/network secrets
- private customer data
- medical/health records
- confidential work documents
- personal identity documents
- incident reports
- proprietary company documents unless explicitly cleared as non-sensitive

## 6. Rehearsal dataset shape

- start with `5-10` files
- expand to `10-30` files only after the first pass is stable
- mix `markdown`/`txt` with simple `DOCX`/`PDF` only when safe
- include deliberate missing-source questions
- include unsupported controls
- include malformed controls
- include duplicate or contradictory low-risk facts only in a later pass

## 7. User flow to validate

1. Choose workspace.
2. Ingest the bounded low-risk dataset.
3. Inspect readable and unreadable file reporting.
4. Ask questions before any approval.
5. Inspect sources and trust levels.
6. Mark one eligible source as candidate.
7. Preview the candidate.
8. Approve exactly one source with explicit confirmation.
9. Ask again and verify trusted improvement on the approved factual item.
10. Verify missing-source questions still abstain before and after approval.
11. Verify the user can understand failures and warnings without CLI fallback.
12. Verify the daily UX does not require CLI use.

## 8. Metrics to capture

- ingest success count
- skipped count
- unreadable count
- answer categories
- trust levels
- candidate count
- approval count
- false-positive source reuse
- missing-source abstain rate
- query-time mutation yes/no
- user confusion notes
- recovery steps needed

## 9. Stop conditions

- any sensitive document appears
- missing-source is answered as fact
- unrelated trusted source is reused
- approve-all appears
- batch approval appears
- corpus/workspace approval appears
- approval occurs without preview or explicit confirmation
- query-time `.brain` mutation occurs
- user cannot tell trusted from untrusted
- repo becomes unexpectedly dirty
- UI errors block a non-technical user

## 10. Classification outcomes

- `PASS_BOUNDED_DAILY_REHEARSAL_DESIGN_READY`
  - the design is complete, bounded, and safe to use for the next low-risk rehearsal gate
- `WARNING_BOUNDED_DAILY_REHEARSAL_DESIGN_READY`
  - the design is usable, but one or more caveats must be carried into execution
- `BLOCKED_BOUNDED_DAILY_REHEARSAL_DESIGN`
  - required preconditions are missing, so the rehearsal should not start
- `FAIL_BOUNDED_DAILY_REHEARSAL_DESIGN`
  - the design is unsafe or internally inconsistent

## 11. Remaining limitations

- positive controls before approval may still remain weak `E1_fallback` / trust `45`
- browser smoke still carries the inline-edit observability warning
- the direct CLI JSON hardening caveat remains unresolved on this machine
- this design does not prove daily-use readiness
- this design does not authorize sensitive-document ingest

## 12. Latest passed executable validation gate

- `PASS_COPY_CLEAN_BOUNDED_NON_TECH_APPROVE_UI_PILOT`

## 13. Recommended next executable gate

- `RUN_BOUNDED_DAILY_REHEARSAL_WITH_LOW_RISK_DOCS`

Run this next gate only after the user confirms the rehearsal document set is non-sensitive.

## 14. Forbidden claims preserved

Do not claim:

- `DAILY_USE_READY`
- production-ready
- enterprise-ready
- Cognitive OS achieved
- full bridge ready
- autonomous-safe
- packaging-ready
- broad real-world validation
- VS Code parity
- Cursor parity
