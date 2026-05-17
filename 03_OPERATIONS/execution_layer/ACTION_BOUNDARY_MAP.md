# Action Boundary Map

LAST UPDATED: 2026-05-17

## Purpose

Define what an AI or operator may do, suggest, or must escalate during execution.

## Ownership

- Canonical owner: `03_OPERATIONS/execution_layer/`
- Contract owner: `01_GOVERNANCE/execution_contracts/`

## Action Classes

### Safe

AI may execute when scope is clear:

- Read local docs.
- Run report-only governance status.
- Inspect git status.
- Run read-only ABW ask with `ABW_READ_ONLY_QUERY=1`.
- Run tests/smokes that are known not to mutate tracked source, while recording warnings.

### Bounded-Risk

AI may assist or execute only with explicit scope and evidence capture:

- ABW ingest to approved local workspace.
- ABW review/report generation.
- NVIDIA bridge preflight.
- Smoke tests that create temp artifacts.
- Dry-run apply plans.

### Human-Review-Required

AI may prepare, explain, and request confirmation, but must not treat outcome as completed without evidence:

- File mutations.
- Apply pending edits.
- `abw apply ... --yes`.
- Draft promotion.
- Workspace trust changes.
- Git staging, discard, commit, or push.
- Any action using private or real work documents.

### Forbidden Autonomy

AI must stop and escalate:

- Auto-promote ABW drafts to trusted wiki.
- Sync/write-back between NVIDIA and ABW without governance approval.
- Delete or discard user work.
- Rewrite historical evidence to appear clean.
- Promote readiness labels.
- Claim production, daily-use, or autonomous safety.

## Boundary Evidence Required

- Requested action.
- Repo path.
- Workspace path.
- Current dirty state.
- Safety class.
- Human confirmation if required.
- Command or endpoint used.
- Result and warnings.
- Residual uncertainty.

## Stop Conditions

Stop before execution when:

- Target workspace is ambiguous.
- Repo has dirty state relevant to the action and no plan to preserve it.
- The action could mutate files or trust state without approval.
- Evidence cannot be captured.
- A result would be interpreted as readiness promotion.
