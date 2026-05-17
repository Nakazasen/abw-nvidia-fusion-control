# DOCUMENT_LIFECYCLE

## Purpose

Define lifecycle states so documents can be checked without flattening history.

## Scope

- Active canonical docs.
- Derived snapshots.
- Helper docs.
- Evidence reports.
- Archive and legacy documents.

## Enforcement Philosophy

- Lifecycle state controls authority.
- Archive status does not reduce historical value.

## Detection Rules

- Canonical docs must include purpose, ownership, and source-of-truth or canonicality metadata.
- Derived docs must point to canonical owners.
- Helper docs must not own readiness or milestone truth.
- Evidence docs are append-only and may contain old failures.
- Archive docs must live under `07_HISTORY/` or be explicitly marked legacy/superseded.

## Escalation Rules

- Critical: canonical doc missing or unowned.
- High: helper doc claims canonical authority.
- Medium: lifecycle state missing.
- Low: archive doc lacks a compact explanation.

## Non-Goals

- Does not force all historical docs into the same template.
- Does not remove old wording from preserved artifacts.

## Anti-Pattern Examples

- Moving a fail report into archive to hide it.
- Renaming a derived snapshot as canonical without decision record.

## Future Automation Hooks

- Validate lifecycle states from `document-lifecycle.json`.
- Generate lifecycle inventory.

