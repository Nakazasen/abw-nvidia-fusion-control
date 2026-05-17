# ABW MISSING-SOURCE HONESTY FIX REPORT

Date: 2026-05-17

## 0. Scope and limits

- ABW-only fix recorded in CONTROL.
- No raw pilot data is copied into this repo.
- No NVIDIA or ABW source files were edited in this CONTROL recording step.
- No push.
- No readiness promotion.

## 1. Recorded ABW commit

- ABW HEAD:
  - `11fb4c6d36e0e18ba9a516a51674c3e88ce081e8`
- Commit message:
  - `fix: abstain on missing-source and parser-honesty controls`

## 2. Root cause fixed

- Missing-source control/spec text was being treated as answer evidence.
- Explicit unsupported-file questions could drift into unrelated raw/draft fallback answers.
- Explicit malformed/parse-error file questions could drift into unrelated raw/draft fallback answers.
- A narrow semantic mismatch guard was added so explicit source/file references do not weak-fallback to unrelated content.

## 3. Recorded behavior after fix

- Missing-source control now abstains instead of answering from control-draft text.
- Unsupported file references now abstain instead of falling back to unrelated raw/draft content.
- Malformed file references now abstain instead of falling back to unrelated raw/draft content.
- Positive relevant raw/draft fallback is preserved as:
  - `ABW_CLI_OK`
  - `raw_or_draft_only`
  - `E1_fallback`
  - trust `45`
- Ambiguous control remains weak/cautious rather than overconfident.
- Trusted wiki behavior remains unchanged.

## 4. Test evidence

- ABW targeted regressions:
  - `6 passed`
  - missing-source
  - unsupported
  - malformed
  - positive fallback preserved
  - ambiguous weak behavior
  - read-only no-mutation
- ABW retrieval-layer guard tests:
  - `3 passed`
- Broader ABW abstention/domain/entity regressions:
  - `5 passed`
- NVIDIA bridge regression:
  - `npm run abw:reader:test` -> `108 passed`

## 5. Proxy verification evidence

- Fresh synthetic workspace:
  - `D:\Sandbox\_real_user_pilot\abw_honesty_fix_proxy_20260517_154122`
- Verification path:
  - NVIDIA proxy/browser-compatible path
  - local repo-source ABW
  - `ABW_READ_ONLY_QUERY=1`

Observed results:

- Missing-source:
  - `ABW_CLI_NO_MATCH`
  - `no_match`
  - `E0_unknown`
  - trust `0`
  - `sources=[]`
- Unsupported file:
  - `ABW_CLI_NO_MATCH`
  - `no_match`
  - `E0_unknown`
  - trust `0`
  - `sources=[]`
- Malformed file:
  - `ABW_CLI_NO_MATCH`
  - `no_match`
  - `E0_unknown`
  - trust `0`
  - `sources=[]`
- Positive factual/procedure fallback:
  - `ABW_CLI_OK`
  - `raw_or_draft_only`
  - `E1_fallback`
  - trust `45`
- Ambiguous control:
  - weak/cautious `E1_fallback`

## 6. Read-only safety evidence

- Browser/proxy ask phase did not mutate `.brain`.
- `.brain` signature stayed unchanged before and after the ask phase.
- `query_deep_runs.jsonl` was not created or changed.
- No Apply.
- No sync/write-back.
- No auto-promotion.

## 7. Known caveat preserved

- The following direct CLI JSON hardening regression remains unresolved and is not recorded as a pass:
  - `py -m pytest tests/test_abw_json_hardening.py -k "ask_json_contract_no_match or ask_json_contract_runtime_write_suppressed or ask_json_contract_raw_only_query_marks_weak_evidence"`
- Failure cause recorded during investigation:
  - pre-existing plain-text-vs-JSON CLI behavior on this machine
- Governance interpretation:
  - this is a residual caveat
  - not hidden
  - not reclassified as success
  - not a readiness blocker close by itself

## 8. Governance interpretation

- This fix improves source honesty for non-technical UX on the browser/proxy path.
- This does not prove daily-use readiness.
- This does not unblock trusted-source approval in the UI.
- This does not promote production-ready, full bridge ready, or Cognitive OS achieved.

## 9. Recommended next gate

- `RERUN_STRONG_MANIFEST_UI_PILOT_AFTER_HONESTY_FIX`
