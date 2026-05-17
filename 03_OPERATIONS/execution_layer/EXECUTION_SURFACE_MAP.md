# Execution Surface Map

LAST UPDATED: 2026-05-17

## Purpose

Map actual executable surfaces across Control, NVIDIA, and ABW so actions can be classified before execution.

## Ownership

- Canonical owner: `03_OPERATIONS/execution_layer/`
- Related contracts: `01_GOVERNANCE/execution_contracts/`
- Human review gates: `06_VALIDATION/review_gates/`

## Classification Key

- `safe`: read-only or report-only; still requires honest scope.
- `bounded-risk`: may change generated artifacts or local state; evidence and recovery notes required.
- `human-review-required`: may mutate meaningful files, trust state, promotion state, git state, or external state.
- `forbidden-autonomy`: must not be performed by AI without explicit human/governance approval.

## Control Repo Surfaces

| Surface | Examples | Class | Boundary |
| --- | --- | --- | --- |
| Governance status | `tools/governance/runtime-status.ps1` | safe | Advisory only; no readiness proof |
| Governance scans | `scan-*.ps1`, `check-governance.ps1` | safe | Findings require human review |
| Governance doc edits | ownership, recovery, contracts | human-review-required | Must preserve lineage and non-claims |
| Readiness promotion | roadmap/decision changes | forbidden-autonomy | Requires explicit governance decision |

## NVIDIA Repo Surfaces

| Surface | Examples | Class | Boundary |
| --- | --- | --- | --- |
| Status and diagnostics | `npm run governance:status`, `git_status`, health endpoints | safe | Advisory only |
| Read-only file inspection | `read_file`, `list_dir`, `search`, index tools | safe | Must stay in workspace |
| Browser smoke and tests | `npm test`, `browser:smoke`, bridge tests | bounded-risk | May create temp artifacts; evidence must include warnings |
| ABW ask bridge | `/proxy/abw/ask`, `abw-cli-reader ask` | safe | Query path must preserve read-only behavior |
| ABW ingest bridge | `/proxy/abw/ingest` | bounded-risk | Draft/report creation expected; no auto-promote |
| ABW review bridge | `/proxy/abw/review` | bounded-risk | Review output only unless explicit contract changes |
| ABW promote proxy | `/proxy/abw/promote` | human-review-required | Currently fail-closed/manual; must not fake promotion |
| Workspace trust changes | trust API/UI | human-review-required | User must understand workspace scope |
| Pending file edits | `write_file`, `apply_patch`, `delete_file`, `move_file` | human-review-required | Creates reviewable pending operation first |
| Apply pending edit | `apply_pending_edit` | human-review-required | Disk mutation only after approval |
| Shell execution | `execute_command`, command jobs | human-review-required | Requires trust and command-specific evidence |
| Git mutation | stage/unstage/discard/commit | human-review-required | Never discard user work silently |

## ABW Repo Surfaces

| Surface | Examples | Class | Boundary |
| --- | --- | --- | --- |
| Version/doctor/help | `abw version`, `abw doctor`, help | safe | Observational |
| Ask read-only mode | `ABW_READ_ONLY_QUERY=1 abw ask` | safe | Must not write runtime artifacts |
| Ingest | `abw ingest raw` | bounded-risk | Creates drafts/reports; review required |
| Review | `abw review` | bounded-risk | Review output is not promotion |
| Apply dry run | `abw apply --dry-run` | bounded-risk | Plan only |
| Apply with `--yes` | `abw apply ... --yes` | human-review-required | Mutates workspace; rollback evidence required |
| Promote drafts | API/legacy promotion path | human-review-required | Requires explicit evidence and review |
| Runner/AI execution | `runner`, `ai_runner`, continuation execute | human-review-required | Must surface blocked/uncertain state |
| Auto-promotion/sync | legacy sync/promote behavior | forbidden-autonomy | Not approved for autonomous bridge execution |

## Do Not Duplicate

Do not copy this table into validation reports. Reference it and record only operation-specific evidence.
