# MASTER ROADMAP v1 - ABW x NVIDIA Cognitive OS

## 1. Current State

- NVIDIA Sprint 1-9 are completed and pushed.
- Sprint 9 `Browser E2E Smoke Harness` is complete.
- Next sprint is `Sprint 10: Settings / Provider Manager / API Key UI`.
- ABW bridge is not implemented.
- Current system is a strong NVIDIA Agent IDE prototype, not daily-use stable yet.
- Browser smoke baseline now exists and passed in real-browser mode.
- Browser smoke is not full E2E coverage.
- Current capability is not Cognitive OS yet.
- Current capability is not VS Code parity.
- Current capability is not Cursor parity.
- Current capability is not an ABW-governed runtime.
- Control repo latest recorded NVIDIA remote main: `6d1b1ea953b91313564cd6a6c77bebfbd60cbc5c`.
- Control repo latest recorded control remote main: `f3423f4558c06f8ccf33a1f84f0abd62f50fde02`.

## 2. Roadmap Governance Rules

- The control repo is the source of truth, not chat memory.
- Every sprint must follow this order:
  `Builder -> Audit/Fix -> Commit -> Push -> Control Repo Update -> Control Repo Commit/Push`
- No sprint is done until:
  implementation exists, audit passes, commit exists, push exists, and the control repo records the result.
- No capability claim without evidence.
- Every roadmap change must be recorded in `DECISIONS.md`.
- Every 4 sprints must trigger a Roadmap Review.
- Every major phase must trigger a Full System Audit.
- If real capability does not match planned capability, the roadmap must be adjusted openly.
- If audit evidence is weaker than the claim, the weaker interpretation wins.
- If the control repo is not updated after a sprint close, the next sprint should not start.

### Planning Horizons

- Short-term plan: Sprint 9-16, finish browser smoke, settings/provider controls, inline edit, recovery, SCM, security, memory UI, and daily-use hardening.
- Mid-term plan: Sprint 17-40, move from a stronger internal agent IDE into an ABW-governed internal Cognitive Workspace and internal pilot.
- Long-term plan: Sprint 41-60, add governed knowledge ingestion, self-growing wiki controls, self-improvement controls, and controlled tool generation.
- End-state plan: Sprint 61-80, reach Enterprise Cognitive OS Beta with enterprise runtime, orchestration, evidence ledger, compliance, and department workflows.

### Drift-Control Mechanism

- Treat `ROADMAP.md`, `HANDOFF.md`, `INTEGRATION_JOURNAL.md`, `RISKS.md`, and `DECISIONS.md` as a single governance set.
- After each sprint close, update the governance set before the next builder prompt is issued.
- If implementation order changes, record the reason in `DECISIONS.md`, note the risk in `RISKS.md`, and update the next-step truth in `HANDOFF.md`.
- If a planned capability slips, downgrade the claim in the roadmap instead of silently preserving the old promise.

### Capability Achievement Criteria

A sprint or phase only achieved its promised capability when all of the following are true:

- The intended user-facing behavior exists in code.
- The intended behavior has direct verification evidence appropriate to the claim.
- Known blockers are recorded, not hidden.
- Audit does not find a trust, security, rollback, or overclaim failure that invalidates the milestone.
- Commit and push evidence exist for implementation work.
- The control repo records what was achieved, what was not achieved, and what cannot yet be claimed.

## 3. Phase 1 - Internal Daily-Use Agent IDE

Sprint range: Sprint 1-16

### Sprint List

- Sprint 1: Composer / Diff UX - done
- Sprint 2: Context Picker - done
- Sprint 3: Terminal / Job Manager UX - done
- Sprint 4: Enterprise / IDE Mode Toggle - done
- Sprint 5: Extension UX Toi Thieu - done
- Sprint 6: Monaco Workbench / Multi-tab Editor - done
- Sprint 7: Semantic Index Cache / Context Engine - done
- Sprint 8: LSP Diagnostics / Problems Panel - done
- Sprint 9: Browser E2E Smoke Harness - done
- Sprint 10: Settings / Provider Manager / API Key UI
- Sprint 11: Inline Edit kieu Cursor
- Sprint 12: Task Timeline + Recovery / Resume
- Sprint 13: Git / SCM Panel tot hon
- Sprint 14: Security Permission Model co ban
- Sprint 15: Project Rules / Memory UI toi thieu
- Sprint 16: Daily-use hardening / E2E regression pack

