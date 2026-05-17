# NVIDIA QA-INTEGRATED CANDIDATE SURFACING STAGE C REPORT

## 0. Scope and limits

- NVIDIA-only implementation evidence recorded in CONTROL
- no raw pilot data
- no CONTROL or ABW implementation edits
- no push
- no readiness promotion
- read-only candidate surfacing only
- no approve UI
- no approve dry-run/apply calls
- no bulk or corpus approval
- Q&A still does not require approval

## 1. NVIDIA commit recorded

- Commit:
  - `308bdd5fb0bca9237087132b598418092f7ddc95`
- Message:
  - `feat: surface ABW review candidates from Q&A`

## 2. Recorded Stage C UI behavior

- Implemented behavior:
  - candidate suggestion UI on eligible weak answer cards
  - local session-only candidate state
  - `Mark as candidate`
  - `Remove candidate`
  - candidate rendering in `Good candidates to review`
  - missing-source no-review message
  - unsupported/parse-error non-candidate message
  - ambiguous clarification message
- Candidate appears only when the answer is:
  - weak and sourceful
  - draft/raw based
  - not missing-source
  - not unsupported/parse-error
  - not ambiguous
  - useful enough to show a real answer body
- Candidate copy recorded:
  - `This answer used an untrusted draft source.`
  - `If this source is useful, you may review it later.`
  - `Review candidate only - not trusted yet.`
  - `No approval happens here.`

## 3. Safety and boundary evidence

- candidate is not trusted
- candidate is not approved
- no approval endpoint called
- no approve UI
- no approve dry-run/apply UI
- no approve-all
- no batch or corpus approval
- Q&A works without approval
- missing-source does not become a candidate
- unsupported/parse-error does not become a candidate
- ambiguous answers do not become candidates
- review summary is not labeled trusted wiki
- `/proxy/abw/promote` remains fail-closed

## 4. Test and smoke evidence

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
  - PASS `165 passed, 0 failed`
- Warning retained:
  - `Inline edit widget opens from selection: widget not observable in current smoke state`
- Verdict retained:
  - `HARDENING_BASELINE_PASS_NOT_DAILY_USE_READY`
- Explicit smoke outcomes retained:
  - weak sourceful answer can become candidate
  - candidate appears in `Good candidates to review`
  - candidate is not trusted
  - missing-source does not show candidate
  - unsupported/parse-error does not show candidate
  - ambiguous asks for clarification instead of candidate action
  - candidate action does not call `/proxy/abw/approve-draft`
  - candidate action does not call `/proxy/abw/promote`

## 5. Governance interpretation

- This is bounded UI evidence only.
- This closes the missing Stage C candidate surfacing implementation gap.
- This does not implement Stage D or Stage E.
- This does not create approve UI.
- This does not prove non-technical daily-use readiness.
