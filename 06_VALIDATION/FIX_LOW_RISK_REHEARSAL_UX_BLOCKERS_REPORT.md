# FIX LOW-RISK REHEARSAL UX BLOCKERS REPORT

## 0. Classification

`PASS_FIX_LOW_RISK_REHEARSAL_UX_BLOCKERS`

## 1. Starting repo snapshot

- CONTROL: branch `main`, HEAD `fa810459e9fb22bdbcd560d6a9c6789b68f9eb59`, status `clean`
- NVIDIA: branch `main`, HEAD `8b2473bc01b629d919efd0d8b5d61b2a3a3662e8`, status `clean`
- ABW: branch `main`, HEAD `f748a44e2bd87594314bcc0d0af93d9ad64a55e6`, status `clean`

## 2. Root cause

- Workspace contamination:
  - the low-risk DOCX workspace already contained extensive prior assistant state under `.brain`, `drafts`, `processed`, and `wiki`
  - the browser UI did not make that state obvious enough to a non-technical operator
- Quarantine/wiki trusted reuse:
  - the active repo runtime path in `scripts/abw_knowledge.py` did not exclude `wiki\quarantine_wrong_workspace\*`
  - generic retrieval could therefore treat unrelated quarantine content as trusted wiki evidence
- Ambiguous generic `E2` issue:
  - generic questions without a specific target were allowed to resolve against prior/trusted workspace state
  - there was no contaminated-workspace guard to force abstention/caution
- Ask-time `.brain` mutation:
  - direct ABW CLI and bridge repros did not reproduce query-time `.brain` writes
  - the failed rehearsal evidence is preserved, but the focused repro shows read-only ask stays non-mutating before and after approval
- Stale UI state:
  - workspace contamination metadata was not being surfaced clearly through the UI
  - the ingest/status panel also needed explicit current-state rendering so stale blocked-style copy would not persist after successful ingest

## 3. Changes made

### ABW

- `scripts/abw_knowledge.py`
  - added quarantine/wrong-workspace path exclusion for retrieval
  - added ambiguous generic query guard for multi-document or prior-state workspaces
  - added workspace retrieval-state inspection helpers
- `src/abw/_legacy/abw_knowledge.py`
  - mirrored the same quarantine and ambiguity guards into the packaged legacy copy
- `tests/test_abw_runner.py`
  - added regression coverage for quarantine exclusion and contaminated-workspace generic abstention

### NVIDIA

- `tools/nvidia-server.mjs`
  - added workspace-state inspection for `.brain`, `drafts`, `processed`, trusted wiki, and quarantine counts
  - returned contamination metadata on workspace, ask, and ingest responses
- `nvidia_playground.html`
  - added prior-state warning and summary UI
  - added quarantine-specific warning copy
  - cleared stale blocked/trust messaging on workspace switch and after ingest
- `tests/abw-cli-reader-bridge.test.mjs`
  - added regression coverage for contamination metadata surfacing on the bridge

## 4. Behavioral contract after fix

- Prior state warning:
  - contaminated workspaces now surface a clear warning that prior assistant state already exists
  - the UI can show counts for `.brain`, drafts, trusted wiki, processed files, and quarantine files
- Quarantine exclusion:
  - quarantine-like paths such as `wiki\quarantine_wrong_workspace\*` are no longer eligible as trusted answer evidence
- Ambiguous generic handling:
  - generic questions like `What does this document say?` abstain in multi-document or prior-state workspaces unless the user identifies a specific source
- Query no-mutation:
  - focused repro confirms ask/query does not mutate `.brain`
  - focused repro confirms `query_deep_runs.jsonl` is not created or changed during ask
- UI stale-state clearing:
  - successful ingest now renders current ingest results instead of stale blocked-style copy
  - contamination warnings remain specific and current
- Approval boundaries preserved:
  - one-source preview/apply only
  - explicit confirmation still required
  - no approve-all, batch, corpus, or workspace approval
  - `/proxy/abw/promote` remains fail-closed and unused

## 5. Tests added/updated

- `tests/test_abw_runner.py::test_ambiguous_generic_query_abstains_in_contaminated_workspace`
  - proves generic contaminated-workspace ask abstains and does not mutate `.brain`
- `tests/test_abw_runner.py::test_quarantine_wiki_is_not_used_as_trusted_evidence`
  - proves quarantine wiki content is not returned as trusted evidence
- `tests/abw-cli-reader-bridge.test.mjs`
  - proves workspace-state contamination metadata is surfaced through `/api/workspace` and `/proxy/abw/ask`

## 6. Test results

- ABW:
  - `py -m pytest tests/test_abw_runner.py -q` PASS
  - `py -m pytest tests/test_abw_query_deep.py tests/test_abw_runner.py tests/test_abw_api.py tests/test_abw_review.py tests/test_abw_json_hardening.py -q` PASS
