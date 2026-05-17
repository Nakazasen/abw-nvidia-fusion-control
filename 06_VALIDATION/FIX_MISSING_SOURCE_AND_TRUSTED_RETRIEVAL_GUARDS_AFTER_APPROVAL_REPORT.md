# Fix Missing-Source and Trusted Retrieval Guards After Approval Report

Date: 2026-05-17

## 0. Scope and limits

- Gate: `FIX_MISSING_SOURCE_AND_TRUSTED_RETRIEVAL_GUARDS_AFTER_APPROVAL`
- Classification: `PASS_FIX_MISSING_SOURCE_AND_TRUSTED_RETRIEVAL_GUARDS`
- Scope: ABW retrieval guard fix plus CONTROL evidence record.
- NVIDIA implementation was not changed.
- No raw pilot data is copied into CONTROL.
- No push was performed.
- No readiness promotion is made.

## 1. Starting local truth

- CONTROL start HEAD: `bf7d3375b36308631baddb7379bd6914af92b19c`
- NVIDIA start HEAD: `2332a965429b5e4af29c36062a568d46fbae4123`
- ABW start HEAD: `f6e6bdcd7aa2b76758611fb4c1587c2af5ba547f`
- ABW fix commit: `f748a44e2bd87594314bcc0d0af93d9ad64a55e6`
- All repositories were clean before the fix gate started.

## 2. Failed pilot reason preserved

The bounded non-tech approve UI pilot failed source honesty and retrieval guard validation:

- Missing-source IP query returned weak fallback from unrelated draft/raw evidence before approval.
- The same missing-source IP query reused an unrelated approved Lantern wiki source after approval and returned trusted/wiki evidence.
- Ambiguous unsupported query produced a weak sourceful fallback with candidate visibility.

This was a source-honesty failure, not an approval-safety failure. Stage E still preserved single-item approval boundaries.

## 3. Root cause

- Query token extraction dropped short but specific terms such as `IP`.
- Specific-term matching was too permissive for multi-term factual questions.
- A trusted wiki status bonus could let one weak overlap, such as `pilot`, dominate unrelated source selection after approval.
- Source-coverage negation text such as `does not contain internal IP` could still be treated as candidate evidence.
- Generic document questions without a clear source reference could still fall through to weak document metadata.

## 4. Files changed

- `scripts/abw_knowledge.py`
  - Tightened source selection and wiki retrieval guard behavior in the script runtime path.
- `src/abw/_legacy/abw_knowledge.py`
  - Mirrored the same guard behavior in the packaged legacy runtime path.
- `tests/test_abw_runner.py`
  - Added regression coverage for missing-source controls, unrelated trusted wiki reuse after approval, and generic ambiguous document questions.
- `06_VALIDATION/FIX_MISSING_SOURCE_AND_TRUSTED_RETRIEVAL_GUARDS_AFTER_APPROVAL_REPORT.md`
  - Records bounded validation evidence and non-claim boundaries.
- Operational CONTROL files
  - Updated handoff/blocker/next-state/journal entries to reflect the repair gate result without readiness promotion.

## 5. Behavioral contract after fix

- Direct factual source:
  - Before approval, directly supported synthetic factual sources may remain `raw_or_draft_only` / `E1_fallback` / trust-capped.
  - After explicit approval, the same directly supported factual question can use trusted/wiki evidence.
- Missing-source:
  - Returns `no_match` / `E0_unknown` / trust `0` / `sources=[]`.
  - Does not expose candidate approval.
- Unrelated trusted source:
  - An approved trusted wiki source is not reused for unrelated missing facts.
  - It may produce `E2_wiki` only when directly supporting the question.
- Unsupported:
  - Explicit unsupported file queries abstain and remain non-candidate.
- Malformed:
  - Explicit parse-error file queries abstain and remain non-candidate.
- Ambiguous:
  - Generic unsupported questions abstain or remain cautious and non-candidate unless direct support exists.
- Candidate visibility:
  - Candidate action remains appropriate only for sourceful, directly supported weak answers.

## 6. Regression tests added

- Missing-source control without exact absent-control marker abstains.
- Unrelated approved/trusted Lantern wiki source is not reused for internal-IP missing-source query.
- Generic document question without a clear source reference abstains.
- Existing unsupported, malformed, read-only mutation, and positive fallback tests remain covered.

