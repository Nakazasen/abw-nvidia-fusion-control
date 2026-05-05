# Architecture Decisions

## 2026-04-30: Keep Source Trees Separate

Decision:

- Keep `D:\Sandbox\Nvidia` and `D:\Sandbox\skill-Anti-brain-wiki_note` as separate repos in the current phase.

Why:

- NVIDIA is the product shell and active agent runtime.
- ABW is the canonical governance engine.
- Source merging would blur responsibility boundaries and increase the risk of agents editing the wrong repo.

## 2026-04-30: Bridge First

Decision:

- Integrate through contract and bridge work before considering source unification.

Priority order:

1. CLI bridge
2. FastAPI/local service only if the UI later needs richer realtime behavior
3. Packaging, submodule, or monorepo decision later

## 2026-04-30: Provider Agnostic

Decision:

- Do not make the long-term architecture depend on one provider.

Why:

- NVIDIA NIM, Gemini, OpenAI, and local models should remain swappable.
- Long-term value is in runtime, governance, knowledge discipline, and auditability.

## 2026-04-30: State Boundaries

Decision:

- `.nvidia-agent` is application/runtime state.
- `.brain` is governed project cognitive/action state.
- `raw/processed/wiki` is ABW knowledge pipeline state.

Constraint:

- Do not merge these stores without an explicit migration plan.

## DECISION: Establish Master Roadmap v1 through Sprint 80+

- Status: Accepted
- Date: 2026-04-30

### Context

- The project had begun changing implementation order. This was acceptable, but it had to be governed.

### Decision

- Maintain a full long-range roadmap to Sprint 80+, while locking only near-term sprints.

### Consequences

- Every sprint must be checked against phase goals.
- Every 4 sprints requires review.
- Major milestones require full audit.
- Roadmap changes must be recorded.

### Non-goals

- This decision does not implement Sprint 9.
- This decision does not implement ABW bridge.
- This decision does not claim Cognitive OS is already achieved.
- This decision does not claim VS Code parity.

## 2026-05-02: Run Phase 1 Gate Review Before Any Sprint 17 Implementation

Decision:

- After Sprint 16, run Phase 1 Gate Review before any Sprint 17 builder implementation.

Rationale:

- Sprint 16 is a gate milestone for hardening/regression/readiness, not a normal feature sprint.
- Current verdict is INTERNAL_DAILY_USE_CANDIDATE and must be reviewed before phase transition.

Status:

- Accepted.

Consequence:

- Do not issue Sprint 17 builder prompts until gate review is completed and recorded.

## 2026-05-02: Mandatory Performance & Bloat Budget Gate Before Sprint 17

Decision:

- After Sprint 16, Phase 1 Gate Review must include a mandatory Performance & Bloat Budget Gate before any Sprint 17 implementation.

Required gate checks:

- `nvidia_playground.html` size and monolith risk.
- `tools/browser-smoke.mjs` size and fragility.
- `tools/nvidia-server.mjs` route/API growth.
- Server startup time, browser smoke runtime, and Node memory where measurable.
- `.nvidia-agent` runtime data growth, caps, rotation, and staging safety.
- Lazy loading behavior, module split plan, feature off-switches, and worker/service separation.
- Whether Sprint 16.5 cleanup is needed before Sprint 17.

Status:

- Accepted.

Consequence:

- Sprint 17 is blocked until this gate is completed and recorded.

## 2026-05-02: Sprint 17 Requires Explicit Phase 1 Gate Decision

Decision:

- No Sprint 17 implementation may start until Phase 1 Gate Review selects exactly one allowed decision.

Allowed decisions:

- `A. PROCEED_TO_SPRINT_17`
- `B. INSERT_SPRINT_16_5_CLEANUP`
- `C. INSERT_BUGFIX_HARDENING_SPRINT`
- `D. DOWNGRADE_PHASE_1_READINESS`

Status:

- Accepted.

Consequence:

- Sprint 17 can start only if `A. PROCEED_TO_SPRINT_17` is explicitly selected and limitations remain documented.

## 2026-05-02: Prefer Modular Shell Plus Workers/Services Over Monolithic IDE Process

Decision:

- Long-term architecture must prefer a modular IDE shell with route/UI modules and separate workers/services for heavy workloads.

Rationale:

- Feature-first growth inside one HTML file or one server process risks performance decay, fragile tests, hard debugging, and AI-edit regressions.

Status:

- Accepted.

Consequence:

- `nvidia_playground.html` should gradually become a thin shell.
- Browser smoke and server routes should become modular over time.
- Heavy future workloads should run on demand in workers/services rather than inside the IDE UI/server process.

## 2026-05-02: Bound Runtime Data Under .nvidia-agent

Decision:

- Runtime data under `.nvidia-agent` must be bounded, rotated, ignored, and never treated as source truth unless explicitly validated.

Rationale:

- Runtime state can contain stale, sensitive, large, or corrupted artifacts. It must support recovery and evidence, not become an unmanaged database or accidental source of truth.

Status:

- Accepted.

Consequence:

- Reports, tasks, security logs, rules, diagnostics, index, profile, tmp, and screenshots need caps or rotation plans.
- Runtime artifacts must never be staged unless a specific sanitized artifact is intentionally promoted.
- Stale runtime state must not corrupt app startup.

## 2026-05-02: Phase 1 Gate Review Selects Sprint 16.5 Cleanup

Decision:

- Phase 1 Gate Review selects `B. INSERT_SPRINT_16_5_CLEANUP`.

Rationale:

- Stability/readiness evidence is strong enough to keep `INTERNAL_DAILY_USE_CANDIDATE`.
- Direct Sprint 17 entry is not allowed yet because performance/bloat/modularity/runtime-data boundaries are not sufficiently proven for long-horizon growth.

Status:

- Accepted.

Consequence:

- Sprint 17 remains blocked.
- Sprint 16.5 cleanup must run first.
- A post-cleanup re-gate is required before Sprint 17.
- Sprint 17 can start only if re-gate explicitly records `A. PROCEED_TO_SPRINT_17`.

## 2026-05-02: Record Sprint 16.5 Cleanup Completion Without Auto-Unblocking Sprint 17

Decision:

- Record NVIDIA Sprint 16.5 cleanup completion and push evidence in control governance docs.
- Sprint 16.5 completion does not automatically authorize Sprint 17.
- Post-cleanup re-gate remains mandatory.

Status:

- Accepted.

Consequence:

- Sprint 17 remains blocked until post-cleanup re-gate explicitly selects `A. PROCEED_TO_SPRINT_17`.

## 2026-05-02: Post-Cleanup Phase 1 Re-Gate Selects A

Decision:

- Post-cleanup Phase 1 re-gate selects `A. PROCEED_TO_SPRINT_17`.

Status:

- Accepted.

Rationale:

- Sprint 16.5 delivered performance budget checks, runtime hygiene dry-run safety controls, modularization planning, and validation pass evidence.

Consequence:

