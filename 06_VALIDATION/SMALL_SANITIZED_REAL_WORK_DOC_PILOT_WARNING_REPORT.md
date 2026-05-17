# Small Sanitized Real-Work Document Pilot Warning Report

## Verdict

`WARNING_BOUNDED_SANITIZED_PILOT`

## Scope

- Date: 2026-05-17
- Workspace: `D:\Sandbox\_real_user_pilot\small_sanitized_run_20260517_110628`
- Evidence class: bounded sanitized bridge/API pilot evidence
- Data class: sanitized/synthetic documents only
- Document count: 5
- Document categories:
  - approved sanitized Excel form
  - approved sanitized Excel process-improvement workflow
  - approved sanitized CSV manual/headcount sample
  - synthetic unsupported parser-honesty file
  - synthetic malformed DOCX parser-honesty file
- Raw pilot data was not copied into Control.

## Repository Context

- Control HEAD before run: `70bab595dee0fcbcc612cb1b2d1952574d2d7124`
- NVIDIA HEAD during run: `0e760ac3d842299b0514df1da97d436e7c7be925`
- ABW HEAD during run: `39a23a288b3df695f618d72d964bb6fdb66e1714`
- All repos were clean before and after the pilot.

## Execution Path

- NVIDIA bridge/API fallback path was used.
- Full browser UI automation was not used; UI evidence is partial.
- Commands/API path:
  - `node tools/nvidia-server.mjs` on port `4891`
  - `POST /api/workspace`
  - `POST /api/trust`
  - `POST /proxy/abw/version`
  - `POST /proxy/abw/doctor`
  - `POST /proxy/abw/ingest`
  - `POST /proxy/abw/review`
  - `POST /proxy/abw/ask`
- Environment:
  - `ABW_REPO_PATH=D:\Sandbox\skill-Anti-brain-wiki_note`
  - `ABW_READ_ONLY_QUERY=1`

## Sanitization Review

- Manifest was present.
- Raw payload scan found no obvious secrets, credentials, email/IP patterns, or forbidden sensitive categories.
- Keyword hits in the manifest were from negative policy statements, not raw payload content.
- No sensitive content is reproduced in this report.

## Ingest Evidence

- `ingested=3`
- `skipped=2`
- `unsupported_files=raw/unsupported.xyz`
- `parse_errors=raw/malformed.docx invalid zip container`
- `generated_drafts=3`
- `review_required=true`
- `promotion_performed=false`
- pending drafts: `3`
- reviewed count: `3`
- promotion not performed

Warnings preserved:
- `1 unsupported file(s) skipped.`
- `1 parse error file(s) skipped.`
- drafts require review before trusted wiki use

## Question Evidence

| Category | Observed Result | Evidence State | Classification |
| --- | --- | --- | --- |
| factual | `ABW_CLI_OK`, `E2_wiki`, trust `72` | sources visible | pass |
| procedure | `ABW_CLI_OK`, `E2_wiki`, trust `72` | sources visible | pass |
| troubleshooting | `ABW_CLI_OK`, `E2_wiki`, trust `72` | sources visible | pass |
| Vietnamese | `ABW_CLI_OK`, `E2_wiki`, trust `72` | readable, sources visible | pass |
| missing-source | `ABW_CLI_NO_MATCH`, `E0_unknown`, trust `0`, `sources=[]` | no-match visible | pass |
| ambiguous/weak | `ABW_CLI_OK`, `E2_wiki`, trust `63` | sources visible | pass |
| unsupported/malformed ask | `E1_fallback`, trust `45`, draft source | weak-evidence warnings visible | warning |

## Missing-Source Behavior

- Missing-source returned `ABW_CLI_NO_MATCH`.
- Evidence tier was `E0_unknown`.
- Trust was `0`.
- Sources were empty.
- Gap logging was suppressed under read-only mode, with `wouldLogGap=true`.

## Warning Classification

The pilot is not a clean pass because the unsupported/malformed ask returned a fallback answer from draft material:

- evidence tier: `E1_fallback`
- trust: `45`
- source type: draft
- warnings were visible

This is acceptable as a warning because the result did not claim strong evidence and did not present the answer as grounded wiki truth.

## Mutation Safety

- `.brain` before query: 10 files
- `.brain` after query: 10 files
- `.brain` signature changed: `false`
- pending edits after query: `[]`
- NVIDIA Apply used: no
- sync/write-back used: no
- unsafe `execute_command` path used: no
- auto-promotion: no
- `promotion_performed=false`

## Residual Limits

- Bounded sanitized pilot evidence only.
- Full browser UI automation was not used.
- UI evidence is partial.
- Weak fallback behavior around unsupported/malformed ask should not be treated as a clean quality pass.
- Browser inline-edit smoke warning remains warning-only and separate.
- This does not prove broad real-world validation.

## Forbidden Claims Preserved

Still forbidden:

- `DAILY_USE_READY`
- production-ready
- enterprise-ready
- Cognitive OS achieved
- full bridge ready
- autonomous-safe
- packaging-ready
- broad real-world validation

## Recommended Next Gate

`A. RUN_UI_FULL_BROWSER_SANITIZED_PILOT`

Rationale:
- Safety boundaries passed in the bridge/API path.
- The remaining evidence gap is full browser UI pilot coverage.
- Weak fallback behavior remains a warning to preserve in the next run.