## 7. Test evidence

- `git diff --check`
  - Result: PASS.
  - Warnings: LF/CRLF normalization warnings only in ABW changed files.
- `py -m pytest tests/test_abw_query_deep.py tests/test_abw_runner.py tests/test_abw_api.py tests/test_abw_review.py tests/test_abw_json_hardening.py -q`
  - Result: PASS.
  - Evidence: `164 passed, 2 warnings, 7 subtests passed`.
  - Warnings: FastAPI deprecation warnings for `HTTP_422_UNPROCESSABLE_ENTITY`.
- `node --test tests/abw-cli-reader-bridge.test.mjs`
  - Result: PASS.
  - Evidence: Node test wrapper passed; bridge assertions `162/162` passed.
- `node --check tools/browser-smoke.mjs; node --check tools/nvidia-server.mjs; node --check tools/abw-cli-reader.mjs`
  - Result: PASS.
- `npm test`
  - Result: PASS.
  - Included `npm run abw:reader:test`, browser smoke, guard matrix, manual reliability, apply/move proofs, and provider capability tests.
  - Warning preserved: inline edit widget observability warning remains warning-only.

## 8. Focused synthetic rerun evidence

Fresh sanitized workspace:

- Category: synthetic/sanitized only.
- Files: factual note, procedure checklist, missing-source control, unsupported marker, malformed placeholder.
- Ingest result: `ingested=3`, `skipped=2`, `promotion_performed=false`, `review_required=true`.

Before approval:

- Factual Lantern color question:
  - `success` / `raw_or_draft_only` / `E1_fallback` / trust `45`.
- Synthetic procedure question:
  - `success` / `raw_or_draft_only` / `E1_fallback` / trust `45`.
- Missing-source internal IP question:
  - `no_match` / `E0_unknown` / trust `0` / `sources=[]`.
- Unsupported marker question:
  - `no_match` / `E0_unknown` / trust `0` / `sources=[]`.
- Malformed placeholder question:
  - `no_match` / `E0_unknown` / trust `0` / `sources=[]`.
- Generic ambiguous document question:
  - `no_match` / `E0_unknown` / trust `0` / `sources=[]`.

Approval:

- Exactly one factual Lantern draft was previewed and approved through the bounded approve contract.
- Preview returned confirmation token/text.
- Apply returned `approved=true` and `promotionPerformed=true`.
- Exactly one trusted wiki file was created for the selected source.

After approval:

- Factual Lantern color question:
  - `success` / `exact_match` / `E2_wiki` / trust `72` / trusted wiki source.
- Missing-source internal IP question:
  - remained `no_match` / `E0_unknown` / trust `0` / `sources=[]`.
- Unsupported marker question:
  - remained `no_match` / `E0_unknown` / trust `0` / `sources=[]`.
- Malformed placeholder question:
  - remained `no_match` / `E0_unknown` / trust `0` / `sources=[]`.

## 9. Mutation and safety evidence

- Ingest mutation: expected setup mutation.
- Approval mutation: expected explicit single-source approval mutation.
- Query mutation: no.
- `query_deep_runs.jsonl` created/changed: no.
- Ask after approval preserved `.brain` signature around the checked missing-source ask.
- Approval scope: exactly one selected source.
- Approve-all/batch/corpus approval: absent.
- `/proxy/abw/promote`: not used in the focused repair rerun and remains fail-closed in NVIDIA smoke.

## 10. Remaining limitations

- This is a focused repair validation, not a full browser non-tech pilot rerun.
- The focused approval rerun used the bounded ABW approve contract rather than claiming full UI pilot success.
- A full browser UI bounded non-tech approve pilot should be rerun after this retrieval guard fix.
- Inline edit widget browser-smoke observability warning remains warning-only.
- Broad real private/work-document validation remains unproven.

## 11. Forbidden claims preserved

The following remain forbidden:

- `DAILY_USE_READY`
- production-ready
- enterprise-ready
- Cognitive OS achieved
- full bridge ready
- autonomous-safe
- packaging-ready
- broad real-world validation

## 12. Recommended next gate

`RERUN_BOUNDED_NON_TECH_APPROVE_UI_PILOT_AFTER_RETRIEVAL_FIX`
