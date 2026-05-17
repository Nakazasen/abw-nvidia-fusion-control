# CONTROL SINGLE-ITEM APPROVE APPLY STAGE E RECORD REPORT

## 0. Scope and limits

- CONTROL only
- no raw pilot data
- no NVIDIA or ABW edits in this record step
- no push
- no readiness promotion

## 1. NVIDIA commit recorded

- Commit:
  - `2332a965429b5e4af29c36062a568d46fbae4123`
- Message:
  - `feat: add single-item ABW approve apply UI`

## 2. Stage E single-item approve evidence recorded

- Stage E result recorded:
  - NVIDIA-only
  - single-item approve apply UI completed
  - no CONTROL edits during implementation
  - no ABW edits during implementation
- Recorded UI behavior:
  - single-item approve apply flow in `nvidia_playground.html`
  - approval eligibility checks
  - explicit confirmation UI
  - approved-source local state
  - honest success and blocked rendering
  - Stage E smoke coverage in `tools/browser-smoke.mjs`
- Eligibility rules recorded:
  - candidate must exist
  - preview must have succeeded first
  - preview must include `expected_draft_hash`
  - preview must include confirmation token/text
  - workspace must still be trusted
  - previewed workspace must still match the active workspace
  - candidate must still match preview state and not be stale
  - source must not already be approved
  - blocked or error preview state cannot approve
- Confirmation flow recorded:
  - preview panel shows `Not trusted yet`
  - panel explains approval applies only one selected source
  - panel explains this does not approve the whole folder
  - checkbox requires explicit acknowledgement
  - `Approve this one source` stays disabled until confirmation is checked
- Apply request behavior recorded:
  - endpoint used: `/proxy/abw/approve-draft`
  - preview continues to use `dry_run=true`
  - apply uses `dry_run=false` only after explicit confirmation
  - request includes `workspace`
  - request includes `draft_path`
  - request includes `draft_id`
  - request includes `expected_draft_hash`
  - request includes `expected_queue_status`
  - request includes `confirm.user_confirmed=true`
  - request includes preview-provided confirmation token/text
- Success behavior recorded:
  - shows `Trusted source created.`
  - shows approved wiki path
  - shows audit id and review log if returned
  - records approved source locally
  - removes it from pending candidate surfaces
  - can surface it in trusted group
  - makes no readiness claim
- Blocked behavior recorded:
  - shows `Approval was blocked. Nothing was changed.`
  - shows stale or block reason from the response
  - keeps source `Not trusted yet`
  - does not fake approval
  - preserves re-preview guidance for stale state

## 3. Product boundary recorded

- approval is single-item only
- approval is not folder approval
- approval is not workspace approval
- approval is not corpus approval
- Q&A does not require approval
- no approve-all
- no batch approval
- missing-source cannot approve
- unsupported/parse-error cannot approve
- ambiguous without clear source cannot approve
- `/proxy/abw/promote` remains fail-closed and unused
- no hidden trust mutation
- this does not prove daily-use readiness

## 4. Validation evidence

- `git diff --check`
  - PASS with LF/CRLF warnings only
- `node --check tools/browser-smoke.mjs`
  - PASS
- `node --check tools/nvidia-server.mjs`
  - PASS
- `node --check tools/abw-cli-reader.mjs`
  - PASS
- `npm run abw:reader:test`
  - PASS `162 passed, 0 failed`
- `npm run browser:smoke`
  - PASS
- Warning retained:
  - `Inline edit widget opens from selection: widget not observable in current smoke state`
- Verdict retained:
  - `HARDENING_BASELINE_PASS_NOT_DAILY_USE_READY`
- Explicit smoke outcomes retained:
  - apply unavailable before preview
  - preview still uses `dry_run=true`
  - apply enables only after explicit confirmation
  - apply sends `dry_run=false` only after confirmation
  - apply includes expected hash, queue status, and confirmation token/text
  - success marks exactly one source trusted
  - blocked apply is shown honestly
  - blocked apply keeps candidate untrusted
  - missing-source cannot approve
  - unsupported/parse-error cannot approve
  - ambiguous without clear source cannot approve
  - no approve-all, batch, or corpus wording
  - no `/proxy/abw/promote` call
  - Q&A still works without approval
  - no `[object Object]`
  - no readiness overclaim

## 5. Governance interpretation

- This is bounded UI implementation evidence only.
- This closes the missing Stage E single-item approve apply UI implementation gap.
- This does not prove broader non-technical daily-use readiness.
- This does not validate whole-folder, workspace, or corpus approval.
- This does not erase prior warning lineage around weak positive usefulness or bounded pilot scope.

## 6. Recommended next gate

- `RERUN_BOUNDED_NON_TECH_APPROVE_UI_PILOT`