### Capability Target

- Internal Agent IDE can be used daily by the builder/user.
- This phase does not claim ABW-governed Cognitive OS.
- This phase does not claim VS Code parity.
- This phase does not claim Cursor parity.

### Capability Warning

- After Sprint 9, warn that the next track must return to daily-use features, not deeper foundation work.
- Around Sprint 14-16, warn that this is the daily-use readiness gate.
- Daily-use readiness is still not achieved until Sprint 16 audit passes.

### Required Audit Gate

- Sprint 9: Browser smoke baseline gate (real-browser pass required, not full E2E proof)
- Sprint 16: Full daily-use readiness audit

### Sprint 16 Decision Outcomes

- PASS: internal daily-use candidate
- PARTIAL: continue hardening
- FAIL: schedule cleanup or rework sprint

## 4. Phase 2 - Cursor / Antigravity-like Agent IDE

Sprint range: Sprint 17-28

### Sprint List

- Sprint 17: Multi-file Composer nang cap
- Sprint 18: Planner / Task Graph
- Sprint 19: Better Apply / Conflict Resolver
- Sprint 20: Provider Routing & Cost / Latency Policy
- Sprint 21: Memory / Project Rules nang cap
- Sprint 22: Browser / Tool Automation toi thieu
- Sprint 23: Approval UX nang cap
- Sprint 24: Recovery / Resume nang cao
- Sprint 25: Evaluation Harness E2E mo rong
- Sprint 26: Agent Skill Registry
- Sprint 27: Workspace Templates / Internal App Generator
- Sprint 28: Cursor-like UX hardening

### Capability Target

- Internal Agent IDE becomes closer to Cursor or Antigravity.
- Task planning, edits, provider routing, recovery, and approvals become stronger.
- This phase still does not claim VS Code platform parity.

### Required Audit Gate

- Sprint 20: provider or routing audit
- Sprint 24: recovery or resume audit
- Sprint 28: Cursor-like UX capability review

## 5. Phase 3 - ABW-Governed Internal Cognitive Workspace

Sprint range: Sprint 29-40

### Sprint List

- Sprint 29: ABW Bridge v0 - Read-only Governance Bridge
- Sprint 30: ABW Ask / Route / Evidence Contract Integration
- Sprint 31: SOP / Knowledge Workspace
- Sprint 32: Technical Chatbot Workspace
- Sprint 33: Translation / Report Workspace
- Sprint 34: Fault Investigation Workspace
- Sprint 35: Workspace Role / Permission Model
- Sprint 36: Audit Log / Evidence Viewer
- Sprint 37: Human Approval Workflow
- Sprint 38: Enterprise Dashboard
- Sprint 39: Cross-workspace Search / Memory
- Sprint 40: Cognitive OS Internal Pilot

### Capability Target

- Agent IDE plus ABW becomes useful for technical chatbot, SOP, internal translation, fault investigation, and report generation.
- ABW helps weak agents reduce hallucination, overclaiming, and unsupported answers.
- Evidence, gaps, sources, and audit trails become visible.

### Important Milestones

- Sprint 32: technical chatbot pilot begins
- Sprint 33: translation or report workspace begins
- Sprint 34: fault investigation workspace begins
- Sprint 36: evidence or audit visibility gate
- Sprint 40: Cognitive OS internal pilot gate

### Required Audit Gate

- Sprint 30: ABW bridge contract audit
- Sprint 36: Evidence or Audit trust audit
- Sprint 40: Cognitive OS internal pilot audit

## 6. Phase 4 - Governed Knowledge Ingestion / Self-Growing Wiki v1

Sprint range: Sprint 41-52

### Sprint List

