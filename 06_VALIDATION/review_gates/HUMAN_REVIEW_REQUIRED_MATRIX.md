# Human Review Required Matrix

LAST UPDATED: 2026-05-17

## Purpose

Define operations AI may assist, suggest, execute, or must not perform autonomously.

## Matrix

| Operation | AI May Assist | AI May Suggest | AI May Execute | Explicit Human Confirmation Required |
| --- | --- | --- | --- | --- |
| Read governance docs | Yes | Yes | Yes | No |
| Run governance status | Yes | Yes | Yes | No |
| Inspect git status | Yes | Yes | Yes | No |
| Run scoped tests/smokes | Yes | Yes | Yes, when in scope | Sometimes, if costly or mutating |
| ABW read-only ask | Yes | Yes | Yes, with read-only mode | No for safe local scope |
| ABW ingest approved local docs | Yes | Yes | Yes, if explicitly scoped | Yes for real/private data |
| ABW review | Yes | Yes | Yes, if explicitly scoped | Yes if interpretation affects trust |
| ABW apply dry-run | Yes | Yes | Yes, if scoped | No unless real/private data |
| ABW apply `--yes` | Yes | Yes | No by default | Yes |
| ABW draft promotion | Yes | Yes | No by default | Yes |
| NVIDIA pending edit proposal | Yes | Yes | Yes, as pending review | Review before apply |
| NVIDIA apply pending edit | Yes | Yes | No by default | Yes |
| Workspace trust change | Yes | Yes | No by default | Yes |
| Git stage/commit/push | Yes | Yes | No by default | Yes |
| Git discard/reset | Explain only | Rarely | No | Yes, explicit and narrow |
| Readiness promotion | Draft only | Yes | No | Governance decision required |
| Bridge sync/write-back | Draft only | Yes | No | Governance decision required |

## Rule

If an operation can make data trusted, mutate disk, alter git state, or change readiness interpretation, human review is required.