- Sprint 17 may start only under constraints and must preserve non-claims.
- Carry-over constraints remain active: `securityRotation: NOT_ROTATED_YET`, `idleMemoryEstimateMb: NOT_MEASURED_YET`, monolith split discipline, and runtime hygiene dry-run safety posture.

## 2026-05-02: Record Sprint 17 Completion As Modularization-First Foundation

Decision:

- Record NVIDIA Sprint 17 completion as modularization-first foundation, not feature expansion.
- Accept `GET /api/health` as a safe read-only endpoint added for route boundary validation.
- Continue modular split discipline in future sprints.

Status:

- Accepted.

Consequence:

- Sprint 18 may be planned only after this control update is committed/pushed.
- Builder outputs remain non-final until audit/fix plus commit/push plus control-record update are completed.

## 2026-05-02: Post-Sprint 17 Strategic Dependency Adjustment

Decision:

- Keep Sprint 80 as long-term target.
- Delay/dependency-gate deep NVIDIA<->ABW bridge until ABW ingest maturity is proven.
- Sprint 18 must not be bridge-first.
- Sprint 18 should focus on NVIDIA modularization/runtime hardening unless a later governance update changes this.

Status:

- Accepted.

Rationale:

- ABW ingest is not yet mature enough as a robust self-ingesting knowledge/governance runtime.
- Early bridge would risk an integrated-looking system with weak governed knowledge input.
- This would create Cognitive OS overclaim risk.

## 2026-05-02: Sprint 18 Scope Decision - Browser Smoke Modularization

Decision:

- Sprint 18 will focus on Browser Smoke Modularization.
- Keep `tools/browser-smoke.mjs` as stable entrypoint.
- Extract suites/helpers without reducing current coverage.
- Do not implement deep ABW bridge.

Status:

- Accepted.

Rationale:

- Reduces test monolith risk.
- Strengthens quality gate for later modularization.
- Lower trust-boundary risk than server/mutation route work.
- Aligns with Sprint 18-19 NVIDIA modularization/runtime hardening.

## 2026-05-02: Record NVIDIA Sprint 18 Browser Smoke Modularization Completion

Decision:

- Accept Sprint 18 as browser smoke modularization/hardening, not feature growth.
- Keep browser-smoke entrypoint stable.
- Accept `tools/smoke` module boundary as first smoke harness split.
- Sprint 19 may be planned only after this control update is committed/pushed.

Status:

- Accepted.

Consequence:

- Builder result remains non-final until audit/fix + commit/push + control repo record.
- Future smoke growth should prefer suite/helper modules, not monolith expansion.

## 2026-05-02: Sprint 19 Scope Decision - Runtime Hygiene / Budget Follow-up

Decision:

- Sprint 19 will focus on runtime hygiene and performance budget follow-up.
- The scope targets `securityRotation` and idle memory evidence.
- Sprint 19 must preserve dry-run-first hygiene behavior.
- No deep ABW bridge or ABW ingest implementation.

Status:

- Accepted.

Rationale:

- Closes carry-over risk before Sprint 20-22 ABW ingest hardening.
- Lower product behavior regression risk than route/UI refactor.
- Strengthens governance evidence.

## 2026-05-02: Record NVIDIA Sprint 19 Runtime Hygiene / Budget Follow-up Completion

Decision:

- Accept Sprint 19 as runtime hygiene/budget evidence hardening.
- Accept idle memory startup measurement as best-effort evidence, not continuous monitoring.
- Accept security log reporting improvement while keeping securityRotation as `NOT_ROTATED_YET`.
- Sprint 20 may be planned only after this control update is committed/pushed.

Status:

- Accepted.

Consequence:

- Sprint 20 should shift to ABW v1.2 Ingest Kernel Hardening per strategic dependency adjustment.
- Deep NVIDIA<->ABW bridge remains blocked until ABW ingest baseline proof.

## 2026-05-02: Sprint 20 Scope Decision - ABW Ingest Baseline Audit / Gap Map

Decision:

- Sprint 20 will focus on ABW ingest baseline audit and gap mapping.
- No deep NVIDIA<->ABW bridge.
- No blind auto-promote.
- No claim that ingest maturity is solved.

Status:

- Accepted.

Rationale:

- Establishes evidence baseline before implementation-heavy Sprint 21-22 work.
- Prevents overbuild and false Cognitive OS/bridge readiness claims.
- Supports bridge dependency gate.

## 2026-05-02: Record ABW Sprint 20 Ingest Baseline Gap Map Completion

Decision:

- Accept Sprint 20 as docs-only baseline/gap-map sprint.
- Accept Sprint 20 output as planning baseline, not proof that ingest maturity is solved.
- Use Sprint 20 gap map and acceptance criteria to guide Sprint 21-22.

Status:

- Accepted.

Consequence:

- Sprint 21 may be planned only after this control update is committed/pushed.
- Deep NVIDIA<->ABW bridge remains blocked until ABW ingest baseline proof.

## 2026-05-02: Sprint 21 Scope Decision - Disable / Gate Blind Auto-Promotion

Decision:

- Sprint 21 will focus on disabling/gating blind auto-promotion paths.
- Wiki writes/promote flows must require explicit review/approval.
- No hidden auto-promote side path may remain accepted behavior.
- No bridge work.

Status:

- Accepted.

Rationale:

- Silent promotion is the highest-risk trust-boundary failure from Sprint 20.
- Promotion safety must be hardened before bridge-facing reports/manifest expansion.

## 2026-05-03: Record ABW Sprint 21 Promotion Safety Completion

Decision:

- Accept Sprint 21 as promotion safety hardening.
- Accept manual-first default promotion behavior.
- Accept `promotion_mode:auto` only as explicit opt-in, not default.
- Do not treat Sprint 21 as full ingest maturity.

Status:

- Accepted.

Consequence:

- Sprint 22 may be planned only after this control update is committed/pushed.
- Deep NVIDIA<->ABW bridge remains blocked until ABW ingest baseline proof.

## 2026-05-02: Sprint 22 Scope Decision - Domain Contamination Guard v1

Decision:

- Sprint 22 will focus on Domain Contamination Guard v1.
- Domain/workspace mismatch must not be silently accepted.
- Fail-safe behavior should warn/quarantine/skip.
- No bridge work.

Status:

- Accepted.

Rationale:

- Domain contamination is the largest remaining trust-boundary gap after blind auto-promotion was gated.
- Reports/manifests/bridge-facing outputs are unsafe if the knowledge boundary is contaminated.

## 2026-05-03: Record ABW Sprint 22 Domain Contamination Guard Completion

Decision:

- Accept Sprint 22 as Domain Contamination Guard v1.
- Accept rule-based domain guard as bounded v1 protection, not complete semantic isolation.
- Accept `NOT_CONFIGURED` as non-protective by design.
- Do not treat Sprint 22 as proof that ABW ingest baseline is fully mature or bridge-ready.

Status:

- Accepted.

Consequence:

- Sprint 23 may be planned only after this control update is committed/pushed.
- Before Bridge Phase 1, run explicit gate review against ABW ingest baseline proof and remaining gaps.

