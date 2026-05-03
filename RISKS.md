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
- Add future bridge/E2E checks for gate semantics.

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
- Sprint state drifts if the control repo is not updated after each NVIDIA push.

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
- Syntax or headless checks may be mistaken for full browser E2E.

Mitigation:

- Treat the current harness as capability smoke evidence only.
- Add future bridge/E2E checks before claiming integration readiness.

## Enterprise Mode Is Not A Complete Security Boundary

Risk:

- Enterprise mode may hide UI visually while backend endpoints still rely on trust and approval rules.
- UI hiding must not be treated as a complete security boundary by itself.

Mitigation:

- Treat Enterprise mode as UX restriction, not as a replacement for backend trust and approval controls.
- Keep trust and approval enforcement server-side in NVIDIA.
- Keep ABW bridge status documented separately from UI mode work.

## Sprint Handoff Drift

Risk:

- The next sprint may start before the previous sprint state is properly recorded in the control repo.

Mitigation:

- Update integration journal, handoff, and roadmap immediately after each verified NVIDIA push.
- Require the control repo review step before the next builder prompt is issued.

## Extension UX Security Expansion

Risk:

- Extension install/activate/run-command work may introduce security risks if approval gates are weak or missing.

Mitigation:

- Require explicit approval and trust review for extension install and execution surfaces.
- Audit extension UX changes separately before claiming the sprint is safe.

## Save Path Trust/Approval Bypass

Risk:

- Editor save/write paths might bypass trust checks or explicit approval boundaries if frontend and backend assumptions drift.

Mitigation:

- Keep server-side trust and approval enforcement mandatory for write paths.
- Keep save-path smoke checks in sprint-close validation and document results in control journal entries.

## Index Runtime Cache Staging

Risk:

- Generated `.nvidia-agent/index` runtime cache files may be accidentally staged or committed.
- Index build may include sensitive/generated/huge files if skip rules drift.
- Search/ranking may accidentally start requiring external providers and break offline expectations.

Mitigation:

- Keep `.nvidia-agent` runtime cache ignored in Git and verify staging before commit.
- Enforce and test skip rules for `node_modules`, `.git`, dist/build, `.nvidia-agent`, binary files, and large files.
- Keep lexical/offline fallback as default and treat external provider use as optional, explicit, and separately audited.

## Context Picker Locks In Too Early

Risk:

- Context Picker may be designed before ABW context semantics are defined, making future ABW context hard to surface cleanly.

Mitigation:

- Reserve future context types now: `@abw`, `@wiki`, `@gaps`, `@route`, `@decision`.
- Keep context plumbing extensible so ABW-governed context can be added without a redesign.

## Roadmap Drift If Not Recorded

Risk:

- Implementation order changes without a control-repo record and the team starts following chat memory instead of documented truth.

Mitigation:

- Record roadmap changes in `DECISIONS.md`.
- Update `ROADMAP.md`, `HANDOFF.md`, and `INTEGRATION_JOURNAL.md` together.

## Capability Overclaim At Phase Boundaries

Risk:

- Phase-end messaging claims more than the audit evidence supports.

Mitigation:

- Add explicit milestone gates, non-claim language, and mandatory review checkpoints before any phase-end claim is accepted.

## System Bloat / Codebase Becoming Uncontrollable

Risk:

- Sprint accumulation increases complexity, dead code, duplicated UI, and stale runtime artifacts until delivery slows down or reliability falls.

Mitigation:

- Trigger cleanup or refactor sprints when audit checkpoints show bloat.
- Require every major audit to assess code size, duplication, and stale runtime files.

## Self-Learning Without Evidence Gate

Risk:

- Knowledge ingestion or auto-research starts merging unverified material into the governed knowledge base.

Mitigation:

- Require verification, conflict handling, and merge gates before any knowledge promotion.
- Treat unknown as a gap and weak source as draft only.

## Tool Generation Without Ground Truth

Risk:

- Generated tools appear impressive but are not validated against datasets, expected outputs, or production reality.

Mitigation:

- Require test datasets, ground truth, human review, audit, and rollback plans before tool-generated capability is treated as real.

## Production Automation Tool Overclaim

Risk:

- Internal helper tools for production support are described as production-ready before they pass realistic evaluation.

