# ABW APPROVE JSON CONTRACT STAGE 1 REPORT

## 0. Scope and limits

- ABW-only
- no NVIDIA edits
- no CONTROL edits during implementation
- no push
- no readiness promotion
- no UI wiring

## 1. Baseline

- ABW HEAD before implementation:
  - `11fb4c6d36e0e18ba9a516a51674c3e88ce081e8`
- ABW HEAD after implementation:
  - `f6e6bdcd7aa2b76758611fb4c1587c2af5ba547f`
- Commit:
  - `feat: add safe approve draft JSON contract`
- CONTROL context:
  - `93123c8ded8576d314c423de5b5bfa54f53cb1ac`
- NVIDIA context:
  - `a867f892be94c350b9cabcfa168d19f82dc64995`

## 2. Implemented bounded contract

- safe single-draft approve JSON contract
- dry-run preview
- apply with explicit confirmation token/text
- stale draft hash guard
- queue status validation
- target wiki collision block
- path traversal block
- structured blocked responses
- no fake success
- API endpoint `/approve-draft`
- CLI `--json approve` contract
- manual CLI compatibility preserved

## 3. Safety behavior recorded

- single draft only
- no batch mode
- wildcard blocked
- path traversal blocked
- stale approve blocked
- target wiki exists blocked
- non-draft path blocked
- dry-run no mutation
- blocked no mutation
- apply mutates only selected draft, queue item, and review log in the selected workspace

## 4. Validation evidence

- `py -m pytest tests/test_abw_review.py tests/test_abw_api.py tests/test_abw_json_hardening.py -q`
  - result: PASS `56 passed`
- `py -m compileall src scripts tests/test_abw_review.py tests/test_abw_api.py tests/test_abw_json_hardening.py`
  - result: PASS
- `py -m pytest tests/test_abw_runner.py -k "missing_source_control_abstains or unsupported_file_reference_after_ingest_skip or parse_error_file_reference_after_ingest_skip or positive_draft_fallback_still_works or ambiguous_prompt_remains_weak or read_only_queries_do_not_mutate"`
  - result: PASS `6 passed`
- `py -m pytest tests/test_abw_api.py -k "missing_source_control_question_does_not_match_control_file or explicit_unsupported_filename_blocks_unrelated_fallback_candidates or explicit_parse_error_filename_blocks_unrelated_fallback_candidates"`
  - result: PASS `3 passed`
- `py -m pytest tests/test_abw_runner.py -k "supplier_contract_query_abstains or unsupported_docx_content_even_when_filename_matches or domain_terms_require_presence_in_candidate_content or named_entity_query_abstains"`
  - result: PASS `5 passed`
- `git diff --check`
  - result: PASS with LF/CRLF warnings only
- `npm run abw:reader:test` in NVIDIA
  - result: PASS `108/108`

## 5. Current limitations preserved

- NVIDIA approve bridge/server support is not implemented yet
- NVIDIA UI approve flow is not implemented yet
- `/proxy/abw/promote` remains fail-closed
- this stage did not create non-tech daily-use UX
- non-tech daily-use remains unproven
- no readiness promotion is justified by this evidence

## 6. Non-claims

- not `DAILY_USE_READY`
- not production-ready
- not enterprise-ready
- not full bridge ready
- not autonomous-safe
- not packaging-ready
- not Cognitive OS achieved
- not broad real-world validation
