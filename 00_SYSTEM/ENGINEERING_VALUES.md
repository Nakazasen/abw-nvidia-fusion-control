# ENGINEERING_VALUES

## Purpose

Define the engineering behavior standards that prevent fake progress and preserve recoverability.

## Ownership

- Owner: Architect + Auditor
- Canonicality: Canonical values document

## SOURCE OF TRUTH

- Enforcement references: `05_DECISIONS/DECISIONS.md`, `05_DECISIONS/RISKS.md`, `01_GOVERNANCE/AI_AGENT_OPERATING_RULES.md`.

## Values

- Clarity: all readiness claims must cite scope and evidence.
- Rigor: every major claim needs test + operational proof context.
- Traceability: decisions, blockers, and outcomes must be linkable.
- Honesty: report failures exactly; never smooth over regressions.
- Boundary discipline: keep Control/NVIDIA/ABW scopes explicit.

## What Counts As Real Validation

- Reproducible test evidence in relevant repos.
- Operational behavior validated against declared scope.
- No hidden mutation across read-only boundaries.
- Consistency between code state and governance records.

## What Counts As Fake Progress

- Claiming readiness from single-path demo success.
- Hiding warnings or known blockers in summaries.
- Treating helper/snapshot docs as canonical truth.
- Treating unchanged tests as proof of changed behavior.

## What Counts As Governance Theater

- Producing polished docs that contradict local repo state.
- Copying mirrors across files without ownership boundaries.
- Declaring milestones without decision/risk/handoff alignment.