- Sprint 41: Governed Knowledge Ingest Pipeline
- Sprint 42: Source Trust / Citation Scoring
- Sprint 43: Knowledge Gap Detector
- Sprint 44: Draft Knowledge Update Workflow
- Sprint 45: AutoResearch Planner
- Sprint 46: Multi-source Evidence Collector
- Sprint 47: Evidence Conflict Detector
- Sprint 48: Claim Extraction / Claim Mapping
- Sprint 49: Knowledge Verification Gate
- Sprint 50: Controlled Wiki Merge
- Sprint 51: Knowledge Versioning / Rollback
- Sprint 52: Self-Growth Evaluation Harness

### Capability Target

- System can detect missing knowledge.
- System can propose knowledge updates.
- System can research from multiple sources.
- System can extract claims and map evidence.
- System can detect conflicts.
- System can create draft wiki updates.
- System can merge only through a governance gate.
- System can rollback bad knowledge.

### Important Rules

- This is where self-growing knowledge truly begins.
- The system must not learn freely.
- No evidence means no merge.
- Weak source means draft only.
- Conflict means human review.
- Unknown means gap, not fake answer.

### Required Audit Gate

- Sprint 44: governed ingest readiness audit
- Sprint 49: verification gate audit
- Sprint 52: self-growth safety audit

## 7. Phase 5 - Self-Improving Agent IDE / Controlled Tool Generation

Sprint range: Sprint 53-60

### Sprint List

- Sprint 53: Agent IDE Self-Improvement Loop
- Sprint 54: Safe Code Change Proposal
- Sprint 55: Auto-Test / Auto-Audit Before Apply
- Sprint 56: Self-Patch Review Queue
- Sprint 57: Plugin / Skill Self-Update Workflow
- Sprint 58: Knowledge-to-Code Generation Guard
- Sprint 59: Regression + Rollback Automation
- Sprint 60: Self-Improving Platform Beta

### Capability Target

- System can propose improvements to itself.
- System can generate patches.
- System can run tests and audits before apply.
- Human or policy approval still required.
- System can propose tools for production automation, but not silently deploy them.

### Production Tool Capability

- By Sprint 53-60, the system may propose and generate internal production support tools:
  image comparison against master image, print defect detection helper, log or image investigation helper, report or export tools, and Python or OpenCV or HALCON helper tools.
- These must go through:
  test data, ground truth, human review, audit, and rollback plan.

### Required Audit Gate

- Sprint 55: auto-test or auto-audit gate
- Sprint 60: self-improving platform beta audit

## 8. Phase 6 - Enterprise Cognitive OS Runtime

Sprint range: Sprint 61-80

### Sprint List

- Sprint 61: Multi-tenant Workspace Model
- Sprint 62: Enterprise Auth / SSO
- Sprint 63: Policy Engine
- Sprint 64: Evidence Ledger
- Sprint 65: Workflow Orchestration
- Sprint 66: Multi-agent Orchestration
- Sprint 67: Department Templates
- Sprint 68: SOP Execution Runtime
- Sprint 69: Manufacturing Fault Investigation Runtime
- Sprint 70: Translation / Bilingual Ops Runtime
- Sprint 71: Report / Document Generator
- Sprint 72: Internal App Builder
- Sprint 73: Data Connector Framework
- Sprint 74: On-prem Deployment Pack
- Sprint 75: Backup / Restore / Migration
- Sprint 76: Observability / Metrics
- Sprint 77: Red-team / Safety Evaluation
- Sprint 78: Compliance / Audit Pack
- Sprint 79: Pilot Hardening
- Sprint 80: Cognitive OS Enterprise Beta

### Capability Target

- Enterprise Cognitive OS Beta.
- Department-level workflows.
- Manufacturing fault investigation runtime.
- SOP execution runtime.
- Translation and report generation runtime.
- Evidence ledger.
- Policy engine.
- Multi-agent orchestration.
- Enterprise audit and compliance pack.

### Important Production Automation Milestone

- Sprint 69 is the manufacturing fault investigation runtime.
- This is the realistic phase for production-grade workflow using printer logs, print images, master images, machine parameters, SOP, defect history, ABW evidence, and internal tools generated earlier.

