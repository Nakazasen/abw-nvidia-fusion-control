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