## 2026-05-03: Sprint 23 Gate Review - Insert Evidence Reporting Sprint

Decision:

- Do not proceed to Bridge Phase 1 yet.
- Insert Sprint 23 Evidence Reporting Sprint.
- Treat bridge-facing reporting contract as blocker before Bridge Phase 1.

Status:

- Accepted.

Rationale:

- Safety baseline improved after Sprint 20-22.
- Remaining blocker is evidence/reporting maturity, not immediate safety break.
- Bridge must not consume partial/ambiguous evidence contracts.

## 2026-05-03: Sprint 23 Scope Decision - Evidence Report + Gap Output Minimal Pair

Decision:

- Sprint 23 will implement a minimal paired evidence-reporting contract.
- Required artifacts:
  - `ingest_report.json`
  - `ingest_gaps.json`
- The pair must be machine-readable, versioned, and run-correlated.
- This is not bridge implementation.
- This does not authorize Bridge Phase 1.

Status:

- Accepted.

Rationale:

- Gate review selected evidence reporting before bridge.
- The minimal pair directly addresses the missing bridge-facing evidence contract while staying bounded.

## 2026-05-03: Record ABW Sprint 23 Evidence Reporting Completion

Decision:

- Accept Sprint 23 as Evidence Report + Gap Output Minimal Pair.
- Accept `ingest_report.json` and `ingest_gaps.json` as bounded v1 machine-readable runtime artifacts.
- Do not treat Sprint 23 completion as Bridge Phase 1 authorization.
- Require a later explicit gate review before any bridge implementation.

Status:

- Accepted.

Consequence:

- Sprint 24 planning may start only after this control update is committed/pushed.
- First post-Sprint 23 action should be gate-aware review of bridge readiness.
- Bridge Phase 1 remains blocked unless a later gate explicitly records `A. PROCEED_TO_BRIDGE_PHASE_1`.

## 2026-05-03: Post-Sprint-23 Gate Review - Proceed to Bridge Phase 1 Scope Planning

Decision:

- Accept gate verdict `A. PROCEED_TO_BRIDGE_PHASE_1`.
- Authorize Bridge Phase 1 scope planning only.
- Do not authorize Bridge Builder implementation yet.
- Bridge Phase 1 must be read-only/evidence-only.

Status:

- Accepted.

Consequence:

- Bridge Builder prompt remains forbidden until scope decision is recorded and committed.
- Any bridge implementation must preserve no write-back/no auto-promote/no autonomous sync.
- Non-claims remain active.

## 2026-05-03: Bridge Phase 1 Scope Decision - Preflight Reader + Contract Tests

Decision:

- Bridge Phase 1 will implement a bounded preflight reader with contract tests.
- The reader must be read-only/evidence-only.
- It must fail closed on missing/invalid ABW evidence.
- It must not write to ABW or NVIDIA project state.
- It must not include UI.

Status:

- Accepted.

Consequence:

- Bridge Builder prompt may be prepared only after this control update is committed/pushed.
- Implementation should target NVIDIA repo.
- ABW repo remains untouched.
- GPT audit/fix required before any bridge commit.

## 2026-05-03: Record NVIDIA Bridge Phase 1 Preflight Completion

Decision:

- Accept Bridge Phase 1 as bounded preflight reader + contract tests.
- Accept PASS/WARN/FAIL local validation model.
- Accept fail-closed behavior for missing/invalid evidence.
- Do not treat this as full bridge, UI bridge, production readiness, or Cognitive OS.

Status:

- Accepted.

Consequence:

- Any further bridge work requires new scope planning and governance record.
- UI/write-back/sync/auto-promote remain forbidden unless explicitly scoped later.
- GPT audit/fix remains required before future commits.

## 2026-05-03: Bridge Phase 1 Completion Gate - Insert Preflight E2E Proof Sprint

Decision:

- Select verdict `C. INSERT_BRIDGE_PREFLIGHT_E2E_PROOF_SPRINT`.
- Accept Bridge Phase 1 preflight reader as completed and bounded.
- Do not authorize Bridge UI/write-back/sync/auto-promote scope yet.
- Require one additional bounded E2E proof sprint before any UI-facing bridge scope.

Status:

- Accepted.

Consequence:

- Next builder scope is limited to NVIDIA repo E2E harness/tests/docs for ABW-artifact-to-NVIDIA-preflight proof.
- ABW repo remains read-only reference during next builder sprint.
- Builder prompt is forbidden until this governance decision is committed/pushed.
- GPT audit/fix remains mandatory before any next-scope commit.

## DECISION: Accept Bridge Preflight E2E Proof completion

- Status: Accepted
- Date: 2026-05-03

### Context

- Control repo previously recorded verdict `C. INSERT_BRIDGE_PREFLIGHT_E2E_PROOF_SPRINT`.
- NVIDIA has now implemented and committed the bounded E2E proof.

### Decision

- Accept the Bridge Preflight E2E Proof as completed for the bounded preflight scope.

### Evidence

- NVIDIA commit: `1ae4515e8ba405c970ec23b5af5d00c8daa38f65`
- `npm run bridge:preflight:e2e` PASS `22/22`
- `npm run bridge:preflight:test` PASS `38/38`
- `npm run agent:audit` PASS `25/25`
- mojibake clean

### Consequences

- Bridge preflight now has unit/contract tests and E2E proof.
- Next step is gate review / next-scope planning.
- UI/write-back/sync/auto-promote remain forbidden unless explicitly scoped later.

### Non-goals

- Does not implement UI.
- Does not implement full bridge.
- Does not mutate ABW.
- Does not claim production-ready.
- Does not claim Cognitive OS achieved.

## DECISION: Pause bridge expansion and repair NVIDIA UI daily-use usability

- Status: Accepted
- Date: 2026-05-03

### Context

- Bridge Preflight E2E Proof passed and was recorded.
- User-observed NVIDIA UI issues show daily-use usability is still weak.

### Decision

- Proceed next with NVIDIA-only UI usability and daily-use repair before adding bridge UI.

### Evidence

- Bridge E2E proof completed and recorded.
- User observed English-heavy UI, clipped/hidden controls, confusing layout, chatbot-like experience, and unclear file edit/apply workflow.

### Consequences

- Bridge UI is not opened yet.
- NVIDIA UI usability becomes the next main sprint.
- Sprint 9-16 reconciliation remains a secondary follow-up.
- Packaging remains premature.

### Non-goals

- Does not implement bridge UI.
- Does not implement write-back/sync/auto-promote.
- Does not mutate ABW.
- Does not claim daily-use readiness yet.
- Does not claim production-ready/Cognitive OS/full bridge.
## DECISION: Accept NVIDIA UI usability smoke repair completion

- Status: Accepted
- Date: 2026-05-03

### Context

- Gate previously selected `C. PROCEED_TO_NVIDIA_UI_USABILITY_AND_DAILY_USE_REPAIR` after Bridge Preflight E2E Proof.
- NVIDIA UI had user-observed issues including hidden/clipped controls, SCM/session UI regressions, mojibake risk, confusing flow, and incomplete localization.