### Required Audit Gate

- Sprint 69: manufacturing fault investigation audit
- Sprint 78: compliance or safety audit
- Sprint 80: enterprise beta audit

## 9. Optional Platform Parity Track - VS Code-like Platform

Sprint range: Sprint 41-60+ or parallel track after daily-use stability

This track is optional, parallel, or later. It is not required for the Cognitive OS pilot.

### Possible Scope

- Real LSP Client Layer
- Go to Definition / Find References
- Rename Symbol / Code Actions
- Formatter / Linter Pipeline
- Debug Adapter Basic
- Real terminal PTY
- Task API
- Debug API
- SCM API
- Webview API
- `vscode.*` Extension API subset
- Extension Sandbox
- Marketplace Update / Trust / Signature
- Extension Compatibility Test Suite
- Large Repo Scaling

### Warning

- Do not let VS Code parity work delay practical Cognitive OS capabilities unless that tradeoff is explicitly decided and recorded.

## 10. Capability Milestone Table

| Sprint range | Capability name | What the system can do | What it still cannot claim | Required audit gate |
|---|---|---|---|---|
| Sprint 1-16 | Internal Daily-Use Agent IDE candidate | Builder-facing internal IDE workflows become daily-use candidates after hardening, smoke coverage, and regression pack work | Not ABW-governed Cognitive OS, not VS Code parity, not Cursor parity, not daily-use proven before Sprint 16 audit passes | Sprint 16 daily-use readiness audit |
| Sprint 17-28 | Cursor/Antigravity-like internal agent candidate | Better planning, edits, routing, approvals, recovery, and workflow continuity | Not VS Code parity, not Cognitive OS, not enterprise runtime | Sprint 28 Cursor-like UX capability review |
| Sprint 29-36 | IDE + ABW trusted technical workspace | Evidence-aware technical workspace with ABW route, ask, evidence, and audit visibility | Not self-growing wiki, not production runtime, not enterprise beta | Sprint 36 evidence or audit trust audit |
| Sprint 29-40 | Cognitive OS internal pilot | Internal pilot for chatbot, SOP, translation, reporting, and fault investigation workspace patterns | Not enterprise beta, not free self-learning, not production-grade manufacturing runtime | Sprint 40 Cognitive OS internal pilot audit |
| Sprint 41-44 | Governed ingest begins | Governed ingest, draft update flow, and explicit knowledge pipeline entry points begin | Not autonomous knowledge merge, not safe self-growth proven yet | Sprint 44 governed ingest readiness audit |
| Sprint 41-52 | Self-growing wiki v1 | Gap detection, evidence collection, claim mapping, governed merge, versioning, and rollback for knowledge | Not uncontrolled self-learning, not production-runtime automation | Sprint 52 self-growing knowledge safety audit |
| Sprint 53-60 | Self-improving Agent IDE beta | Self-improvement proposals, safe patch generation, test and audit before apply, rollback-aware review queue | Not silent self-modification, not production-ready tool deployment without human approval | Sprint 60 self-improving platform beta audit |
| Sprint 61-69 | Manufacturing fault investigation runtime | Department workflow runtime can investigate printer or machine faults using logs, images, SOP, parameters, defect history, and evidence | Not enterprise beta complete before wider platform hardening and compliance gates | Sprint 69 manufacturing fault investigation audit |
| Sprint 61-80 | Cognitive OS Enterprise Beta | Enterprise beta runtime with policy, evidence ledger, orchestration, app builder, connectors, deployment, observability, safety, and compliance pack | Not final production GA, not full VS Code parity by default | Sprint 80 enterprise beta audit |

## 11. User Warning / Alert Rules

The assistant or agent should warn the user when approaching these milestones:

