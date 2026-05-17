# Safe Automation Boundaries

LAST UPDATED: 2026-05-17

## Purpose

Define automation that is acceptable without implying autonomy.

## Safe Automation

- Read-only file inspection.
- Git status inspection.
- Governance contract JSON parse checks.
- Report-only status scripts.
- Read-only ABW ask with runtime artifact suppression.
- Dry-run planning.
- Local smoke tests with known bounded side effects.

## Bounded Automation

Allowed when scoped and evidence is recorded:

- Ingest into approved local workspace.
- Review report generation.
- Bridge preflight validation.
- Execution trace template generation.
- Browser smoke tests.

## Unsafe Automation

Not allowed without explicit review:

- Applying pending edits.
- ABW apply with `--yes`.
- Draft promotion.
- Workspace trust changes.
- Git mutations.
- Cross-repo sync/write-back.
- Private data processing.

## Forbidden Automation

- Auto-promote ABW drafts from NVIDIA bridge.
- Auto-discard dirty work.
- Auto-promote readiness labels.
- Rewrite or delete failure evidence.
- Claim safety because warnings are absent.
