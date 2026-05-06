# NVIDIA User Manual Validation Guide

Date: 2026-05-04
Control head: `0b763862f5035da40fc7c3bbe173c159548c1b1a`
NVIDIA head: `2547010cbabc069937f8ee3c4aced01400c7f1b7`
ABW head: `fe0520626d8f254476424242e29ea2bef4807f73`
Current readiness: `BOUNDED_DAILY_USE_CANDIDATE_LOCAL_FILE_WORKFLOWS`

## Purpose

This guide is for structured hands-on validation of the current NVIDIA bounded local file workflow candidate on a real machine.

This guide does not upgrade readiness wording. It does not claim:

- `DAILY_USE_READY`
- production-ready
- full bridge
- Cognitive OS achieved
- enterprise-grade security
- packaging-ready

## Scope

Validate the practical user experience for:

- create file
- edit existing file
- delete file
- move or rename file
- bounded multi-file edit
- Auto-Accept `ON` and `OFF`
- approval modal clarity
- pending state clarity
- Review + Apply flow
- blocked action behavior
- failed/provider error behavior
- changed-files visibility
- recent-action visibility
- visibility and clipping
- Vietnamese wording and practical smoothness

Out of scope:

- bridge UI
- sync
- auto-promote
- ABW mutation
- packaging
- new product capability

## Test Rules

1. Run on a real machine you actually use, not only in a synthetic test workspace.
2. Record exactly what happened, not what the system was expected to do.
3. Do not silently skip failures. Mark each item `PASS`, `BLOCKER`, `MAJOR UX ISSUE`, `MINOR UX ISSUE`, or `NOT RUN`.
4. Capture screenshots for every blocker and every confusing state.
5. If a disk mutation happened when it should not have happened, stop and report it immediately as a blocker.
6. If the system only replies like a chatbot and does not create a pending edit where expected, mark that as a blocker.

## Environment Checklist

Before running the scenarios, record:

- machine name
- OS version
- display scale percentage
- primary screen resolution
- whether NVIDIA API key is configured
- whether Auto-Accept starts `ON` or `OFF`
- current workspace path
- whether the workspace is trusted

## Evidence To Capture

Capture these for each scenario:

- prompt used
- Auto-Accept state
- whether approval modal appeared
- whether pending edit appeared
- whether Review + Apply was visible
- whether changed-files list updated
- whether recent-action area updated
- whether any UI region was clipped, hidden, or overlapped
- whether Vietnamese wording was understandable
- whether disk file existed before apply
- whether disk file existed after apply
- screenshot path or note
- final classification

## Severity Rules

Use these exact labels:

- `BLOCKER`: core workflow failed, wrong mutation happened, or user cannot safely continue
- `MAJOR UX ISSUE`: workflow technically works but is confusing enough to cause likely mistakes
- `MINOR UX ISSUE`: workflow works and is understandable, but polish is still weak
- `PASS`: behavior is correct and understandable for this scenario
- `NOT RUN`: scenario was not executed

Classify as `BLOCKER` if any of these occur:

- expected pending edit is never created
- disk write happens before Review + Apply
- blocked action is reported as success
- provider failure is reported like success
- key actions are clipped, hidden, or unreachable
- approval or apply state is too ambiguous to safely continue

## Scenario 0 - Shell Readiness

Goal: confirm the shell is understandable before testing mutations.

Check:

- input area is visible
- Send button is visible
- tasks or changed-files area is reachable
- recent-action area is visible
- no critical action is clipped at the bottom
- major user-facing wording is readable Vietnamese or clear mixed Vietnamese-English

Pass criteria:

- user can identify where to send a request
- user can identify where pending work will appear
- user can identify where apply/recovery state will appear

## Scenario 1 - Create File

Suggested Vietnamese prompt:

`Hãy tạo file docs/fix-proposal.md và viết ngắn 3 ý cải thiện quy trình approval/apply.`

Steps:

1. Set Auto-Accept `OFF`.
2. Submit the prompt.
3. Observe whether approval modal appears.
4. Approve if required.
5. Check whether pending edit appears.
6. Confirm the file does not exist on disk before Review + Apply.
7. Click Review + Apply.
8. Confirm the file exists after apply.

Expected UI state:

- approval modal explains that approval alone does not write to disk
- pending edit shows target path
- pending edit is clearly labeled before apply
- Review + Apply is visible and reachable
- applied state is clearly shown after disk mutation

Pass criteria:

- no disk write before apply
- file appears only after apply
- wording is understandable without guessing

## Scenario 2 - Edit Existing File

Suggested Vietnamese prompt:

`Mở file proof/edit_target.py và đổi hàm để trả về a - b thay vì a + b.`

Steps:

1. Use a known existing file in workspace.
2. Submit the prompt with Auto-Accept `OFF`.
3. Approve if required.
4. Confirm pending edit is created.
5. Confirm file content is unchanged before apply.
6. Click Review + Apply.
7. Confirm file changed only after apply.

Expected UI state:

- edit target path is visible
- pending state is clearly different from applied state
- changed-files list reflects the pending edit

## Scenario 3 - Delete File

Suggested Vietnamese prompt:

`Xóa file proof/delete_target.txt.`

Steps:

1. Use a disposable file.
2. Submit the prompt with Auto-Accept `OFF`.
3. Approve if required.
4. Confirm pending delete appears.
5. Confirm file still exists before apply.
6. Click Review + Apply.
7. Confirm file is removed after apply.

Expected UI state:

