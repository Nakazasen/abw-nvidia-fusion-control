# NON-TECH REVIEW TRIAGE UX DESIGN REPORT

## 0. Scope and limits

- design only
- no code changes
- no commits during design
- no push
- no readiness promotion

## 1. Current evidence baseline

- CONTROL HEAD: `3cca21e0002c8d9ba4f587b714375827379073f3`
- NVIDIA HEAD: `de7c907147de4a4938738e137e3264defe52426e`
- ABW HEAD: `f6e6bdcd7aa2b76758611fb4c1587c2af5ba547f`
- Current blockers remain:
  - no read-only triage dashboard
  - no Q&A-integrated candidate surfacing
  - no preview-only approve dry-run UI
  - no single-item approve apply UI
  - non-tech daily-use not proven
  - inline-edit browser smoke warning remains warning-only

## 2. Product problem

Non-technical users may ingest many documents and cannot read or approve everything manually. They still need to ask questions immediately.

Two behaviors must remain separate:
- Ask quickly over documents: ask first, see whether the answer used trusted or weak evidence, and continue working.
- Build trusted local knowledge over time: selectively review only a small number of high-value items and approve those specific items later.

Approval must not mean whole-corpus validation. It must mean intentional trust in one selected, previewed knowledge item.

## 3. UX principle

- ask first
- trust gradually
- approve selected knowledge items only
- never require approval before Q&A
- never imply whole-corpus validation
- show honesty before convenience
- reduce workload by surfacing candidates, not by forcing blanket review

## 4. User-facing states

- Ready to ask: readable content can support Q&A now, but it is not trusted yet.
- Needs review: readable content exists and may be worth inspecting later.
- Candidate for trusted source: the system suggests one item may be worth review because it has been useful, clean, repeated, or user-selected.
- Trusted source: one selected item was previewed and explicitly approved.
- Skipped unsupported: the file could not be read due to unsupported type or structure.
- Parse error: the document was meant to be readable, but parsing failed.
- Weak evidence only: an answer used draft/raw evidence and should be treated cautiously.
- Missing source: the system could not find a usable source.
- Ambiguous: the question or source match is unclear and should be clarified before trust actions.

For all states:
- unsupported, parse-error, and missing-source paths must not expose approve
- weak and candidate paths may be used for Q&A but must stay clearly marked as not trusted
- trusted is per item only, not per corpus

## 5. Triage dashboard design

Dashboard groups content by user action, not by technical path:

- Ready to ask, not trusted yet
- Good candidates to review
- Needs attention
- Could not read
- Already trusted
- Recently used in answers
- Frequently asked / high-value candidates

Scaling rules:
- summarize by document, section, or topic rather than dumping all pages
- search and filter across groups
- sort by recent use, repeated citation, extraction cleanliness, and warning state
- default to a small candidate set rather than the full corpus
- never require the user to clear the entire list before asking questions

## 6. Q&A-integrated review flow

Core flow:
- ask a question first
- show answer trust state clearly
- if the answer is weak but useful, offer `Review this source`
- open source preview from the answer card
- let the user decide later whether to trust that one item
- if the answer is missing-source, suggest rephrasing or ingesting more content instead of approval
- if the answer is unsupported or parse-error, explain the ingest issue instead of approval
- if the answer is ambiguous, ask for clarification instead of approval

## 7. Approval candidate rules

An item may become a candidate when:
- it was used in a recent answer
- the answer was useful but weak
- extraction was clean
- the title/source is clear
- the content looks stable, such as a procedure, fact, checklist, or policy
- it has no parse warnings
- it is repeatedly cited
- the user explicitly selected it for later review

An item must not become a candidate when:
- it is unsupported
- it has a parse error
- the answer is missing-source
- the answer is ambiguous without clear source grounding
- the selection is bulk, array, wildcard, or corpus-wide

## 8. Safe approve entry points

Allowed entry points:
- draft detail preview
- answer source card
- candidate review queue

Forbidden entry points:
- bulk list selection
- unsupported rows
- parse-error rows
- missing-source answers
- ambiguous answers without clear source grounding
- workspace-level or corpus-level action
- unpreviewed raw documents

Approval sequence:
- select one draft
- run dry-run preview
- show summary, source, and warnings
- require explicit confirmation
- then allow single-item apply

## 9. Non-tech copy

- Draft/raw explanation: `This answer used unreviewed source material. It may help, but it is not trusted yet.`
- Trusted source explanation: `This source was reviewed and approved for future answers.`
- Why review is optional: `You can keep asking questions without reviewing anything.`
- Per-item approval explanation: `Approving one source does not approve the whole folder or document set.`
- Missing-source message: `I could not find a usable source for this answer yet.`
- Weak evidence message: `This answer depends on untrusted material.`
- Candidate explanation: `This source may be worth reviewing because it has been useful and looks clear to inspect.`
- Approval confirmation: `Approve this one reviewed source for future answers?`
- Failure blocked message: `Approval was blocked. No changes were made.`
- Audit note: `Approved sources are recorded one item at a time.`

## 10. Safety and governance boundaries

- Review/Triage UX does not approve anything automatically.
- Approval remains single-item only.
- Q&A remains available without approval.
- Weak draft/raw answers remain clearly marked weak.
- Fail closed on trust mismatch, workspace mismatch, invalid responses, stale preview, blocked ABW result, missing confirmation, arrays, wildcards, or multi-item requests.
- Preserve per-item audit trace and blocked-result honesty.
- No bulk approval, no corpus approval, and no readiness claim.

## 11. Staged implementation plan

- Stage A: record this design in CONTROL.
- Stage B: build a UI read-only triage dashboard with grouped states, labels, filters, and no approve action yet.
- Stage C: add Q&A-integrated candidate surfacing from answer source cards, still without approval.
- Stage D: add preview-only approve dry-run using `/proxy/abw/approve-draft`, with no apply yet.
- Stage E: add single-item approve apply with explicit confirmation and no batch path.
- Stage F: run a bounded non-tech pilot on a small sanitized corpus and record evidence without readiness promotion.

## 12. Risks and mitigations

- Overwhelm: mitigate with grouped summaries, top candidates, and capped default views.
- Overtrust: mitigate with clear trust labels and per-item approval wording.
- Bulk approval drift: mitigate by forbidding batch and corpus entry points.
- Wrong approval: mitigate with preview, warnings, and explicit confirmation.
- Stale preview: mitigate by preserving stale-hash and blocked responses.
- Missing-source regression: mitigate by keeping no-source answers separate from approval actions.

## 13. Recommended next gate

- `IMPLEMENT_READ_ONLY_TRIAGE_DASHBOARD_STAGE_B`

## 14. Questions for user

- None.