- NVIDIA:
  - `node --check tools/browser-smoke.mjs` PASS
  - `node --check tools/nvidia-server.mjs` PASS
  - `node --check tools/abw-cli-reader.mjs` PASS
  - `node --test tests/abw-cli-reader-bridge.test.mjs` PASS
  - `npm test` PASS

## 7. Focused rerun evidence

- Workspace path:
  - `D:\Sandbox\_real_user_pilot\contaminated_workspace_repro_20260519_062324`
- Contamination setup:
  - `raw\factual_lantern_note.md`
  - `raw\procedure_checklist.md`
  - preexisting `wiki\quarantine_wrong_workspace\agv.md`
  - preexisting `.brain`, `drafts`, and prior wiki state
- UI warning result:
  - warning shown: `This workspace already has prior assistant state, including quarantine or wrong-workspace files. Generic questions should not be trusted here without a specific source.`
  - summary shown with current counts: `.brain=11, drafts=2, trusted_wiki=2, processed=1, quarantine=1`
- Generic query result:
  - `ABW_CLI_NO_MATCH`
  - `retrievalStatus=no_match`
  - `evidenceTier=E0_unknown`
  - `trustScore=0`
  - no sources returned
- Missing-source result:
  - `ABW_CLI_NO_MATCH`
  - `retrievalStatus=no_match`
  - `evidenceTier=E0_unknown`
  - `trustScore=0`
- Direct supported result before approval:
  - `ABW_CLI_OK`
  - `retrievalStatus=raw_or_draft_only`
  - `evidenceTier=E1_fallback`
  - `trustScore=45`
  - source `drafts\factual-lantern-note_draft.md`
- Approval result:
  - preview PASS
  - explicit confirmation token/text returned
  - apply PASS
  - exactly one source approved to `wiki/factual-lantern-note.md`
- Ask-after result:
  - direct supported question improved to `retrievalStatus=exact_match`, `evidenceTier=E2_wiki`, `trustScore=72`
  - generic still abstained
  - missing-source still abstained
- Mutation result:
  - `.brain` unchanged during ask-before sequence
  - `.brain` unchanged during ask-after sequence
  - `query_deep_runs.jsonl` absent/unchanged throughout ask

## 8. Low-risk DOCX rehearsal implication

- The focused repro fixes the specific blockers that caused the previous failed DOCX rehearsal:
  - quarantine reuse is blocked
  - generic contaminated-workspace asks abstain
  - read-only ask stays non-mutating in focused repro
  - workspace-state warning is surfaced clearly
- The real low-risk DOCX rehearsal should be rerun.
- The previous contaminated real DOCX workspace should be preserved as failure evidence, not deleted in place.
- The next rerun should use a fresh low-risk copy or a fresh workspace root so prior assistant state does not confound the result.
- No sensitive content was printed during this blocker-fix gate.

## 9. CONTROL updates

- Added:
  - `06_VALIDATION/FIX_LOW_RISK_REHEARSAL_UX_BLOCKERS_REPORT.md`
- Updated:
  - `03_OPERATIONS/HANDOFF.md`
  - `03_OPERATIONS/CURRENT_BLOCKERS.md`
  - `03_OPERATIONS/NEXT.md`
  - `05_DECISIONS/ROADMAP_STATE.md`
  - `07_HISTORY/INTEGRATION_JOURNAL.md`
- Related implementation commits:
  - ABW: `829708a2b47ef0a3eb878be4b6f09e3558f7fa7b`
  - NVIDIA: `5d743f594f1f4b1d7c8dd36d7aaf9cf3b4f55b3f`
- CONTROL commit hash:
  - pending at report creation time

## 10. Final repo snapshot

- CONTROL: branch `main`, HEAD pending until commit, expected dirty with governance updates
- NVIDIA: branch `main`, HEAD `5d743f594f1f4b1d7c8dd36d7aaf9cf3b4f55b3f`, expected clean after commit
- ABW: branch `main`, HEAD `829708a2b47ef0a3eb878be4b6f09e3558f7fa7b`, expected clean after commit

## 11. Forbidden claims preserved

- `DAILY_USE_READY` remains forbidden
- production-ready remains forbidden
- enterprise-ready remains forbidden
- broad real-world validation remains forbidden
- no Cognitive OS achieved claim
- no full bridge ready claim
- no autonomous-safe claim
- no packaging-ready claim
- no VS Code parity claim
- no Cursor parity claim

## 12. Recommended next gate

`A. RERUN_BOUNDED_DAILY_REHEARSAL_WITH_FRESH_LOW_RISK_DOCX_WORKSPACE`

## 13. Questions for user

- No immediate question is required for this gate.
