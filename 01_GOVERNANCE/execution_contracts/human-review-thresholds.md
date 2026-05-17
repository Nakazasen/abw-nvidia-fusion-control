# Human Review Thresholds

LAST UPDATED: 2026-05-17

## Purpose

Define when AI must stop and request explicit human review before execution or interpretation.

## Human Review Required

- File mutation beyond report-only generated artifacts.
- Applying pending edits.
- Running ABW apply with `--yes`.
- Promoting drafts.
- Trusting a workspace.
- Running commands that modify local or external state.
- Git stage, discard, commit, push, or reset.
- Real/private document pilot execution.
- Readiness label changes.
- Architecture boundary expansion.

## AI May Assist

- Prepare commands.
- Explain expected effects.
- Run read-only checks.
- Run bounded tests when requested or clearly in scope.
- Summarize evidence.
- Draft governance updates.

## AI Must Stop

- If user work may be discarded.
- If target repo/path is ambiguous.
- If a command could mutate state outside scope.
- If success cannot be verified.
- If the next step would create an overclaim.

## Review Evidence

Human review should leave evidence:

- User approval in chat or UI.
- Command/result output.
- Before/after file or git status.
- Validation report or handoff update when operationally meaningful.
