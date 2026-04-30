# Risks

## Agent Writes To The Wrong Repo

Risk:

- An agent edits the wrong repository.

Mitigation:

- Every implementation prompt must state the single allowed write workspace.
- Every implementation prompt must state the forbidden paths explicitly.

## Architectural Divergence

Risk:

- NVIDIA evolves as a product shell while ABW evolves as a governance engine, but the bridge assumptions drift apart.

Mitigation:

- Maintain this control repo as the shared governance layer.
- Re-sync roadmap, handoff, bridge contract, and integration journal after major changes.

## Provider Dependence

Risk:

- The system becomes too dependent on one model provider or branding assumption.

Mitigation:

- Keep provider abstraction in NVIDIA.
- Treat the long-term value as runtime, governance, and knowledge discipline rather than provider lock-in.

## ABW Gets Diluted Into An App Framework

Risk:

- ABW loses its governance role by being treated as a general app framework inside NVIDIA.

Mitigation:

- Keep ABW as the canonical governance engine.
- Keep NVIDIA as the product shell and active runtime.

## NVIDIA Bypasses ABW Governance

Risk:

- Self-improvement or write flows in NVIDIA skip continuation rules, locked decisions, rollback contracts, or evidence checks.

Mitigation:

- Bridge policy must require ABW governance for governed write/action flows.
- Add future bridge/e2e checks for gate semantics.

## False Grounding

Risk:

- Enterprise answers appear confident without adequate evidence.

Mitigation:

- Preserve explicit answer states such as `grounded`, `draft`, `pending_grounding`, `disputed`, `stale`, and `missing`.
- Surface sources, warnings, and gaps in UI rather than hiding them in prose.

## Sensitive Data Exposure

Risk:

- `.brain`, `raw/`, reports, or logs may contain enterprise-sensitive material.

Mitigation:

- Keep raw/private state out of Git by default.
- Version only sanitized schemas, policies, decisions, and approved docs.

## Overengineering The Bridge Too Early

Risk:

- The team jumps to FastAPI, gRPC, or deeper integration before a CLI bridge proves value.

Mitigation:

- Keep bridge work CLI-first.
- Add API/service transport only after contract and status semantics stabilize.

## Role Confusion

Risk:

- Architect, Builder, and Auditor scopes blur and create weak accountability.

Mitigation:

- Prompts must state role, allowed paths, forbidden paths, and expected artifacts.

## Missing Human Checkpoints

Risk:

- Architecture or governance changes land without human review.

Mitigation:

- Require human review for major bridge milestones, architectural decisions, and enterprise data policy changes.

## Control Repo Drift

Risk:

- Control repo docs drift behind the observed ABW and NVIDIA repos, causing wrong planning or false integration claims.

Mitigation:

- Re-sync control docs after each ABW release baseline change or NVIDIA sprint close.
- Treat integration journal, roadmap, handoff, and bridge contract as living governance artifacts.

## ABW Release Truth Drift

Risk:

- ABW release truth diverges across `pyproject.toml`, tags, release notes, changelog, and control-repo assumptions.

Mitigation:

- Treat observed `v1.1.0` as the current baseline until newer evidence exists.
- Require future bridge and handoff updates to cite the version evidence source explicitly.

## Bridge Too Text-Based

Risk:

- Bridge design stays at prose level too long, without stable field contracts for status, warnings, sources, gaps, and stop conditions.

Mitigation:

- Define command, JSON, and result contracts before implementation.
- Map ABW runtime fields to NVIDIA UI states explicitly in `BRIDGE_CONTRACT.md`.

## NVIDIA Audit Harness Is Not Full E2E

Risk:

- `npm run agent:audit` may be mistaken for proof that bridge behavior, governance gates, rollback, or enterprise grounding actually work.

Mitigation:

- Treat the current harness as capability smoke evidence only.
- Add future bridge/e2e checks before claiming integration readiness.

## Context Picker Locks In Too Early

Risk:

- Sprint 2 Context Picker may be designed before ABW context semantics are defined, making future ABW context hard to surface cleanly.

Mitigation:

- Reserve future context types now: `@abw`, `@wiki`, `@gaps`, `@route`, `@decision`.
- Keep Sprint 2 context plumbing extensible so ABW-governed context can be added without a redesign.