Mitigation:

- Distinguish helper, prototype, pilot, and production-ready status explicitly.
- Require manufacturing-specific audit evidence before any production-readiness claim.

## Browser E2E Gap

Risk:

- Foundational UI work accumulates without browser smoke evidence, allowing regressions to hide behind static or API checks.

Mitigation:

- Keep Sprint 9 as the immediate browser smoke baseline gate.
- Do not proceed to stronger daily-use claims if browser smoke fails.

## Local Plaintext API Key Storage Risk

Risk:

- Sprint 10 provider secrets are stored as local plaintext runtime state.
- This may be misunderstood as encrypted storage if not explicitly documented.

Mitigation:

- Keep explicit warnings in roadmap/handoff/journal that encryption is not implemented.
- Keep secret files out of Git and verify staging before every commit.

## Provider Configuration Overclaim Risk

Risk:

- Provider list/support UI can be mistaken for full provider execution support.
- Non-NVIDIA providers may be presented as configured while not fully wired for real chat execution.

Mitigation:

- Keep non-NVIDIA status language explicit: config-ready, not fully wired for real chat execution.
- Require provider capability verification evidence before changing claim level.

## API Key Leakage Into Smoke Artifacts Risk

Risk:

- Browser smoke reports/logs/screenshots may accidentally capture raw test keys.

Mitigation:

- Keep smoke scenarios secret-safe and avoid entering real keys.
- Run post-smoke leak scans in logs/reports/diffs before commit/push.

## Settings Mutation Guard Drift Risk

Risk:

- Enterprise/IDE guard behavior may drift if frontend/backends evolve separately.

Mitigation:

- Keep server-side mutation guard mandatory (`uiMode` + approval header).
- Re-run mutation guard smoke checks during Sprint close audits.

## ABW Bridge Delay

Risk:

- NVIDIA UX advances while ABW bridge work remains delayed, creating a widening gap between prototype utility and governed trust capability.

Mitigation:

- Keep bridge milestones explicit in Phase 3 and treat the bridge as not implemented until audited evidence exists.

## Confusing Prototype/Demo With Production-Ready System

Risk:

- A strong prototype or demo is mistaken for a stable daily-use system, Cognitive OS, or enterprise runtime.

Mitigation:

- Use milestone tables with explicit non-claims.
- Require audit-backed capability language at every major phase boundary.

## Inline Edit Overclaim Risk

Risk:

- Sprint 11 inline edit may be mistaken for full Cursor parity.

Mitigation:

- Keep claim scope limited to proposal-oriented inline edit workflow.
- Keep explicit non-claim language for full Cursor parity.

## Dirty State / Pending Edit Consistency Risk

Risk:

- Dirty editor state and pending-edit state can drift, causing false clean-state assumptions.

Mitigation:

- Keep dirty-state tied to real apply outcome, not pending-edit creation.
- Include dirty-state checks in sprint-close audits.

## Inline Edit Provider Reliability Risk

Risk:

- Inline edit generation can fail or degrade when provider routing/availability changes.

Mitigation:

- Keep safe failure handling and explicit error surfacing.
- Avoid fake-success behavior when provider call is unavailable.

## Inline Edit Direct-Write Bypass Risk

Risk:

- Inline edit path could regress into direct disk writes without pending review.

Mitigation:

- Keep proposal-only pending-edit flow as invariant.
- Re-verify apply-guard and review/apply requirement in every audit.

## Inline Edit Browser Coverage Gap Risk

Risk:

- Browser smoke may not fully validate provider-backed inline generation in all runtime conditions.

Mitigation:

- Treat smoke as baseline evidence only.
- Add deeper provider-backed E2E checks before stronger inline-edit claims.

## Project Rules Overclaim Risk

Risk:

- Sprint 15 Project Rules / Memory may be overclaimed as governance proof or ABW-equivalent control.

Mitigation:

- Keep explicit language: rules are guidance only, not ABW governance/proof.
- Require ABW bridge implementation and audit evidence before governance-level claims.

## Hidden/Accidental Self-Learning Risk

Risk:

- Runtime rules/memory updates may be misinterpreted as autonomous learning.

Mitigation:

- Keep explicit save-only behavior (user-triggered mutation only).
- Keep explicit warning text: no automatic self-learning.

## Secret Persistence In Rules/Memory Risk

Risk:

- Secret-like content could be saved in project rules/memory runtime files.

Mitigation:

- Keep secret-like detection and reject persistence paths.
- Re-run secret persistence smoke checks during sprint close.

## Rules Context Poisoning Risk

Risk:

- Malicious or low-quality rules could bias agent behavior through context injection.

Mitigation:

- Keep bounded context summaries and category/priority/source validation.
- Keep review and approval requirements for mutations.

## Disabled Rules Leakage Into Context Risk

Risk:

- Disabled rules/memory may still leak into active agent context.

Mitigation:

- Keep enabled-only filtering in context builders.
- Re-verify with marker-based include/exclude smoke checks.

## Browser Smoke Coverage Gap For Long-Horizon Rule Behavior

Risk:

- Browser smoke can pass while long-horizon rule behavior remains under-tested.

Mitigation:

- Treat browser smoke as baseline only, not full E2E.
- Add longer-horizon evaluation scenarios before daily-use readiness claims.

## INTERNAL_DAILY_USE_CANDIDATE Overclaim As Production-Ready

Risk:

- Sprint 16 candidate status may be overclaimed as production readiness.

Mitigation:

- Keep explicit language that INTERNAL_DAILY_USE_CANDIDATE is not production-ready.
- Require Phase 1 Gate Review before any readiness upgrade claim.

## Sprint 17 Starts Without Phase 1 Gate Review

Risk:

- Team may start Sprint 17 implementation before Phase 1 gate decision.

Mitigation:

- Lock next step to Phase 1 Gate Review before Sprint 17.
- Reject Sprint 17 builder prompts until gate review outcome is recorded.

## 97/0 Browser Smoke Mistaken As Full E2E

Risk:

- A clean 97/0 smoke result may be misread as full E2E proof.

Mitigation:

- Keep explicit warning that browser smoke is not full E2E coverage.
- Require separate long-horizon and scenario-depth validation before stronger claims.

## Inline Edit Deep Observability Gap

Risk:

- Inline edit deep observability remains warn-level in smoke and can hide real behavior gaps.

Mitigation:

- Keep limitation visible in handoff/journal.
- Add deeper inline-edit observability checks in future gate hardening.

## Non-NVIDIA Provider Real-Execution Gap

Risk:

- Non-NVIDIA providers remain not fully wired for real chat execution but may be over-assumed as production-capable.

Mitigation:

- Keep capability language explicit and conservative.
- Require provider-specific real execution evidence before readiness upgrade claims.

## Sprint 80 Monolith Risk

Risk:

- Sprint 80 is safe only if architecture/load control keeps pace; Sprint 80 without modularization, runtime budgets, and service separation could produce a heavy, fragile, unusable system.

Mitigation:

- Use recurring cleanup gates, performance budgets, module split plans, and phase audits before major capability jumps.

## nvidia_playground.html Monolith Risk

Risk:

- `nvidia_playground.html` can become a large all-in-one UI where unrelated features break each other and AI edits become unsafe.

Mitigation:

- Gradually move toward a thin shell with focused UI modules such as settings, SCM, tasks, rules, security, diagnostics, and composer modules.

## browser-smoke.mjs Test-Monolith Risk

Risk:

- `tools/browser-smoke.mjs` can become a fragile test monolith where one failure hides unrelated regressions or makes smoke runs too slow for daily use.

Mitigation:

- Split browser smoke into organized modules/suites while preserving a fast default gate and a fuller optional suite.

## Unbounded .nvidia-agent Runtime Data Risk

Risk:

- `.nvidia-agent` reports, tasks, rules, security logs, diagnostics, index, profile, tmp, and screenshots can grow forever, leak sensitive data, or corrupt startup through stale state.

Mitigation:

- Cap count or size, rotate artifacts, cleanup stale state, keep runtime ignored, and scan for secrets before any evidence promotion.

## Feature-First Growth Outrunning Architecture Risk

Risk:

- Future sprints may add features faster than architecture, test organization, security boundaries, and rollback paths can support.

Mitigation:

- Treat Performance & Bloat Budget Gate as mandatory after Sprint 16 and insert cleanup/hardening sprints when gate evidence requires it.

## Heavy Worker Tasks Running In IDE Process Risk

Risk:

- Self-growing wiki, auto research, ingest, tool generation, OCR/vision, local model jobs, or ABW bridge work may block or destabilize the IDE process if run inline.

Mitigation:

- Prefer worker/service separation; keep the IDE as a control panel and run heavy work on demand with observable job boundaries.

## ABW Bridge / Self-Growing Wiki / Tool-Generation Bloat Risk

Risk:

- Bridge, knowledge growth, and tool-generation phases can add large trust, data, and execution surfaces that overwhelm the current shell if not governed.

Mitigation:

- Require trust/safety audits before those phases and keep ABW bridge disabled/off until explicitly enabled and audited.

## Weak Performance Budget Risk

Risk:

- Without budgets, startup time, smoke runtime, memory use, and runtime artifact growth can decay slowly until the system becomes unpleasant to use.

Mitigation:

- Record practical metrics after Sprint 16 and revise budgets only with evidence.

## Lazy-Loading Failure Risk

Risk:

- Features may load or refresh eagerly at startup, creating slow boot, noisy API calls, and hidden dependency chains.

Mitigation:

- Load SCM, Problems, Project Rules, Reports, Index search, browser automation, and ABW bridge only on demand unless a gate explicitly accepts the cost.

## Missing Feature Off-Switch Risk

Risk:

- Large or risky features without safe mode/off switches can block normal work when they fail or become expensive.

Mitigation:

- Require off-switches or degraded modes for semantic index, browser automation, project rules injection, ABW bridge, extension host, diagnostics sync, provider integrations, and future self-growing wiki.

## AI Edit Blast Radius Risk

Risk:

- Poor modular boundaries let an AI agent modify one area and accidentally break distant UI, server, or test behavior.

Mitigation:

- Split modules, keep file ownership clear in builder prompts, expand focused smoke checks, and require auditor review after builder sprints.

## Phase 1 Gate Result B Risk Carry-Over (Active)

Risk:

- Phase 1 Gate selected `B. INSERT_SPRINT_16_5_CLEANUP`, so key growth risks remain active until cleanup is completed and re-gated.

Active risk cluster:

- Monolith growth risk remains active (`nvidia_playground.html`, `tools/nvidia-server.mjs`, `tools/browser-smoke.mjs`).
- Runtime artifact growth remains active (`.nvidia-agent/reports`, `.nvidia-agent/security`, `.nvidia-agent/index`).
- Plaintext runtime provider secret storage remains a documented trust risk.
- Inline edit deep observability remains warn-level in smoke.

Mitigation:

- Sprint 16.5 cleanup must add baseline measurements, runtime rotation/caps, modular split plan, and recurring audit checks.
- Do not start Sprint 17 until post-cleanup gate explicitly records `A. PROCEED_TO_SPRINT_17`.

## Sprint 16.5 Partial Mitigation Risk Carry-Over (Active)

Risk:

- Sprint 16.5 reduced risk through measurement and hygiene tooling, but does not eliminate monolith/modularity/runtime growth risk by itself.
- Runtime artifact growth is only partially mitigated: dry-run and boundary safety exist, but apply/rotation policy still requires careful governance.
- Security JSONL growth risk remains active because `securityRotation` is `NOT_ROTATED_YET` for single-file growth scenarios.
- Idle memory baseline remains incomplete (`NOT_MEASURED_YET`), limiting performance trend confidence.
- Sprint progression risk remains if Sprint 17 is started before post-cleanup re-gate explicitly selects `A`.
- Provider plaintext secret storage risk remains unchanged.

Mitigation:

- Keep Sprint 17 blocked until post-cleanup re-gate decision is explicitly recorded.
- Add safe JSONL rotation policy/implementation for large single-file audit logs before stronger readiness claims.
- Preserve conservative performance claims until idle memory baseline is measured.
- Keep runtime hygiene in dry-run-by-default posture unless explicit controlled apply workflow is approved.
- Keep explicit warnings that provider key storage is local plaintext runtime state until hardening evidence changes this truth.

## Post-Re-Gate A Carry-Over Risk Cluster (Active)

Risk:

- Re-gate `A` authorizes Sprint 17, but runtime/data hardening remains partial.
- `securityRotation: NOT_ROTATED_YET` remains active for single-file growth scenarios (notably `security/permission-audit.jsonl`).
- `idleMemoryEstimateMb: NOT_MEASURED_YET` remains an incomplete baseline.
- Monolith surfaces remain large and currently rely on plan+discipline, not completed structural split.
- Runtime hygiene apply/rotation policy still requires caution to avoid unintended deletions or trust drift.
- Provider plaintext secret storage risk remains unchanged.

Mitigation:

- Treat these items as mandatory Sprint 17 carry-over controls, not optional cleanup debt.
- Preserve dry-run-first hygiene posture and explicit apply guard.
- Implement safe JSONL rotation policy before stronger runtime-operations claims.
- Keep non-claim boundaries explicit until memory/rotation gaps are closed by evidence.

## Sprint 17 Modularization Carry-Over Risk Cluster (Active)

Risk:

- Monolith risk is only partially mitigated by the first route extraction and remains active.
- Runtime hygiene/data growth risk remains active because `securityRotation` is still `NOT_ROTATED_YET`.
- Idle memory performance baseline remains incomplete (`NOT_MEASURED_YET`).
- New endpoint additions during modularization can expand attack and maintenance surface if not kept read-only and explicitly gated.
- ABW bridge is still not implemented.
- Provider plaintext secret storage risk remains unchanged.

Mitigation:

- Keep Sprint 18 scope constrained to modular split discipline, safety boundaries, and evidence-backed claims.
- Preserve dry-run-first runtime hygiene posture and explicit apply guard.
- Prioritize safe rotation strategy for large single JSONL files.
- Keep endpoint expansion read-only by default unless explicitly gated with stronger trust controls.
- Keep ABW bridge and production/security claims blocked until audited implementation evidence exists.

## Post-Sprint 17 Dependency-Gate Risk Cluster (Active)

Risk:

- Premature ABW bridge risk: NVIDIA can appear integrated while ABW ingest remains prompt-dependent.
- Fake Cognitive OS overclaim risk if bridge UI exists but governed ingest/input is weak.
- Weak governed ingest/input pipeline risk before ABW v1.2 ingest hardening proof.
- Domain contamination risk if ingest maturity is not proven with explicit controls.
- Manual prompt-dependent ingest risk (not robust runtime behavior).
- Bridge UI masking weak ABW ingestion risk.

Mitigation:

- Gate deep bridge on ABW v1.2 Ingest Kernel Hardening evidence.
- Require one-command `raw/` ingest proof.
- Require drafts/manifests/reports/review queue outputs with visible failed/skipped files.
- Require no blind auto-promote and no grounded claim without valid source.
- Keep Sprint 18-19 focused on NVIDIA modularization/runtime hardening.

## Sprint 18 Browser Smoke Modularization Risk Cluster (Active)

Risk:

- Browser smoke monolith risk is an active Sprint 18 target.
- Regression risk if smoke semantics/check count/pass-fail behavior changes during split.
- Flaky test risk can increase if modularization introduces timing/order drift.
- False confidence risk remains: browser smoke is not full E2E proof.
- Bridge risk remains dependency-gated on ABW ingest maturity.

Mitigation:

- Preserve `tools/browser-smoke.mjs` as stable entrypoint.
- Preserve current `99/0` behavior or explicitly document intentional check-count changes.
- Require GPT audit/fix before commit.
- Preserve runtime artifact staging safety and reporting boundaries.
- Preserve non-claims and do not escalate readiness claims from smoke-only evidence.

## Post-Sprint 18 Carry-Over Risk Cluster (Active)

Risk:

- Browser smoke monolith risk is partially mitigated, not eliminated.
- Browser smoke remains baseline evidence, not full E2E proof.
- `securityRotation: NOT_ROTATED_YET` remains active.
- Idle memory remains unresolved/not fully measured.
- Runtime hygiene apply remains caution-sensitive.
- ABW bridge remains dependency-gated on ABW ingest maturity.

Mitigation:

- Continue Sprint 19 in NVIDIA modularization/runtime hardening scope only.
- Preserve dry-run-first runtime hygiene posture.
- Keep non-claim language explicit in governance and sprint-close records.
- Keep ABW bridge/ingest implementation claims blocked until audited proof exists.

