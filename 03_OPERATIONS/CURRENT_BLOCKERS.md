# Current Blockers (As of 2026-05-17)

## Ownership

- Owner: Auditor + Governance Recorder
- Role: Active blocker dashboard for current local state

## SOURCE OF TRUTH

- Canonical persistent risks: `05_DECISIONS/RISKS.md`
- Canonical latest accepted operational context: `03_OPERATIONS/HANDOFF.md`

## DO NOT DUPLICATE

- Do not restate full historical evidence reports here.
- Keep blockers date-scoped and operationally actionable.

## Blockers Closed (Preserved Truth)

- Previous manual path blocker `MANUAL_PATH_REVALIDATION_V3_FAIL` is closed by accepted `MANUAL_PATH_REVALIDATION_V3_PASS`.
- Deterministic local-file workflow blocker for bounded path is interpreted as closed.

## Active Blockers / Gating Constraints

1. Readiness promotion blocker
- No evidence supports promotion beyond `BOUNDED_DAILY_USE_CANDIDATE_LOCAL_FILE_WORKFLOWS`.
- `DAILY_USE_READY` and production claims remain blocked.

2. Real-data validation blocker
- Existing accepted passes are bounded to synthetic/sanitized workflows.
- Broad private/work-document readiness remains blocked.

3. Bridge scope blocker
- Full bridge capabilities (write-back/sync/auto-promote/execute-command through ABW path) remain blocked by governance boundaries.

4. UI smoke residual warning blocker
- Browser smoke still carries a recurring non-blocking warning around inline edit widget observability.
- Latest accepted NVIDIA evidence still includes this warning:
  - `Inline edit widget opens from selection: widget not observable in current smoke state`
- This remains a residual confidence gap for UX completeness claims.
- It is warning-only and is not readiness proof.

5. Sanitized full UI rerun warning gate
- ABW read-only `query_deep_runs.jsonl` mutation blocker is closed by ABW commit `c877051ef303e99b77d92315a402415d5512997d`.
- Full browser UI sanitized rerun after the ABW fix is recorded as `WARNING_UI_BOUNDED_SANITIZED_RERUN_AFTER_ABW_FIX`.
- Safety boundaries passed:
  - no query-time `.brain` mutation
  - `.brain` count stayed `10 -> 10`
  - `query_deep_runs.jsonl` was not created/changed
  - no pending edits after query
  - no NVIDIA Apply
  - no sync/write-back
  - no auto-promotion
  - CONTROL/NVIDIA/ABW remained clean
- UI clarity passed:
  - unsupported/parse-error rows readable
  - weak/fallback warning visible
  - missing-source visible
  - no readiness overclaim visible
- Remaining warning remains active:
  - Vietnamese no-match
  - procedure/troubleshooting no-match on fresh workspace
  - some answers are `E1_fallback`, trust `45`
  - this is not a clean answer-quality or retrieval-coverage pass
- Next movement should not be readiness promotion; this warning lineage is preserved, but the immediate follow-up is now `RERUN_STRONG_MANIFEST_UI_PILOT_AFTER_HONESTY_FIX`.

6. Trusted-source approve contract blocker
- NVIDIA UI clarity improved at commit `a867f892be94c350b9cabcfa168d19f82dc64995`.
- The UI now explains review state honestly and no longer renders review actions as `[object Object]`.
- This does not unblock trusted-source approval in the UI.
- Safe UI promote/approve remains blocked until a bounded JSON approve contract exists.
- `/proxy/abw/promote` must remain fail-closed for now.

7. Strong manifest positive-usefulness blocker
- The browser/proxy missing-source honesty failure is closed by ABW commit `11fb4c6d36e0e18ba9a516a51674c3e88ce081e8`, and the browser UI rerun preserves that fix as `WARNING_STRONG_MANIFEST_UI_PILOT_AFTER_HONESTY_FIX`.
- Missing-source, unsupported, and malformed explicit file/control queries now abstain correctly on the browser UI path:
  - `ABW_CLI_NO_MATCH`
  - `no_match`
  - `E0_unknown`
  - trust `0`
  - `sources=[]`
- Ambiguous remains weak/cautious, which is acceptable for this gate.
- Positive controls remain weak:
  - factual, Vietnamese, procedure, and troubleshooting still return `raw_or_draft_only`
  - `E1_fallback`
  - trust `45`
- This is not a source-honesty failure, but it is still a product blocker for non-technical daily use.
- The remaining gap is not CLI assistance; it is the lack of a safe non-tech UI trusted-source approve path and the resulting weak positive usefulness.
- Next movement should not be readiness promotion; the next governance-grade gate is `DESIGN_SAFE_NON_TECH_UI_APPROVE_CONTRACT`.

8. Direct CLI JSON hardening caveat
- A pre-existing direct CLI JSON hardening regression remains unresolved on this machine.
- The failing command family is:
  - `py -m pytest tests/test_abw_json_hardening.py -k "ask_json_contract_no_match or ask_json_contract_runtime_write_suppressed or ask_json_contract_raw_only_query_marks_weak_evidence"`
- Observed issue:
  - plain-text-vs-JSON CLI behavior
- Governance status:
  - recorded caveat
  - not hidden
  - not treated as a pass
  - not equivalent to a browser/proxy path regression
- This remains relevant future hardening work if the direct CLI JSON surface is still considered supported.

## Immediate Risk If Ignored

- Overclaim risk rises if bounded smoke evidence is treated as daily-use or production readiness.
- Pilot risk rises if warning evidence is treated as clean broad validation.

