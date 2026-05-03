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
