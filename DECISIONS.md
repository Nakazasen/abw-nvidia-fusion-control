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
