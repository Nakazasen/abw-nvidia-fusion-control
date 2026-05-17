# Execution Trace Model

LAST UPDATED: 2026-05-17

## Purpose

Define a lightweight trace shape for meaningful operations without pretending enterprise telemetry exists.

## Ownership

- Canonical owner: `03_OPERATIONS/execution_layer/`
- Tool prototype: `tools/governance/execution-trace.ps1`

## Trace Fields

- `trace_id`: human-readable local identifier.
- `created_at`: local timestamp.
- `actor`: human, Codex, GPT, or tool.
- `repo`: Control, NVIDIA, ABW, or cross-repo.
- `workspace_path`: local path.
- `action`: operation name.
- `safety_class`: safe, bounded-risk, human-review-required, or forbidden-autonomy.
- `evidence_before`: git status, docs read, blockers checked.
- `command_or_endpoint`: command, script, endpoint, or manual procedure.
- `result`: pass, fail, blocked, warning, not-run.
- `warnings`: uncertainty or stale state.
- `governance_constraints`: relevant docs/contracts.
- `evidence_after`: files changed, report path, logs, test result.
- `non_claims`: what the trace does not prove.

## Trace Storage

Default storage is optional and local. Trace summaries may be attached to validation reports or session handoff entries when they matter.

## Non-Goals

- No autonomous monitoring.
- No tamper-proof audit log.
- No production telemetry.
- No complete traceability guarantee.