### Decision

- Accept the bounded NVIDIA UI usability smoke repair as completed for the current smoke regression scope.

### Evidence

- NVIDIA commit: `e9e78460c37649a76019780d9180a7d6abbbd580`
- `npm run browser:smoke -- --start-server --port 3456` PASS `99/0`
- guard matrix PASS `16/16`
- `npm run agent:audit` PASS `25/25`
- `npm run bridge:preflight:test` PASS `38/38`
- `npm run bridge:preflight:e2e` PASS `22/22`
- encoding/mojibake clean

### Consequences

- The immediate smoke regressions are repaired.
- NVIDIA UI remains only a daily-use candidate.
- More usability/localization/file-edit workflow work may still be required.
- Next action is gate review / next-scope planning.

### Non-goals

- Does not prove daily-use readiness.
- Does not complete Vietnamese localization.
- Does not implement bridge UI.
- Does not implement write-back/sync/auto-promote.
- Does not claim production-ready.
- Does not claim Cognitive OS achieved.

## DECISION: Focus next on NVIDIA file edit/apply workflow proof

- Status: Accepted
- Date: 2026-05-03

### Context

- NVIDIA UI usability smoke repair passed and was recorded.
- However, daily-use readiness is not proven.
- The file edit/apply workflow remains the most important Agent IDE credibility gap.

### Decision

- Proceed next with a NVIDIA-only file edit/apply workflow proof sprint.

### Evidence

- NVIDIA UI smoke repair completed and recorded.
- browser smoke PASS `99/0`
- guard matrix PASS `16/16`
- bridge tests remain passing
- gate found file edit/apply path still only partially proven and central to Agent IDE claim

### Consequences

- Next Builder sprint must stay in NVIDIA repo only.
- Work must focus on visibility, discoverability, honesty, and smoke/usability proof for existing edit/apply workflow.
- Bridge UI and packaging remain blocked.
- Daily-use readiness remains unclaimed.

### Non-goals

- Does not implement bridge UI.
- Does not expand write-back/sync/auto-promote.
- Does not mutate ABW.
- Does not claim daily-use readiness.
- Does not claim production-ready.
- Does not claim full bridge.
- Does not claim Cognitive OS achieved.

## DECISION: Accept NVIDIA File Edit/Apply Workflow Proof completion

- Status: Accepted
- Date: 2026-05-03

### Context

- Gate previously selected `C. PROCEED_TO_NVIDIA_FILE_EDIT_APPLY_WORKFLOW_PROOF` after NVIDIA UI usability smoke repair.
- The file edit/apply workflow was identified as the most important Agent IDE credibility gap.

### Decision

- Accept the bounded NVIDIA File Edit/Apply Workflow Proof as completed for the current visibility/honesty/testability scope.

### Evidence

- NVIDIA commit: `3f46cd0cd12de749d529a5df864e50711d600c42`
- `npm run browser:smoke -- --start-server --port 3456` PASS `104/0`
- guard matrix PASS `16/16`
- `npm run agent:audit` PASS `25/25`
- `npm run bridge:preflight:test` PASS `38/38`
- `npm run bridge:preflight:e2e` PASS `22/22`
- encoding/mojibake clean

### Consequences

- The file edit/apply workflow is now more visible and honestly described.
- NVIDIA UI remains only a candidate for daily-use.
- More usability/localization/inline-edit proof work may still be required.
- Next action is gate review / next-scope planning.

### Non-goals

- Does not prove daily-use readiness.
- Does not complete Vietnamese localization.
- Does not implement bridge UI.
- Does not expand write-back/sync/auto-promote.
- Does not mutate ABW.
- Does not claim production-ready.
- Does not claim Cognitive OS achieved.

## DECISION: Fix remaining NVIDIA inline-edit visibility warnings next

- Status: Accepted
- Date: 2026-05-03

### Context

- NVIDIA File Edit/Apply Workflow Proof passed and was recorded.
- The workflow is now more visible and honest, but two inline-edit smoke warnings remain.

### Decision

- Proceed next with a NVIDIA-only sprint to fix the remaining inline-edit visibility warnings or honestly document/prove why they cannot be removed safely.

### Evidence

- NVIDIA File Edit/Apply Workflow Proof completed and recorded.
- `npm run browser:smoke -- --start-server --port 3456` PASS `104/0`
- guard matrix PASS `16/16`
- bridge tests remain passing
- remaining warnings:
  - `Inline edit action exists - action not observable in current smoke state`
  - `Inline edit widget opens from selection - widget not observable in current smoke state`
- `nvidia_playground.html` remains large/monolithic, but decomposition is deferred as secondary follow-up.

### Consequences

- Next Builder sprint must stay tightly focused on inline-edit observability.
- Guard/approval/trust boundaries must be preserved.
- No bridge UI or write-back expansion is allowed.
- Daily-use readiness remains unclaimed.

### Non-goals

- Does not implement bridge UI.
- Does not expand write-back/sync/auto-promote.
- Does not mutate ABW.
- Does not claim daily-use readiness.
- Does not claim production-ready.
- Does not claim full bridge.
- Does not claim Cognitive OS achieved.

## DECISION: Accept NVIDIA Inline-Edit Visibility Proof completion

- Status: Accepted
- Date: 2026-05-03

### Context

- Gate previously selected `A. PROCEED_TO_FIX_REMAINING_INLINE_EDIT_VISIBILITY_WARNINGS` after NVIDIA File Edit/Apply Workflow Proof.
- Two non-fatal inline-edit smoke warnings remained.

### Decision

- Accept the bounded NVIDIA Inline-Edit Visibility Proof as completed for the current smoke-observability scope.

### Evidence

- NVIDIA commit: `05dcb6c59d98675e01c200c5a78e86ec5640d185`
- `npm run browser:smoke -- --start-server --port 3456` PASS `106/0`
- warnings `[]`
- guard matrix PASS `16/16`
- `npm run agent:audit` PASS `25/25`
- `npm run bridge:preflight:test` PASS `38/38`
- `npm run bridge:preflight:e2e` PASS `22/22`
- encoding/mojibake clean

### Consequences

- The explicit inline-edit smoke warnings are resolved.
- NVIDIA UI remains only a candidate for daily-use.
- More usability/localization/monolith cleanup work may still be required.
- Next action is gate review / next-scope planning.

### Non-goals

- Does not prove daily-use readiness.
- Does not complete Vietnamese localization.
- Does not implement bridge UI.
- Does not expand write-back/sync/auto-promote.
- Does not mutate ABW.
- Does not claim production-ready.
- Does not claim Cognitive OS achieved.

## DECISION: Proceed to bounded NVIDIA UI monolith decomposition

- Status: Accepted
- Date: 2026-05-03

### Context

- NVIDIA Inline-Edit Visibility Proof passed and was recorded.
- Inline-edit warnings are gone, but `nvidia_playground.html` remains a large monolithic UI file and recent fixes repeatedly touched it directly.

### Decision