- delete action is visually clear
- destructive action does not look identical to a neutral action
- file is not removed before apply

## Scenario 4 - Move Or Rename File

Suggested Vietnamese prompt:

`Đổi tên proof/rename_source.txt thành proof/renamed_target.txt.`

Steps:

1. Use a disposable source file.
2. Submit the prompt.
3. Approve if required.
4. Confirm pending move or rename appears.
5. Confirm source still exists and target does not exist before apply.
6. Click Review + Apply.
7. Confirm source is gone and target exists after apply.

Expected UI state:

- source path and target path are both visible
- move or rename intent is easy to understand

## Scenario 5 - Bounded Multi-File Edit

Suggested Vietnamese prompt:

`Sửa proof/multi/a.py và proof/multi/b.py để thêm comment đầu file "validated manually". Không sửa file nào khác.`

Steps:

1. Submit the prompt.
2. Approve if required.
3. Confirm exactly two pending targets appear.
4. Confirm untouched files stay unchanged before apply.
5. Click Review + Apply.
6. Confirm only the intended files changed.

Expected UI state:

- changed-files area clearly shows multiple targets
- user can understand that the scope is bounded

Blocker condition:

- unexpected third file appears
- too many files are included without clear warning

## Scenario 6 - Auto-Accept OFF Approval UX

Goal: specifically validate the approval path.

Suggested Vietnamese prompt:

`Tạo file proof/manual_approval_note.md và ghi 2 dòng mô tả lý do cần approval.`

Check:

- approval modal appears when expected
- modal explains operation type and target path
- modal explains that approval does not write to disk yet
- after approval, pending edit appears
- Review + Apply remains required

Mark `MAJOR UX ISSUE` if:

- the system is technically correct but the user would likely think approval already wrote the file

## Scenario 7 - Auto-Accept ON Fast Path

Goal: validate the faster path without approval interruption.

Suggested Vietnamese prompt:

`Tạo file proof/auto_accept_note.md và ghi ngắn 2 ý về fast path.`

Check:

- no approval modal interrupts the flow
- pending edit still appears before disk write
- Review + Apply still controls the actual disk mutation

Blocker condition:

- Auto-Accept causes silent disk write before apply

## Scenario 8 - Blocked Action

Suggested Vietnamese prompt:

`Tạo file C:\\outside-workspace-test.txt với nội dung hello.`

Goal: confirm blocked behavior is honest and safe.

Expected result:

- action is blocked
- no file is created outside workspace
- UI clearly says no mutation occurred
- recovery guidance is visible

## Scenario 9 - Provider Failure Or Error State

Run this only if it can be done safely on the machine without exposing secrets.

Suggested method:

- temporarily use a missing or invalid provider configuration in a safe test setup
- or use a known provider-error test path already documented by the team

Expected result:

- provider failure is not shown like success
- no trusted success wording is shown
- no disk mutation occurs
- retry or check-key guidance is visible

## Scenario 10 - Visibility, Clipping, And Smoothness Sweep

During all scenarios, explicitly check:

- Send button remains visible
- Review + Apply remains visible when pending edit exists
- changed-files area is reachable
- recent-action area is visible
- no bottom action is clipped by viewport
- panels do not cover important buttons
- scrolling does not hide the user from the next required action
- button spacing is comfortable enough for repeated use

Mark `MAJOR UX ISSUE` if:

- the workflow works but the user must hunt around the UI to find the next action

## Vietnamese Wording Review

For every scenario, note whether these concepts are understandable:

- pending
- approval required
- Review + Apply
- no disk write yet
- disk mutation completed
- blocked
- failed or provider error
- changed files
- recent action

If wording is technically correct but awkward, classify as `MINOR UX ISSUE` or `MAJOR UX ISSUE` depending on how likely it is to cause wrong user action.

## Result Sheet Template

Use one block per scenario:

```text
Scenario:
Prompt:
Auto-Accept:
Approval modal shown: yes/no
Pending edit shown: yes/no
Review + Apply visible: yes/no
Changed files updated: yes/no
Recent action updated: yes/no
Disk file before apply:
Disk file after apply:
Visibility/clipping issue:
Vietnamese wording issue:
Classification: PASS / BLOCKER / MAJOR UX ISSUE / MINOR UX ISSUE / NOT RUN
Evidence:
Notes:
```

## Final Gate Summary Template

After all scenarios, summarize:

- total `PASS`
- total `BLOCKER`
- total `MAJOR UX ISSUE`
- total `MINOR UX ISSUE`
- total `NOT RUN`
- top 3 blockers
- top 3 UX issues
- whether a future gate should prefer:
  - UI Round 3 from new manual findings
  - runtime hygiene/security follow-up
  - hold with no next builder

## Interpretation Rules For The Next Gate

Use these heuristics:

- If there is any unsafe mutation or fake success, prefer a fix sprint immediately.
- If the main failures are visibility, wording, or discoverability, a future UI round may be justified.
- If the main failures are logs, secret handling, stale runtime artifacts, or process cleanup, runtime hygiene/security follow-up may be justified.
- If most scenarios pass and issues are minor, a no-code hold or packaging precheck audit may become reasonable later.

## Boundary Reminder

This validation guide does not authorize:

- bridge UI work
- sync work
- auto-promote work
- ABW mutation
- packaging implementation
- readiness wording upgrade

The current allowed wording remains:

- `BOUNDED_DAILY_USE_CANDIDATE_LOCAL_FILE_WORKFLOWS`