## Sprint 19 Runtime Hygiene/Budget Target Risk Cluster (Active)

Risk:

- `securityRotation: NOT_ROTATED_YET` remains active and is now a Sprint 19 target.
- `idleMemoryEstimateMb: NOT_MEASURED_YET` remains active and is now a Sprint 19 target.
- Destructive cleanup risk increases if dry-run-first invariant is violated.
- False confidence risk exists if measurement claims are recorded without machine-readable evidence.
- Bridge risk remains dependency-gated on ABW ingest maturity.

Mitigation:

- Preserve dry-run default behavior.
- Require explicit `--apply` only when safe and audited.
- Restrict cleanup/rotation strictly under `.nvidia-agent`.
- Require machine-readable evidence artifacts for reported metrics.
- Require GPT audit/fix before commit.
- Preserve non-claims and do not escalate capability language.

## Post-Sprint 19 Carry-Over Risk Cluster (Active)

Risk:

- `idleMemoryEstimateMb` risk is partially mitigated by startup-point measurement, but not eliminated.
- `securityRotation: NOT_ROTATED_YET` remains active (detection/reporting only).
- Runtime hygiene destructive cleanup risk remains if dry-run-first invariant is violated.
- Browser smoke remains baseline evidence, not full E2E proof.
- ABW bridge remains dependency-gated on ABW ingest maturity.
- ABW ingest maturity is now the next-phase focus/risk for Sprint 20-22.

Mitigation:

- Keep runtime hygiene default as dry-run.
- Require explicit `--apply` only under safe audited workflow.
- Preserve strict `.nvidia-agent` boundary guard for cleanup/rotation paths.
- Require machine-readable evidence for memory/runtime claims.
- Keep ABW bridge blocked until ABW ingest baseline proof is demonstrated.

## Sprint 20 Ingest Baseline/Governance Risk Cluster (Active)

Risk:

- ABW ingest maturity risk is now the active Sprint 20 focus.
- Prompt/agent-dependent ingest behavior remains a governance risk.
- Missing/partial `manifest/report/review/gap` behavior can create false confidence if not mapped explicitly.
- Blind auto-promote risk remains forbidden.
- Domain contamination risk remains active.
- Bridge remains dependency-gated on ingest baseline proof.
- Gap-map inaccuracy risk can misdirect Sprint 21-22 hardening.

Mitigation:

- Require an evidence-backed gap matrix (`implemented / partial / missing`) with source references.
- Require a validation/test plan for failed/skipped visibility and provenance checks.
- Require no grounded claim without valid source.
- Require no blind auto-promote.
- Require explicit failed/skipped visibility in outputs.
- Require GPT audit/fix before accepting Sprint 20 result.

## Post-ABW Sprint 20 Carry-Over Risk Cluster (Active)

Risk:

- ABW ingest maturity remains unresolved after Sprint 20 (docs-only baseline, no implementation hardening yet).
- Domain contamination guard remains missing.
- Blind auto-promote path remains an active trust-boundary risk.
- Gap report is not fully tied to ingest output as an automatic machine-readable contract.
- Two test failures remain documented as pre-existing/out-of-scope:
  - `tests/test_abw_inspect.py::test_inspect_docx_heavy_workspace`
  - `tests/test_abw_gaps.py::test_xls_heavy_workspace_reports_format_block`
- Sprint 20 gap map is evidence/planning baseline, not an implementation fix.

Mitigation:

- Keep Sprint 21-22 focused on targeted ingest hardening from the Sprint 20 gap map.
- Add contamination guard and manual-mode no-blind-auto-promote enforcement tests.
- Add ingest-bound machine-readable gap output contract.
- Keep bridge blocked until ingest baseline proof is implementation-backed and audited.

## Sprint 21 Promotion-Safety Risk Cluster (Active)

Risk:

- Blind auto-promote risk is the active Sprint 21 target.
- Hidden wiki write side-path risk must be audited and removed from accepted behavior.
- Self-growing wiki overclaim risk remains active if promotion is not explicit-review gated.
- Manual review enforcement gap remains active until Sprint 21 implementation/audit completes.
- Bridge remains dependency-gated on ingest baseline proof.
- Domain contamination remains active carry-over risk for a later sprint.