- Proceed next with a NVIDIA-only bounded UI monolith decomposition / structure hardening sprint.

### Evidence

- NVIDIA Inline-Edit Visibility Proof completed and recorded.
- `npm run browser:smoke -- --start-server --port 3456` PASS `106/0`
- warnings `[]`
- guard matrix PASS `16/16`
- bridge tests remain passing
- `nvidia_playground.html` remains about `298,383` bytes / `6,053` lines
- recent UI fixes repeatedly edited `nvidia_playground.html` directly

### Consequences

- Next Builder sprint must stay tightly focused on tiny staged decomposition and structure hardening.
- No feature expansion is allowed.
- Bridge UI and packaging remain blocked.
- Daily-use readiness remains unclaimed.
- Localization remains a later follow-up.

### Non-goals

- Does not implement bridge UI.
- Does not expand write-back/sync/auto-promote.
- Does not mutate ABW.
- Does not claim daily-use readiness.
- Does not claim production-ready.
- Does not claim full bridge.
- Does not claim Cognitive OS achieved.

## DECISION: Accept NVIDIA UI structure guardrails completion

- Status: Accepted
- Date: 2026-05-03

### Context

- Gate selected NVIDIA UI monolith decomposition, but Builder implemented a tiny structure-guardrail pass rather than a broad refactor.

### Decision

- Accept the bounded structure guardrails as completed for this scope.

### Evidence

- NVIDIA commit: `b5b6b9c06ada2dc499fc8d0b1f5e29885bd43405`
- `npm run browser:smoke -- --start-server --port 3456` PASS `109/0`
- warnings `[]`
- new critical UI root checks pass
- `npm run agent:audit` PASS `25/25`
- bridge tests pass
- encoding/mojibake clean

### Consequences

- Critical UI sections now have stronger smoke protection.
- The UI monolith still remains.
- Real file write/create failure must be handled by a separate next gate.
- Daily-use readiness remains unclaimed.

### Non-goals

- Does not physically decompose the monolith.
- Does not fix real file write/create.
- Does not implement bridge UI.
- Does not expand write-back/sync/auto-promote.
- Does not claim production-ready or Cognitive OS achieved.

## DECISION: Prioritize NVIDIA real file write/create repair

- Status: Accepted
- Date: 2026-05-03

### Context

- The user manually tested NVIDIA UI and found that a request to create a Python file failed because no `write_file` command completed successfully.
- Logs showed `retrying_missing_write_file`.

### Decision

- Proceed next with a NVIDIA-only sprint to diagnose and repair the guarded real file write/create path in the autonomous agent flow.

### Evidence

- User manual evidence showed real create/write failure.
- Gate inspection found guarded `write_file` exists, but autonomous chat/agent flow can end without successful `write_file`.
- Real file creation is central to Agent IDE credibility.
- Prior smoke tests did not prove `user request -> write_file -> file exists`.

### Consequences

- This blocks any daily-use readiness claim.
- Bridge UI and packaging remain blocked.
- Next Builder sprint must preserve trust/approval/workspace boundary protections.
- No unsafe write outside workspace is allowed.

### Non-goals

- Does not implement bridge UI.
- Does not expand write-back beyond existing guarded write/create semantics.
- Does not add sync or auto-promote.
- Does not mutate ABW.
- Does not claim production-ready.
- Does not claim Cognitive OS achieved.

## DECISION: Accept NVIDIA Real File Write/Create Repair completion

- Status: Accepted
- Date: 2026-05-04

### Context

- A user-observed manual failure showed that NVIDIA could end with `retrying_missing_write_file` and no successful `write_file` command for an explicit create-file request.

### Decision

- Accept the bounded NVIDIA Real File Write/Create Repair as completed for pending-edit-level create/write proof.

### Evidence

- NVIDIA commit: `9e14a2d26f049cb81a3af3dffc941b598bb1aeea`
- `write:create:proof` PASS `19/0`
- `browser:smoke` PASS `109/0`
- guard matrix PASS `16/16`
- `agent:audit` PASS `25/25`
- `bridge:preflight:test` PASS `38/38`
- `bridge:preflight:e2e` PASS `22/22`
- encoding/mojibake clean

### Consequences

- Safe explicit create-file intent now reaches `write_file` and creates a pending edit.
- Outside-workspace/no-approval/untrusted paths remain blocked.
- Daily-use readiness remains unclaimed.
- Automatic disk write without review/apply remains unproven.

### Non-goals

- Does not prove automatic disk write without apply.
- Does not implement bridge UI.
- Does not add sync or auto-promote.
- Does not mutate ABW.
- Does not claim production-ready.
- Does not claim Cognitive OS achieved.

## DECISION: Prove NVIDIA pending edit apply-to-disk path next

- Status: Accepted
- Date: 2026-05-04

### Context

- NVIDIA Real File Write/Create Repair proved that safe explicit create-file intent reaches `write_file` and creates a pending edit.
- However, the reviewed apply-to-disk path remains unproven.

### Decision

- Proceed next with a NVIDIA-only sprint to prove and, if necessary, repair the `apply_pending_edit` path so that a pending edit can be reviewed/applied and produce a real file on disk.

### Evidence

- `write:create:proof` PASS `19/0`
- `browser:smoke` PASS `109/0`
- guard matrix PASS `16/16`
- `agent:audit` PASS `25/25`
- bridge tests PASS `38/38` and `22/22`
- gate confirmed `applyPendingEditTool` exists but apply-to-disk proof is missing

### Consequences

- This remains safety-sensitive because it touches the final disk-write path.
- The next sprint must preserve trust/approval/workspace boundaries.
- No bridge UI or packaging is allowed.
- Daily-use readiness remains unclaimed.

### Non-goals

- Does not implement bridge UI.
- Does not add sync or auto-promote.
- Does not mutate ABW.
- Does not claim daily-use readiness.
- Does not claim production-ready.
- Does not claim Cognitive OS achieved.
## DECISION: Accept NVIDIA Apply Pending Edit To Disk Proof Completion

- Status: Accepted
- Date: 2026-05-04
- Context:
  - NVIDIA Real File Write/Create Repair proved safe explicit create-file intent reaches `write_file` and creates a pending edit.
  - The next missing step was proving reviewed apply-to-disk behavior.
- Decision:
  - Accept the bounded NVIDIA Apply Pending Edit To Disk Proof as completed for API/harness-level apply-to-disk behavior.
- Evidence:
  - NVIDIA commit: `ae2b26649d97d62e08dc3e25e851d468ed05f23f`
  - `apply:proof` PASS `30/0`
  - `write:create:proof` PASS `19/0`
  - `browser:smoke` PASS `109/0`
  - guard matrix PASS `16/16`
  - `agent:audit` PASS `25/25`
  - `bridge:preflight:test` PASS `38/38`
  - `bridge:preflight:e2e` PASS `22/22`
  - encoding/mojibake clean
- Consequences:
  - Pending edits can now be applied to disk under guarded proof.
  - Outside-workspace, no-approval, and untrusted cases remain blocked.
  - Full manual UI E2E remains unproven.
  - Daily-use readiness remains unclaimed.
