# STRONG MANIFEST UI PILOT AFTER HONESTY FIX REPORT

Date: 2026-05-17

## 0. Scope and limits

- Browser UI used.
- Fresh strong sanitized/synthetic workspace used.
- No repo edits.
- No commit/push in the validation run.
- No readiness promotion.

## 1. Validation path

- Workspace:
  - `D:\Sandbox\_real_user_pilot\strong_manifest_after_honesty_fix_20260517_161115`
- NVIDIA UI:
  - `http://127.0.0.1:4892`
- Runtime:
  - `ABW_REPO_PATH=D:\Sandbox\skill-Anti-brain-wiki_note`
  - `ABW_READ_ONLY_QUERY=1`

## 2. Result classification

- `WARNING_STRONG_MANIFEST_UI_PILOT_AFTER_HONESTY_FIX`

## 3. Honesty controls

Honesty controls passed on the browser UI path:

- Missing-source:
  - `ABW_CLI_NO_MATCH`
  - `no_match`
  - `E0_unknown`
  - trust `0`
  - `sources=[]`
- Unsupported explicit file reference:
  - `ABW_CLI_NO_MATCH`
  - `no_match`
  - `E0_unknown`
  - trust `0`
  - `sources=[]`
- Malformed explicit file reference:
  - `ABW_CLI_NO_MATCH`
  - `no_match`
  - `E0_unknown`
  - trust `0`
  - `sources=[]`
- Ambiguous control:
  - weak/cautious only
  - `ABW_CLI_OK`
  - `raw_or_draft_only`
  - `E1_fallback`
  - trust `45`

## 4. Positive controls

Positive controls remained weak:

- factual Project Lantern color
- factual forklift workspace label
- Vietnamese accented
- Vietnamese unaccented
- procedure
- troubleshooting English
- troubleshooting Vietnamese/unaccented

Observed behavior:

- `ABW_CLI_OK`
- `raw_or_draft_only`
- `E1_fallback`
- trust `45`
- source visible from draft
- warnings visible

Interpretation:

- this is not a source-honesty failure
- it remains a daily-use quality/UX warning
- positive usefulness is still too weak for non-technical daily use

## 5. UI clarity

- trust-first guidance visible
- review/promote limitation visible
- drafts not trusted wiki yet visible
- trusted-source approval unavailable in UI visible
- no auto-promotion performed visible
- no `[object Object]` regression in ingest or review UI
- no readiness overclaim visible

## 6. Ingest/review/promote evidence

- ingest:
  - `ingested=6`
  - `skipped=2`
  - `generated_drafts=6`
  - `review_required=true`
  - `promotion_performed=false`
- unsupported row visible
- parse-error row visible
- review wording:
  - `Review items shown: 5. Drafts still needing review: 5. These review items are not trusted wiki sources yet.`
- promote remained fail-closed:
  - `ABW_CLI_SCHEMA_UNSUPPORTED`
  - `promotionPerformed=false`
  - no trusted wiki promotion through UI

## 7. Safety evidence

- query `.brain` mutation: no
- `.brain` hash before and after full query matrix unchanged
- every individual query check showed `brainChanged=false`
- `query_deep_runs.jsonl` created/changed: no
- pending edits from ask/query: none
- Apply used: no
- sync/write-back used: no
- auto-promotion used: no
- CONTROL/NVIDIA/ABW repos remained clean

## 8. Product interpretation

- Source honesty is materially improved for non-technical UX.
- The system is safer and more honest on absent/unsupported/malformed asks.
- The main remaining blocker is not honesty drift; it is weak positive usefulness.
- There is still no safe non-tech UI trusted-source approve contract.
- Manual CLI approval is not acceptable as non-technical daily-use UX.

## 9. Preserved caveats

- direct CLI JSON hardening caveat remains active
- inline-edit browser smoke observability warning remains warning-only
- this result is warning evidence, not a clean pass and not readiness promotion

## 10. Recommended next gate

- `DESIGN_SAFE_NON_TECH_UI_APPROVE_CONTRACT`