Mitigation:

- Require explicit approval before wiki write/promotion.
- Add regression tests for no silent promote behavior.
- Audit all promote/write paths in ingest and knowledge flows.
- Require GPT audit/fix before commit.
- Preserve non-claims.

## Post-ABW Sprint 21 Carry-Over Risk Cluster (Active)

Risk:

- Blind auto-promote default risk is mitigated, but explicit `promotion_mode:auto` remains a carry-over risk.
- Domain contamination guard remains unresolved.
- Gap report not fully tied to ingest output remains an active risk.
- ABW ingest maturity remains incomplete.
- Two test failures remain documented as pre-existing/out-of-scope:
  - `tests/test_abw_inspect.py::test_inspect_docx_heavy_workspace`
  - `tests/test_abw_gaps.py::test_xls_heavy_workspace_reports_format_block`

Mitigation:

- Keep manual-first default as invariant and treat `promotion_mode:auto` as explicit high-risk opt-in.
- Prioritize domain contamination guard and ingest-bound gap/report contract in Sprint 22 planning.
- Preserve non-claims and require GPT audit/fix before commit.

## Sprint 22 Domain-Contamination Hardening Risk Cluster (Active)

Risk:

- Domain contamination risk is now the active Sprint 22 target.
- Domain profile enforcement gap remains active until Sprint 22 is implemented/audited.
- Bridge-ready overclaim risk remains active.
- Silent accept of cross-domain data is forbidden but still a potential regression risk.
- `promotion_mode:auto` remains an explicit opt-in carry-over risk.
- Gap/reporting gaps remain carry-over unless explicitly scoped in a later sprint.

Mitigation:

- Require fail-safe contamination behavior (`warn`, `quarantine`, `skip`) with no silent accept.
- Require tests for contamination-positive and clean same-domain cases.
- Require fallback tests for missing/empty domain profile and no hidden bypass.
- Require GPT audit/fix before commit.
- Preserve non-claims.

## Post-ABW Sprint 22 Carry-Over Risk Cluster (Active)

Risk:

- Domain contamination risk is partially mitigated by Sprint 22 v1 guard, not eliminated.
- Rule-based keyword guard can still produce false positives/negatives.
- `NOT_CONFIGURED` means no active contamination protection.
- Aggregate ingest report/machine-readable gap output remains unresolved.
- Manifest/source evidence contract hardening remains an active follow-up risk.
- Bridge-ready overclaim risk remains active.
- Two broader-suite failures remain pre-existing/out-of-scope and unresolved:
  - `tests/test_abw_inspect.py::test_inspect_docx_heavy_workspace`
  - `tests/test_abw_gaps.py::test_xls_heavy_workspace_reports_format_block`

Mitigation:

- Keep Sprint 23 planning gate-aware and evidence-first before any Bridge Phase 1 start.
- Preserve non-claims: not bridge-ready, not ingest maturity solved, not production/Cognitive OS ready.
- Keep domain guard behavior explicit in docs/tests (`PASS/WARN/BLOCKED/NOT_CONFIGURED/ERROR`).
- Prioritize ingest-bound report/gap contract and manifest/source evidence hardening when scoped.

## Sprint 23 Evidence-Reporting Gate Risk Cluster (Active)

Risk:

- Bridge-ready overclaim risk remains active.
- Ingest-bound evidence/reporting contract gap is now the active Sprint 23 target.
- Gap output is not yet tied as a first-class post-ingest contract and remains a bridge blocker.
- Partial/ambiguous evidence contracts can cause bridge components to over-trust ABW outputs.
- Carry-over constraints remain active:
  - `promotion_mode:auto` explicit opt-in risk
  - `NOT_CONFIGURED` means no active contamination protection
  - keyword-rule guard false positive/negative risk

Mitigation:

- Require a stable machine-readable ingest report contract.
- Require gap classification to be tied directly to ingest output.
- Require contract-level regression tests.
- Require GPT audit/fix before commit.
- No Bridge Builder until a future control repo gate verdict explicitly selects `A. PROCEED_TO_BRIDGE_PHASE_1`.