- Non-goals:
  - Does not prove full manual UI E2E.
  - Does not implement bridge UI.
  - Does not add sync or auto-promote.
  - Does not mutate ABW.
  - Does not claim production-ready.
  - Does not claim Cognitive OS achieved.
## DECISION: Prove NVIDIA Full Manual Create/Apply E2E Next

- Status: Accepted
- Date: 2026-05-04
- Context:
  - NVIDIA Apply Pending Edit To Disk Proof proved the backend/API path from `write_file` to pending edit to `apply_pending_edit` to disk file.
  - The user-facing UI flow remains unproven.
- Decision:
  - Proceed next with a NVIDIA-only sprint to prove the full manual UI create/apply E2E path.
- Evidence:
  - `apply:proof` PASS `30/0`
  - `write:create:proof` PASS `19/0`
  - `browser:smoke` PASS `109/0`
  - guard matrix PASS `16/16`
  - `agent:audit` PASS `25/25`
  - bridge tests PASS `38/38` and `22/22`
  - gate confirmed pending edit UI wiring exists, but full prompt-to-apply-to-disk UI proof is missing
- Consequences:
  - This remains bounded to proving the user-facing file workflow.
  - No bridge UI, packaging, sync, auto-promote, ABW mutation, broad refactor, or localization pass is allowed.
  - Daily-use readiness remains unclaimed until a later readiness gate.
- Non-goals:
  - Does not implement bridge UI.
  - Does not add sync or auto-promote.
  - Does not mutate ABW.
  - Does not claim daily-use readiness.
  - Does not claim production-ready.
  - Does not claim Cognitive OS achieved.

## DECISION: Accept NVIDIA Full Manual Create/Apply E2E Proof completion

- Status: Accepted
- Date: 2026-05-04

### Context

- NVIDIA Apply Pending Edit To Disk Proof proved the API/harness path.
- The remaining gap was proving the user-facing UI create/apply path.

### Decision

- Accept the bounded NVIDIA Full Manual Create/Apply E2E Proof as completed for browser/UI-path create/apply behavior.

### Evidence

- NVIDIA commit: `68efc6b8437ce5d518b7ad6d4b49469b78271de6`
- `manual:proof` PASS `22/0`
- `apply:proof` PASS `30/0`
- `write:create:proof` PASS `19/0`
- `browser:smoke` PASS `109/0`
- readiness wording `HARDENING_BASELINE_PASS_NOT_DAILY_USE_READY`
- guard matrix PASS `16/16`
- `agent:audit` PASS `25/25`
- `bridge:preflight:test` PASS `38/38`
- `bridge:preflight:e2e` PASS `22/22`
- encoding/mojibake clean

### Consequences

- The core create/apply UI proof gap is reduced.
- Live provider-quality create/apply remains unproven.
- Daily-use readiness remains unclaimed.
- Next scope requires gate review.

### Non-goals

- Does not prove live provider quality.
- Does not prove daily-use readiness.
- Does not implement bridge UI.
- Does not add sync or auto-promote.
- Does not mutate ABW.
- Does not claim production-ready.
- Does not claim Cognitive OS achieved.

## DECISION: Proceed to NVIDIA daily-use readiness audit

- Status: Accepted
- Date: 2026-05-04

### Context

- NVIDIA Full Manual Create/Apply E2E Proof completed the fixture-backed browser/UI create/apply proof.
- The remaining question is whether the NVIDIA app is ready for internal daily-use candidate status or which blockers remain.

### Decision

- Proceed next with a NVIDIA-only Daily-Use Readiness Audit.

### Evidence

- `manual:proof` PASS `22/0`
- `apply:proof` PASS `30/0`
- `write:create:proof` PASS `19/0`
- `browser:smoke` PASS `109/0`
- readiness wording `HARDENING_BASELINE_PASS_NOT_DAILY_USE_READY`
- guard matrix PASS `16/16`
- `agent:audit` PASS `25/25`
- bridge tests PASS `38/38` and `22/22`
- gate selected readiness audit over packaging, bridge UI, localization, or feature work

### Consequences

- The audit must classify readiness as `PASS`, `PARTIAL`, or `FAIL`.
- If `PASS` is not justified, the audit must identify exact blockers and next highest-value sprint.
- Daily-use-ready remains unclaimed until the audit explicitly returns `PASS`.
- Packaging and bridge UI remain blocked.

### Non-goals

- Does not implement code.
- Does not start packaging.
- Does not implement bridge UI.
- Does not mutate ABW.
- Does not claim daily-use readiness.
- Does not claim production-ready.
- Does not claim Cognitive OS achieved.

## DECISION: Classify NVIDIA daily-use readiness as PARTIAL and proceed to live provider create/apply proof

- Status: Accepted
- Date: 2026-05-04

### Context

- NVIDIA Daily-Use Readiness Audit reviewed the current evidence after Full Manual Create/Apply E2E Proof.

### Decision

- Classify NVIDIA readiness as `PARTIAL` and proceed next with a bounded NVIDIA-only live provider create/apply proof.

### Evidence

- `manual:proof` PASS `22/0`
- `apply:proof` PASS `30/0`
- `write:create:proof` PASS `19/0`
- `browser:smoke` PASS `109/0`
- guard matrix PASS `16/16`
- `agent:audit` PASS `25/25`
- bridge tests PASS `38/38` and `22/22`
- fixture-backed UI create/apply is proven
- live provider-quality create/apply remains unproven
- runtime hygiene backlog and stale README/readiness metadata remain

### Consequences

- Daily-use-ready remains unclaimed.
- Packaging remains blocked.
- Bridge UI remains blocked.
- The next sprint must prove live provider behavior or honestly block on provider/key/environment instability.

### Non-goals

- Does not implement code.
- Does not start packaging.
- Does not implement bridge UI.
- Does not mutate ABW.
- Does not claim daily-use readiness.
- Does not claim production-ready.
- Does not claim Cognitive OS achieved.

## DECISION: Record NVIDIA live provider create/apply proof harness without readiness upgrade

- Status: Accepted
- Date: 2026-05-04

### Context

- NVIDIA implemented and committed a bounded live provider create/apply proof harness after the daily-use readiness audit selected `A. LIVE_PROVIDER_CREATE_APPLY_PROOF`.

### Decision

- Accept the harness as a valid bounded proof mechanism and honest blocked-provider classification, but do not upgrade readiness because live provider-quality create/apply `PASS` was not proven in the current environment.

### Evidence

- NVIDIA commit:
  - `a8f52383280d3bd0de8fcd5c7264528ac21be0db`
- `npm run live:proof`:
  - `LIVE_PROVIDER_CREATE_APPLY_BLOCKED_PROVIDER_UNAVAILABLE`
- blocked reason:
  - `Missing NVIDIA_API_KEY for live provider proof.`
- audit verdict:
  - `AUDIT_READY_FOR_COMMIT`
