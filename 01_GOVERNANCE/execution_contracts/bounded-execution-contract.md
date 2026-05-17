# Bounded Execution Contract

LAST UPDATED: 2026-05-17

## Purpose

Keep execution useful while preventing false autonomy and unbounded mutation.

## Execution Classes

- `safe`: read-only/report-only; execute with scope clarity.
- `bounded-risk`: execute only with explicit scope and evidence capture.
- `human-review-required`: prepare and request approval before execution.
- `forbidden-autonomy`: stop and escalate.

## Bounded Execution Rules

- Prefer read-only inspection before mutation.
- Prefer dry-run before apply.
- Prefer scoped tests before broad test suites when investigating.
- Preserve dirty work.
- Record uncertainty rather than hiding it.
- Treat passing tests as scoped evidence only.

## Forbidden Without Explicit Governance Decision

- ABW auto-promote from NVIDIA.
- Cross-repo sync/write-back.
- Production readiness promotion.
- Autonomous git discard/reset.
- Silent mutation of real/private data.

## Anti-Pattern Examples

- Adding a convenience script that mutates state without review.
- Treating Review UI visibility as review completion.
- Treating fail-closed promote as successful promote.
- Using "execution layer" language to imply autonomy.