| Trigger | Expected capability | Required evidence | What cannot be claimed yet | Roadmap review required |
|---|---|---|---|---|
| Approaching Sprint 9 | Browser smoke baseline for the existing NVIDIA prototype | Browser smoke flow, visible UI path checks, artifact capture if safe | Full E2E coverage, daily-use readiness, ABW integration | Yes |
| Approaching Sprint 16 | Internal daily-use Agent IDE candidate | Regression pack, browser smoke, stability evidence, cleanup audit, documented limitations | ABW-governed Cognitive OS, Cursor parity, VS Code parity | Yes |
| Approaching Sprint 28 | Cursor/Antigravity-like internal agent candidate | Planner, apply, routing, recovery, and approval evidence with audit | VS Code parity, Cognitive OS runtime | Yes |
| Approaching Sprint 36 | IDE + ABW trusted technical workspace | Evidence viewer, audit log, route/ask contract evidence, weak-agent trust behavior | Self-growing wiki, enterprise beta | Yes |
| Approaching Sprint 40 | Cognitive OS internal pilot | Technical chatbot, SOP, translation, report, and fault workspace evidence with ABW trust audit | Enterprise beta, production-grade manufacturing runtime | Yes |
| Approaching Sprint 44 | Governed ingest begins | Ingest pipeline, draft update workflow, source trust handling | Safe self-growing wiki v1, autonomous merge | Yes |
| Approaching Sprint 52 | Self-growing wiki v1 | Multi-source evidence, conflict detection, verification gate, controlled merge, rollback | Free self-learning, ungated merge | Yes |
| Approaching Sprint 60 | Self-improving Agent IDE beta | Safe patching, auto-test, auto-audit, approval queue, rollback evidence | Silent self-improvement, production-ready auto-generated tools without dataset and ground truth | Yes |
| Approaching Sprint 69 | Manufacturing fault investigation runtime | Logs, images, parameters, SOP, defect history, evidence wiring, audit, and rollback path | Enterprise beta complete, general autonomous factory control | Yes |
| Approaching Sprint 80 | Cognitive OS Enterprise Beta | Enterprise auth, policy engine, evidence ledger, runtime templates, compliance and safety evidence | GA, full production rollout, VS Code parity | Yes |

## 12. Roadmap Review Rules

- Review after every 4 sprints.
- Mandatory reviews:
  - after Sprint 9
  - after Sprint 16
  - after Sprint 28
  - after Sprint 36
  - after Sprint 40
  - after Sprint 52
  - after Sprint 60
  - after Sprint 69
  - after Sprint 80
- If sprint outcomes do not match plan:
  - update `ROADMAP.md`
  - add `DECISIONS.md` entry
  - add `RISKS.md` entry
  - update `HANDOFF.md`
  - do not silently change direction in chat

## 13. Full Audit / Clean Code Checkpoints

Mandatory full audit checkpoints:

- Sprint 9: browser smoke baseline
- Sprint 16: daily-use readiness audit
- Sprint 20: provider/settings security audit
- Sprint 24: recovery/resume audit
- Sprint 28: Cursor-like UX audit
- Sprint 30: ABW bridge contract audit
- Sprint 36: evidence/audit trust audit
- Sprint 40: Cognitive OS pilot audit
- Sprint 44: governed ingest audit
- Sprint 52: self-growing knowledge safety audit
- Sprint 55: auto-test/auto-audit gate
- Sprint 60: self-improving platform audit
- Sprint 69: manufacturing fault investigation audit
- Sprint 78: compliance/safety audit
- Sprint 80: enterprise beta audit

Each audit must check:

- code size or complexity
- dead code
- duplicate UI blocks
- stale runtime files
- broken tests
- overclaiming
- security or trust boundary
- evidence quality
- rollback ability
- whether a cleanup or refactor sprint is needed

## 14. Anti-Bloat / Anti-Garbage Rules

- If a feature is only mock, label it mock.
- If code grows too large, schedule a cleanup sprint.
- If runtime files leak into git, stop.
- If UI becomes duplicated or conflicting, stop.
- If tests only check syntax, do not claim E2E.
- If browser smoke fails, do not proceed.
- If ABW evidence is missing, do not claim grounded answer.
- If self-learning has no verification gate, do not merge knowledge.
- If tool generation has no test dataset or ground truth, do not call it production-ready.