- regression evidence:
  - `write:create:proof` PASS `19/0`
  - `apply:proof` PASS `30/0`
  - `manual:proof` PASS `22/0`
  - `browser:smoke` PASS `109/0`
  - `agent:audit` PASS `25/25`
  - bridge tests PASS `38/38` and `22/22`

### Consequences

- Daily-use readiness remains not `PASS`.
- Live provider success remains unproven until a provider key/environment is available and the proof returns `PASS`.
- Packaging remains blocked.
- Bridge UI, sync, and auto-promote remain blocked.
- Next step must be gate review / next-scope planning.

### Non-goals

- Does not claim daily-use-ready.
- Does not claim production-ready.
- Does not claim full bridge.
- Does not claim Cognitive OS achieved.
- Does not claim enterprise-grade security.
- Does not mutate ABW.
- Does not start packaging.

## DECISION: Record NVIDIA Vietnamese create-file routing fix without readiness upgrade

- Status: Accepted
- Date: 2026-05-04

### Context

- After live provider proof passed as a harness-level addition, manual real UI testing still showed chatbot-style behavior for a Vietnamese filename-less create-file request instead of a pending edit.

### Decision

- Accept the NVIDIA routing fix that detects the Vietnamese create-file intent, infers `proof/sum_ab.py`, and routes into the existing guarded pending-edit flow.
- Do not upgrade readiness yet.

### Evidence

- NVIDIA commit:
  - `aada52c61286a61b6766d96f181d1d38fb39d46f`
- prompt:
  - `viết cho tôi chương trình tính tổng 2 số A+B và đóng gói nó thành một file`
- inferred target:
  - `proof/sum_ab.py`
- audit verdict:
  - `AUDIT_READY_FOR_COMMIT`
- validation:
  - `git diff --check` PASS
  - `node --check tools/nvidia-server.mjs` PASS
  - `node --check tests/real-write-create-flow.test.mjs` PASS
  - `node --check tests/manual-ui-create-apply-e2e.test.mjs` PASS
  - `write:create:proof` PASS `25/0`
  - `apply:proof` PASS `30/0`
  - `manual:proof` PASS `22/0`
  - `browser:smoke` PASS `109/0`
  - `agent:audit` PASS `25/25`
  - `bridge:preflight:test` PASS `38/38`
  - `bridge:preflight:e2e` PASS `22/0`

### Consequences

- Manual Vietnamese create-file routing is stronger.
- Daily-use readiness remains not `PASS`.
- Packaging remains blocked.
- Bridge UI, sync, and auto-promote remain blocked.
- Next step must be gate review / next-scope planning.

### Non-goals

- Does not claim daily-use-ready.
- Does not claim production-ready.
- Does not claim full bridge.
- Does not claim Cognitive OS achieved.
- Does not claim enterprise-grade security.
- Does not mutate ABW.
- Does not start packaging.

## DECISION: Record NVIDIA manual write_file approval flow fix without readiness upgrade

- Status: Accepted
- Date: 2026-05-04

### Context

- After Vietnamese create-file routing was fixed, manual UI testing showed that Auto-Accept ON worked, but Auto-Accept OFF lacked a clear approval path and could fall into a misleading failure fallback.

### Decision

- Accept the NVIDIA manual approval flow fix for `write_file`.
- Do not upgrade readiness yet.

### Evidence

- NVIDIA commit:
  - `68658ad38ba064bc91e7447ba36378cf3beecc9d`
- commit message:
  - `fix: add explicit manual approval flow for write_file`
- audit verdict:
  - `AUDIT_READY_FOR_COMMIT`
- behavior:
  - Auto-Accept OFF surfaces `approvalRequired` / `approvalRequest` metadata and actionable approval modal
  - approved replay calls safe `/api/write_file`
  - approval creates pending edit only
  - Review + Apply still required for disk write
- validation:
  - `git diff --check` PASS
  - `node --check tools/nvidia-server.mjs` PASS
  - `node --check tests/real-write-create-flow.test.mjs` PASS
  - `node --check tests/manual-ui-create-apply-e2e.test.mjs` PASS
  - secret scan found no literal key
  - encoding/mojibake clean

### Consequences

- Manual create-file approval UX is stronger.
- Edit/delete/move/multi-file workflows remain unproven.
- Daily-use readiness remains not `PASS`.
- Packaging remains blocked.
- Bridge UI/sync/auto-promote remain blocked.
- Next step must be gate review / next-scope planning.

### Non-goals

- Does not claim daily-use-ready.
- Does not claim production-ready.
- Does not claim full bridge.
- Does not claim Cognitive OS achieved.
- Does not claim enterprise-grade security.
- Does not mutate ABW.
- Does not start packaging.

## DECISION: Proceed to NVIDIA existing file edit workflow proof

- Status: Accepted
- Date: 2026-05-04

### Context

- After manual `write_file` approval flow was fixed, the gate reviewed what next capability is most important for credible Agent IDE workflow.

### Decision

- Proceed next with a bounded NVIDIA-only Existing File Edit Workflow Proof.

### Rationale

- Create-file and manual approval are strong, but not sufficient.
- Editing existing files is the highest-frequency core Agent IDE path and should precede delete, move/rename, and multi-file mutation workflows.

### Consequences

- Next Builder scope must be NVIDIA repo only.
- The next proof must validate existing-file edit end-to-end through UI/browser/API proof.
- No daily-use-ready claim is authorized.
- Packaging remains blocked.
- Bridge UI/sync/auto-promote remain blocked.
- ABW mutation remains forbidden.

### Non-goals

- Does not implement delete.
- Does not implement move/rename.
- Does not implement broad multi-file edit.
- Does not implement packaging.
- Does not mutate ABW.
- Does not claim daily-use-ready.

## DECISION: Record NVIDIA existing file edit workflow proof without readiness upgrade

- Status: Accepted
- Date: 2026-05-04

### Context

- After create-file and manual `write_file` approval flows were strengthened, the next gate selected existing-file edit as the highest-frequency core Agent IDE workflow to prove.

### Decision

- Accept the NVIDIA Existing File Edit Workflow Proof.
- Do not upgrade readiness yet.

### Evidence

- NVIDIA commit:
  - `04479301bf0b4f3d3e4a08de1d22b5eba2193558`
- commit message:
  - `test: add NVIDIA existing file edit workflow proof`
- audit verdict:
  - `AUDIT_READY_FOR_COMMIT`
- command:
  - `npm run edit:proof`
- result:
  - `PASS 41/0`
- behavior:
  - fixture file exists before edit
  - pending edit created
  - file unchanged before apply
  - Review + Apply writes changed content
  - content verified as `return a + b + 1`
  - cleanup/restore verified
  - Auto-Accept OFF approval path validated
- regression evidence:
  - `write:create:proof` PASS `31/0`
  - `apply:proof` PASS `30/0`
  - `manual:proof` PASS `56/0`
  - `browser:smoke` PASS `109/0`
  - `agent:audit` PASS `25/25`
  - bridge tests PASS `38/38` and `22/22`

### Consequences

- Existing-file edit proof is accepted as bounded progress.
- Delete/move/multi-file workflows remain unproven.
- Daily-use readiness remains not PASS.
- Packaging remains blocked.
- Bridge UI/sync/auto-promote remain blocked.
- Next step must be gate review / next-scope planning.

### Non-goals

- Does not implement delete workflow.
- Does not implement move/rename workflow.
- Does not implement multi-file edit readiness.
- Does not claim daily-use-ready.
- Does not claim production-ready.
- Does not claim full bridge.
- Does not claim Cognitive OS achieved.
- Does not claim enterprise-grade security.
- Does not mutate ABW.
- Does not start packaging.

## DECISION: Proceed to NVIDIA delete file safety proof

- Status: Accepted
- Date: 2026-05-04

### Context

- After create-file, manual approval, and existing-file edit workflows were proven in bounded form, the gate reviewed the next highest-risk missing Agent IDE file operation.

### Decision

- Proceed next with a bounded NVIDIA-only Delete File Safety Proof.

### Rationale

- Delete is the most destructive missing operation.
- Its approval, workspace boundary, and apply semantics must be proven before move/rename, multi-file mutation, or any readiness upgrade.

### Consequences

- Next Builder scope must be NVIDIA repo only.
- The next proof must validate safe delete end-to-end.
- No daily-use-ready claim is authorized.
- Packaging remains blocked.
- Bridge UI/sync/auto-promote remain blocked.
- ABW mutation remains forbidden.

### Non-goals

- Does not implement move/rename.
- Does not implement multi-file edit.
- Does not implement packaging.
- Does not mutate ABW.
- Does not claim daily-use-ready.
- Does not claim production-ready.
- Does not claim full bridge.
- Does not claim Cognitive OS achieved.
- Does not claim enterprise-grade security.

## DECISION: Record NVIDIA delete file safety proof without readiness upgrade

- Status: Accepted
- Date: 2026-05-04

### Context

- After create-file and existing-file edit workflows were proven in bounded form, the next gate selected delete as the highest-risk destructive file operation to prove.

### Decision

- Accept the NVIDIA Delete File Safety Proof.
- Do not upgrade readiness yet.

### Evidence

- NVIDIA commit:
  - `e9a69ba1fb2d7ccd23aa3e4347c9d1cdb82cb47d`
- commit message:
  - `test: add NVIDIA delete file safety proof`
- audit verdict:
  - `AUDIT_READY_FOR_COMMIT`
- command:
  - `npm run delete:proof`
- result:
  - `PASS 44/0`
- behavior:
  - delete creates pending operation
  - no disk delete before apply
  - Auto-Accept OFF approval is explicit/actionable
  - outside-workspace/untrusted/no-approval/directory/glob/path traversal blocked
- regression evidence:
  - `live:proof` PASS `27/0`
  - `write:create:proof` PASS `31/0`
  - `apply:proof` PASS `30/0`
  - `manual:proof` PASS `56/0`
  - `edit:proof` PASS `41/0`
  - `browser:smoke` PASS `109/0`
  - `agent:audit` PASS `25/25`
  - bridge tests PASS `38/38` and `22/22`

### Consequences

- Delete file safety proof is accepted as bounded progress.
- Move/rename and multi-file edit workflows remain unproven.
- Daily-use readiness remains not PASS.
- Packaging remains blocked.
- Bridge UI/sync/auto-promote remain blocked.
- Next step must be gate review / next-scope planning.

### Non-goals

- Does not implement move/rename workflow.
- Does not implement multi-file edit readiness.
- Does not claim daily-use-ready.
- Does not claim production-ready.
- Does not claim full bridge.
- Does not claim Cognitive OS achieved.
- Does not claim enterprise-grade security.
- Does not mutate ABW.
- Does not start packaging.

## DECISION: Proceed to NVIDIA move/rename file workflow proof

- Status: Accepted
- Date: 2026-05-04

### Context

- After create-file, existing-file edit, and delete-file safety workflows were proven in bounded form, the gate reviewed the next missing core Agent IDE file operation.

### Decision

- Proceed next with a bounded NVIDIA-only Move/Rename File Workflow Proof.

### Rationale

- Move/rename is the next natural single-file mutation class after create/edit/delete.
- It should be proven before multi-file edit because it completes the bounded single-file safety surface first.

### Consequences

- Next Builder scope must be NVIDIA repo only.
- The next proof must validate safe move/rename end-to-end.
- No daily-use-ready claim is authorized.
- Packaging remains blocked.
- Bridge UI/sync/auto-promote remain blocked.
- ABW mutation remains forbidden.

### Non-goals

- Does not implement multi-file edit.
- Does not implement packaging.
- Does not mutate ABW.
- Does not claim daily-use-ready.
- Does not claim production-ready.
- Does not claim full bridge.
- Does not claim Cognitive OS achieved.
- Does not claim enterprise-grade security.

## DECISION: Record NVIDIA move/rename file workflow proof without readiness upgrade

- Status: Accepted
- Date: 2026-05-04

### Context

- After create, edit, and delete file workflows were proven in bounded form, the next gate selected move/rename as the remaining single-file mutation class to prove before multi-file edit.

### Decision

- Accept the NVIDIA Move/Rename File Workflow Proof.
- Do not upgrade readiness yet.

### Evidence

- NVIDIA commit:
  - `ccfeadacb72958997b52776b73b74c6df5633272`
- commit message:
  - `test: add NVIDIA move rename workflow proof`
- audit verdict:
  - `AUDIT_READY_FOR_COMMIT`
- command:
  - `npm run move:proof`
- result:
  - `PASS 71/0`
- behavior:
  - move/rename creates pending operation
  - no disk mutation before apply
  - Auto-Accept OFF approval is explicit/actionable
  - approved apply performs move/rename
  - source/target state verified
  - content preserved
  - outside-workspace/absolute/traversal/wildcard/directory/collision/no-approval/untrusted guards blocked
- regression evidence:
  - `write:create:proof` PASS `31/0`
  - `apply:proof` PASS `30/0`
  - `manual:proof` PASS `56/0`
  - `edit:proof` PASS `41/0`
  - `delete:proof` PASS `44/0`
  - `browser:smoke` PASS
  - `agent:audit` PASS `25/25`
  - bridge tests PASS `38/38` and `22/22`
- live provider note:
  - `live:proof` returned `LIVE_PROVIDER_CREATE_APPLY_FAIL 4/1` due upstream/provider `502 Bad Gateway` during this audit and is not a readiness upgrade signal

### Consequences

- Move/rename proof is accepted as bounded progress.
- Multi-file edit remains unproven.
- Daily-use readiness remains not PASS.
- Packaging remains blocked.
- Bridge UI/sync/auto-promote remain blocked.
- Next step must be gate review / next-scope planning.

### Non-goals

- Does not implement multi-file edit readiness.
- Does not claim daily-use-ready.
- Does not claim production-ready.
- Does not claim full bridge.
- Does not claim Cognitive OS achieved.
- Does not claim enterprise-grade security.
- Does not mutate ABW.
- Does not start packaging.
