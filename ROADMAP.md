# MASTER ROADMAP v1 - ABW x NVIDIA Cognitive OS

## 1. Current State

- NVIDIA Sprint 1-16 are completed and pushed.
- NVIDIA Sprint 17 Route Modularization Foundation is completed and pushed.
- NVIDIA Sprint 18 Browser Smoke Modularization is completed and pushed.
- NVIDIA Sprint 19 Runtime Hygiene / Budget Follow-up is completed and pushed.
- ABW Sprint 20 Ingest Baseline Audit / Gap Map is completed and pushed.
- ABW Sprint 22 Domain Contamination Guard v1 is completed and pushed.
- ABW Sprint 23 Evidence Report + Gap Output Minimal Pair is completed and pushed.
- Sprint 9 `Browser E2E Smoke Harness` is complete.
- Sprint 10 Settings / Provider Manager / API Key UI is complete.
- Sprint 11 Inline Edit kieu Cursor is complete.
- Sprint 12 Task Timeline + Recovery / Resume is complete.
- Sprint 13 Git / SCM Panel tot hon is complete.
- Current readiness verdict: HARDENING_BASELINE_PASS_NOT_DAILY_USE_READY.
- Latest NVIDIA completion recorded in control truth: `aada52c61286a61b6766d96f181d1d38fb39d46f`.
- Sprint 16.5 cleanup is completed and pushed after Phase 1 Gate Review verdict B.
- ABW bridge is not implemented.
- Current system is a strong NVIDIA Agent IDE prototype, not daily-use stable yet.
- Browser smoke baseline now exists and passed in real-browser mode.
- Browser smoke is not full E2E coverage.
- Provider/settings layer now exists.
- API key UI now exists.
- API key secret storage is local plaintext runtime state, not encrypted.
- Inline edit workflow now exists with proposal-only pending edits, explicit apply flow, enterprise mutation block, and dirty-tab safety fixes.
- Sprint 12 task timeline/recovery workflow now exists with persisted runtime task records under ignored state, guarded task mutation APIs, taskId wiring into the agent/proxy flow, and manual recovery marker semantics (not full autonomous recovery).
- Non-NVIDIA providers are config-ready but not fully wired for real chat execution.
- Current capability is not Cognitive OS yet.
- Current capability is not VS Code parity.
- Current capability is not Cursor parity.
- Current capability is not an ABW-governed runtime.
- Control repo latest recorded NVIDIA remote main: 68efc6b8437ce5d518b7ad6d4b49469b78271de6.
- Control repo latest recorded ABW remote main: `fe0520626d8f254476424242e29ea2bef4807f73`.
- Control repo latest recorded control remote main: `6f8df242b499382360f7a9214c596fc022fbf8f1`.
- Sprint 17 scope summary:
  - server route modularization foundation
  - extracted read-only GET route group (`/api/workspace`, `/api/pending_edits`, `/api/tools`, `/api/rate_limit`)
  - added safe read-only endpoint `GET /api/health`
  - browser smoke regression now passes `99/0`
- Sprint 18 scope summary:
  - browser smoke modularization
  - stable entrypoint preserved
  - `tools/smoke` modules added
  - browser smoke validation remained `99/0`
- Sprint 19 scope summary:
  - idle memory measurement/reporting added
  - security log reporting improved
  - dry-run hygiene behavior preserved
  - `securityRotation` remains `NOT_ROTATED_YET`
- Sprint 20 scope summary:
  - docs-only ingest baseline gap map
  - ABW v1.2 ingest acceptance criteria
  - no source behavior changes
  - no bridge
  - no ingest implementation code
- Sprint 22 scope summary:
  - optional `domain_guard` config support
  - `PASS` / `WARN` / `BLOCKED` / `NOT_CONFIGURED` / `ERROR` status model
  - quarantine behavior for blocked domain mismatch
  - `domain_check` evidence in draft/manifest/queue
  - contamination regression tests added
- Sprint 23 scope summary:
  - runtime artifact `.brain/ingest_report.json`
  - runtime artifact `.brain/ingest_gaps.json`
  - schema versions `abw.ingest_report.v1` and `abw.ingest_gaps.v1`
  - shared `run_id` / `created_at` correlation
  - contract-level regression tests added
  - no bridge implementation
- Sprint 24 must not start until this Sprint 23 completion control record is committed and pushed.
- Sprint 21-22 should target ABW ingest hardening based on Sprint 20 gap map.
- Bridge Phase 1 remains blocked until ABW ingest baseline proof.
- Sprint 23 gate review selected `C. INSERT_EVIDENCE_REPORTING_SPRINT`.
- Post-Sprint-23 explicit gate review selected `A. PROCEED_TO_BRIDGE_PHASE_1` for scope planning only.
- Bridge Phase 1 builder implementation is still not authorized at this point.
- NVIDIA Bridge Phase 1 Preflight Reader + Contract Tests is completed and pushed.
- Bridge Phase 1 scope summary:
  - preflight reader
  - contract tests
  - local status model `PASS` / `WARN` / `FAIL`
  - fail-closed on missing/invalid ABW evidence
  - reads `.brain/ingest_report.json` + `.brain/ingest_gaps.json`
  - no UI / no write-back / no sync / no auto-promote
- NVIDIA Bridge Preflight E2E Proof is completed and pushed.
- Bridge Preflight E2E Proof record:
  - NVIDIA commit `1ae4515e8ba405c970ec23b5af5d00c8daa38f65`
  - validates ABW artifact generation -> NVIDIA preflight consumption -> PASS/WARN/FAIL
  - bounded NVIDIA changes only: `package.json`, `tests/bridge-preflight-e2e.test.mjs`
- Bridge Preflight E2E Proof does NOT unlock UI/write-back/sync/auto-promote automatically.
- Next scope must be decided by explicit gate review / next-scope planning.
- Latest next-scope gate verdict is `C. PROCEED_TO_NVIDIA_FILE_EDIT_APPLY_WORKFLOW_PROOF`.
- NVIDIA UI usability smoke repair record:
  - NVIDIA commit `e9e78460c37649a76019780d9180a7d6abbbd580`
  - files changed: `nvidia_playground.html`, `tools/browser-smoke.mjs`
  - validation: browser smoke `99/0`, guard `16/16`, `agent:audit` `25/25`, `bridge:preflight:test` `38/38`, `bridge:preflight:e2e` `22/22`
- Immediate smoke regressions are repaired, but current NVIDIA UI is still not daily-use proven.
- Daily-use readiness is not proven, Vietnamese localization remains incomplete, and full Agent IDE UX is not proven.
- Next work focuses on NVIDIA-only file edit/apply workflow proof for `read file -> propose edit -> view diff -> review/apply -> verify result`.
- Bridge expansion remains paused after bounded preflight E2E completion and bounded UI smoke repair.
- Bridge UI/write-back/sync/auto-promote remain forbidden unless a later gate explicitly authorizes them.
- Packaging remains premature until daily-use workflow proof is stronger.
- Carry-over constraints remain active:
  - `securityRotation: NOT_ROTATED_YET`
  - `idleMemoryEstimateMb: NOT_MEASURED_YET`
  - server monolith still large; split discipline remains mandatory
  - ABW bridge not implemented

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

- Short-term plan: Phase 1 Gate Review before Sprint 17 implementation.
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

## 2A. Long-Term Sustainable Development Doctrine

- The project must remain usable, maintainable, and understandable as it grows from Sprint 17 to Sprint 80+.
- Feature growth is not allowed to outrun architecture, runtime hygiene, performance control, or trust boundaries.
- Every phase must preserve performance, modularity, bounded runtime data, test reliability, security boundaries, rollback ability, and evidence-backed claims.
- Sprint 80 is not dangerous by itself.
- Sprint 80 without architecture and load control is dangerous.
- Heavy future features must not all run inside the IDE process.
- The correct gate question before Sprint 17 is not only "What is Sprint 17?" but "Is the system light, clean, modular, bounded, and controlled enough to be allowed into Sprint 17?"

## 2B. Mandatory Performance & Bloat Budget Gate After Sprint 16

After Sprint 16, Phase 1 Gate Review must include a mandatory Performance & Bloat Budget Gate before any Sprint 17 implementation.

The gate must evaluate:

- `D:\Sandbox\Nvidia\nvidia_playground.html` size and monolith risk.
- `D:\Sandbox\Nvidia\tools\browser-smoke.mjs` size and fragility.
- `D:\Sandbox\Nvidia\tools\nvidia-server.mjs` route/API growth.
- Server startup time, if measurable.
- Browser smoke runtime.
- Node idle memory or process memory estimate, if measurable.
- `.nvidia-agent` runtime data growth.
- Reports, tasks, index, security, rules, diagnostics rotation.
- Lazy loading behavior.
- Module split plan.
- Runtime artifact staging safety.
- Feature off-switch strategy.
- Heavy future service/worker separation.
- Whether Sprint 16.5 cleanup is needed before Sprint 17.

### Phase 1 Gate Decision Matrix

After Phase 1 Gate Review, choose exactly one:

| Decision | Meaning | Constraint |
| --- | --- | --- |
| `A. PROCEED_TO_SPRINT_17` | System is light enough, clean enough, and controlled enough to enter Sprint 17. | Limitations remain documented. |
| `B. INSERT_SPRINT_16_5_CLEANUP` | Performance, bloat, or modularization risk is significant but fixable. | Focus on cleanup, split, rotation, performance budget, and test harness organization. |
| `C. INSERT_BUGFIX_HARDENING_SPRINT` | Functional, safety, or regression blockers exist. | Fix blockers before feature growth. |
| `D. DOWNGRADE_PHASE_1_READINESS` | `INTERNAL_DAILY_USE_CANDIDATE` is not justified. | Downgrade readiness and record evidence. |

Sprint 17 cannot start unless decision `A. PROCEED_TO_SPRINT_17` is explicitly selected and recorded.

### 2026-05-02 Phase 1 Gate Review Result

- Gate verdict: `B. INSERT_SPRINT_16_5_CLEANUP`.
- Sprint 17 remains blocked.
- Current readiness remains `INTERNAL_DAILY_USE_CANDIDATE` (candidate-only, not production readiness).

Sprint 16.5 cleanup objective:

- Establish repeatable performance budget baseline (startup, smoke runtime/check-count, memory where practical).
- Define and execute initial monolith reduction plan for UI/server/smoke surfaces.
- Bound runtime data with explicit cap/rotation/cleanup policy and audit checks.
- Harden feature off-switch and safe-mode behavior.
- Produce post-cleanup re-gate evidence pack.

Unblock condition:

- Sprint 17 can start only after post-cleanup Phase 1 re-gate explicitly records `A. PROCEED_TO_SPRINT_17`.

### 2026-05-02 Sprint 16.5 Cleanup Close Summary

- Sprint 16.5 cleanup is completed and pushed in NVIDIA repo at `86e929166c50f2b338f8854fa7eb9d278ff20beb` (`test: add Sprint 16.5 cleanup budget gates`).
- Scope delivered:
  - performance budget baseline script
  - runtime hygiene dry-run/apply-safe script
  - package scripts: `budget:check`, `runtime:hygiene`
  - modularization cleanup plan document
- Validation evidence:
  - `node --check` pass for `tools/performance-budget.mjs`, `tools/runtime-hygiene.mjs`, `tools/nvidia-server.mjs`, `tools/browser-smoke.mjs`, `tools/agent-core.mjs`
  - `npm run budget:check` pass
  - `npm run runtime:hygiene` pass in DRY-RUN mode (no delete)
  - `npm run agent:audit` pass `25/25`
  - `npm run browser:smoke -- --start-server --port 3456` pass `97/0`, server stopped cleanly
- Current measured budget snapshot:
  - cold start `138 ms`
  - reachability `252 ms`
  - idle memory `NOT_MEASURED_YET`
  - `nvidia_playground.html` `286578 bytes / 6324 lines`
- Runtime hygiene snapshot:
  - mode `DRY-RUN`
  - scanned `324`
  - would delete `252`
  - preserved `1` audit markdown
  - boundary rejected `0`
  - security rotation `NOT_ROTATED_YET`
- Remaining limitations:
  - single large `.jsonl` rotation (notably `security/permission-audit.jsonl`) is detected/reported but not auto-rotated yet
  - idle memory baseline remains `NOT_MEASURED_YET`

Post-cleanup gate requirement:

- Re-gate completed and selected `A. PROCEED_TO_SPRINT_17`.
- Sprint 17 is authorized to plan/execute after this control record is committed.
- Authorization constraints must carry forward:
  - `securityRotation: NOT_ROTATED_YET`
  - `idleMemoryEstimateMb: NOT_MEASURED_YET`
  - monolith split discipline and anti-bloat controls
  - runtime hygiene dry-run safety posture
  - non-claim boundaries

## 2C. Performance Budget Policy

Each sprint after Sprint 16 should record, where practical:

- Server cold start time.
- Browser smoke duration.
- Number of browser smoke checks.
- Node idle memory or process memory estimate.
- Size of `nvidia_playground.html`.
- Size of `tools/browser-smoke.mjs`.
- Size and count of runtime artifacts in `.nvidia-agent`.
- Whether the new feature is lazy-loaded.
- Whether the new feature has an off-switch or safe mode.
- Whether runtime data has cap or rotation.

Initial budget suggestions:

- Local server cold start target: <= 5-8 seconds.
- Browser smoke default suite target: <= 60-90 seconds unless explicitly running a full suite.
- Runtime reports should rotate.
- Tasks, security, rules, diagnostics, and index state must be bounded.
- Screenshots and reports must not grow forever.
- Heavy features must run on-demand or in a worker/service.

These numbers are initial budgets, not permanent truth. Revise them only with evidence.

## 2D. Modularization Policy

`nvidia_playground.html` should gradually become a thin shell. Do not require an immediate full rewrite, but every future sprint must avoid making monolith risk worse.

Future direction:

- `settings-ui.js`
- `scm-ui.js`
- `tasks-ui.js`
- `rules-ui.js`
- `security-ui.js`
- `diagnostics-ui.js`
- `composer-ui.js`
- Browser-smoke modules.
- Server route modules.
- Worker/service layer for heavy tasks.

## 2E. Lazy Loading Policy

Features should load on demand.

Examples:

- SCM refresh only when the SCM panel opens.
- Problems fetch only when Problems opens.
- Project Rules load only when Settings or Rules opens.
- Index search does not rebuild automatically on app start.
- Reports do not load full history.
- Browser automation runs only when requested.
- ABW bridge remains disabled/off until explicitly enabled.

## 2F. Runtime Data Bound Policy

`.nvidia-agent` data must be bounded.

Runtime areas:

- reports
- tasks
- rules
- security logs
- diagnostics
- index
- profile
- tmp
- screenshots

Rules:

- No infinite growth.
- Cap count or size.
- Rotate or cleanup.
- Never stage runtime artifacts.
- No secrets in runtime reports.
- No raw API keys in committed artifacts.
- Stale runtime state must not corrupt app startup.

## 2G. Feature Off-Switch Policy

Large or risky features must have a way to disable, degrade, or run in safe mode.

Examples:

- Semantic index on/off.
- Browser automation on/off.
- Project rules context injection on/off.
- ABW bridge on/off.
- Extension host safe mode.
- Diagnostics sync on/off.
- Provider integrations configurable.
- Future self-growing wiki disabled by default until governed.

## 2H. Worker / Service Separation Policy

Heavy future workloads must not be forced into the IDE UI/server process.

Heavy workloads include:

- Self-growing wiki.
- Auto research.
- Knowledge ingest.
- Tool generation.
- Manufacturing fault investigation.
- Image evaluation.
- OCR/vision.
- Local LLM, reranker, or embedding jobs.
- ABW governance bridge.

Preferred architecture:

- IDE = control panel.
- Worker/service = heavy work.
- ABW = governance, evidence, and trust layer.
- Indexer = search/index work.
- Image tools = separate job when needed.

## 2I. Cleanup / Audit Cadence

Not every sprint is a feature sprint.

Recommended cadence:

- Every 4 sprints: review/cleanup checkpoint.
- Phase boundaries: full gate review.
- Before bridge, self-growing wiki, or tool-generation phases: trust/safety audit.
- If performance or bloat risk is high: insert cleanup sprint before new features.

Explicit future checkpoints:

- Sprint 16: Phase 1 Gate Review.
- Sprint 20: cleanup / modularization review.
- Sprint 24: performance audit.
- Sprint 28: phase audit.
- Sprint 36: bridge + governance audit.
- Sprint 40: full system audit.
- Sprint 52: knowledge ingestion audit.
- Sprint 60: self-improvement safety audit.
- Sprint 80: enterprise beta audit.

## 2J. Post-Sprint 17 Strategic Dependency Adjustment (2026-05-02)

- Sprint 80 remains the long-term Enterprise Cognitive OS Beta target.
- The roadmap is not shortened and not cancelled.
- Near-term sequencing is corrected after Sprint 17:
  - Sprint 18-19: NVIDIA modularization and runtime hardening only (no deep ABW bridge).
  - Sprint 20-22: prioritize ABW v1.2 Ingest Kernel Hardening.
  - Sprint 23-26: NVIDIA<->ABW Bridge Phase 1 may start only after ABW ingest baseline is proven.
  - Sprint 27-30: bridge hardening and E2E governance validation.
- Deep NVIDIA<->ABW bridge is dependency-gated on ABW ingest maturity.

Required ABW ingest baseline proof before deep bridge work:

- User can put raw files into `raw/`.
- Run one command.
- ABW produces drafts/manifests/reports/review queue.
- Failed/skipped files are visible.
- No domain contamination.
- No blind auto-promote.
- No grounded claim without valid source.

## 2K. Sprint 18 Scope Decision (2026-05-02)

- Selected scope: `B. Browser Smoke Modularization`.
- Sprint 18 remains within NVIDIA modularization/runtime hardening.
- Sprint 18 is not bridge-first.
- Sprint 18 objective: split `tools/browser-smoke.mjs` into smaller suites/helpers while preserving current smoke coverage and behavior.
- Keep Sprint 20-22 target: ABW v1.2 Ingest Kernel Hardening.
- Keep Sprint 23-26 target: Bridge Phase 1 only after ABW ingest baseline proof.

## 2L. Sprint 18 Completion Record / Sprint 19 Gate (2026-05-02)

- Sprint 18 Browser Smoke Modularization is completed and pushed in NVIDIA repo.
- Latest NVIDIA remote main is `a5d976090dd99fd76a39474fd475f6f03582c27c`.
- Near-term sequence remains:
  - Sprint 18-19: NVIDIA modularization/runtime hardening
  - Sprint 20-22: ABW v1.2 Ingest Kernel Hardening
  - Sprint 23-26: Bridge Phase 1 only after ABW ingest baseline proof
  - Sprint 27-30: bridge hardening/E2E governance validation
- Sprint 19 is blocked until this control repo Sprint 18 completion record is committed/pushed.

## 2M. Sprint 19 Scope Decision (2026-05-02)

- Selected scope: `C. Runtime Hygiene / Budget Follow-up`.
- Sprint 19 remains within NVIDIA modularization/runtime hardening.
- Sprint 19 is not bridge-first.
- Sprint 19 objective:
  - improve runtime hygiene/budget evidence
  - address `securityRotation: NOT_ROTATED_YET` safely
  - improve idle memory measurement/reporting
- Keep Sprint 20-22 target: ABW v1.2 Ingest Kernel Hardening.
- Keep Sprint 23-26 target: Bridge Phase 1 only after ABW ingest baseline proof.

## 2N. Sprint 20 Scope Decision (2026-05-02)

- Selected scope: `A. ABW Ingest Baseline Audit / Gap Map`.
- Sprint 20 starts ABW v1.2 Ingest Kernel Hardening phase.
- Sprint 20 is audit/gap-map first, not implementation-heavy bridge work.
- Sprint 20 objective:
  - map `raw/ -> parse -> normalize -> draft -> manifest -> report -> review/gap` behavior from current ABW reality
  - produce evidence-backed gap matrix for `implemented / partial / missing`
  - define acceptance criteria for Sprint 21-22 targeted hardening
- Sprint 21-22 should use this gap map for targeted hardening.
- Sprint 23-26 Bridge Phase 1 remains blocked until ABW ingest baseline proof.

## 2O. ABW Sprint 20 Completion Record (2026-05-02)

- ABW Sprint 20 Ingest Baseline Audit / Gap Map is completed and pushed.
- Latest ABW remote main is `0bf89eca9ee141aa1aba147185d31691340ac2b9`.
- Sprint 20 delivered docs-only baseline artifacts:
  - `docs/sprint-20-ingest-baseline-gap-map.md`
  - `docs/abw-v1.2-ingest-acceptance-criteria.md`
- No ABW source behavior changes were introduced by Sprint 20.
- No bridge implementation and no ingest implementation code were added in Sprint 20.
- Sprint 21 remains blocked until this control record is committed/pushed.

## 2P. Sprint 21 Scope Decision (2026-05-02)

- Selected scope: `A. Disable / Gate Blind Auto-Promotion`.
- Sprint 21 remains within ABW v1.2 Ingest Kernel Hardening.
- Sprint 21 is not bridge-first.
- Sprint 21 objective:
  - block hidden/blind auto-promote paths
  - enforce manual-first promotion invariant
  - preserve explicit approve path if safe
  - add promotion safety regression tests
- Sprint 22 should continue ABW ingest hardening based on remaining Sprint 20/Sprint 21 gaps.
- Sprint 23-26 Bridge Phase 1 remains blocked until ABW ingest baseline proof.

## 2Q. ABW Sprint 21 Completion Record (2026-05-03)

- ABW Sprint 21 Disable / Gate Blind Auto-Promotion is completed and pushed.
- Latest ABW remote main is `e129a906f4df5f541fc3105e9fc04ce791addc79`.
- Sprint 21 scope summary:
  - default blind auto-promote path removed/gated
  - `_review_decision` is now manual-review oriented
  - `run_promote_drafts` is fail-closed by default
  - explicit approval path is preserved
  - promotion safety tests are added/updated
- Sprint 22 must not start until this control repo update is committed/pushed.
- Sprint 22 should continue ABW ingest hardening based on remaining gaps:
  - domain contamination guard
  - manifest/source evidence contract
  - aggregate ingest report
  - machine-readable gap output
- Bridge Phase 1 remains blocked until ABW ingest baseline proof.

## 2R. Sprint 22 Scope Decision (2026-05-02)

- Selected scope: `A. Domain Contamination Guard v1`.
- Sprint 22 remains within ABW v1.2 Ingest Kernel Hardening.
- Sprint 22 is not bridge-first.
- Sprint 22 objective:
  - detect domain/workspace mismatch during ingest
  - enforce domain profile checks where available
  - warn/quarantine/skip instead of silent accept
  - add contamination regression tests
  - preserve Sprint 21 promotion safety invariants
- Sprint 23-26 Bridge Phase 1 remains blocked until ABW ingest baseline proof.

## 2S. ABW Sprint 22 Completion Record (2026-05-03)

- ABW Sprint 22 Domain Contamination Guard v1 is completed and pushed.
- Latest ABW remote main is `4829b4bcea25ff70bd14a9b1f9470539bc82e569`.
- Sprint 22 completion evidence:
  - commit: `4829b4bcea25ff70bd14a9b1f9470539bc82e569`
  - message: `feat: add Sprint 22 domain contamination guard`
  - push: `e129a90..4829b4b main -> main`
  - HEAD equals origin/main: `yes`
- Sprint 22 implemented summary:
  - bounded rule-based domain contamination guard in ingest path
  - `NOT_CONFIGURED` is explicitly non-protective by design
  - malformed config/guard fails to `ERROR` + `warn`, not silent PASS
  - blocked path quarantines before draft/manifest/queue writes
  - warning path preserves ingest with warning evidence
  - quarantine visibility via `skipped_domain_quarantine` and `quarantined_count`
  - regression tests and sprint docs added
- Sprint 23 must not start until this control repo update is committed/pushed.
- Sprint 23-26 Bridge Phase 1 remains conditional on explicit gate review against ingest baseline proof and remaining gaps.
- Do not claim bridge readiness only because Sprint 22 passed.

## 2T. Sprint 23 Explicit Gate Review Verdict (2026-05-03)

- Gate verdict selected: `C. INSERT_EVIDENCE_REPORTING_SPRINT`.
- Bridge Phase 1 is not authorized at this point.
- Sprint 23 becomes a pre-bridge Evidence Reporting Sprint.
- Sprint 23 objective:
  - define a stable ingest-bound machine-readable report contract
  - unify ingest outcome + gap classification into a single bridge-facing contract
  - include failed/skipped/quarantined/source/hash/domain_check/review/promotion state
  - add contract-level regression tests
- Sprint 23 remains pre-bridge.
- Bridge Phase 1 may be reconsidered only after Sprint 23 completion and a later explicit gate review.

## 2U. Sprint 23 Scope Decision (2026-05-03)

- Selected scope: `C. Evidence Report + Gap Output Minimal Pair`.
- Sprint 23 remains a pre-bridge Evidence Reporting Sprint.
- Bridge Phase 1 remains NOT authorized.
- Sprint 23 objective:
  - implement stable machine-readable `ingest_report.json`
  - implement stable machine-readable `ingest_gaps.json`
  - correlate both artifacts by shared run id/timestamp
  - include ingest outcome + gap classification
  - include failed/skipped/quarantined/source/hash/domain_check/review/promotion state
  - add contract/schema regression tests
- Future Bridge Phase 1 may be reconsidered only after Sprint 23 completion and another explicit gate review.

## 2V. ABW Sprint 23 Completion Record (2026-05-03)

- ABW Sprint 23 Evidence Report + Gap Output Minimal Pair is completed and pushed.
- Latest ABW remote main is `fe0520626d8f254476424242e29ea2bef4807f73`.
- Sprint 23 completion evidence:
  - commit: `fe0520626d8f254476424242e29ea2bef4807f73`
  - message: `feat: add Sprint 23 ingest evidence reports`
  - push: `4829b4b..fe05206 main -> main`
  - HEAD equals origin/main: `yes`
- Sprint 23 implemented summary:
  - runtime generation of `.brain/ingest_report.json` and `.brain/ingest_gaps.json`
  - stable schema versions `abw.ingest_report.v1` and `abw.ingest_gaps.v1`
  - shared run-correlation fields `run_id` and `created_at`
  - contract tests and contract docs added
  - no bridge code/import/dependency
- Sprint 24 must not start until this control repo Sprint 23 completion record is committed/pushed.
- Bridge Phase 1 remains blocked until a later explicit gate review selects `A. PROCEED_TO_BRIDGE_PHASE_1`.
- After this record is committed, next step is explicit post-Sprint 23 gate review, not automatic Bridge Builder.

## 2W. Post-Sprint-23 Gate Review Verdict A (2026-05-03)

- Gate verdict selected: `A. PROCEED_TO_BRIDGE_PHASE_1`.
- Authorization level: Bridge Phase 1 scope planning only, after this control update is committed/pushed.
- This verdict does NOT authorize Bridge Builder implementation yet.
- Required Bridge Phase 1 constraints:
  - read-only
  - evidence-only
  - no write-back
  - no auto-promote
  - no autonomous sync
  - no production claim
  - no Cognitive OS claim
  - no enterprise-grade security claim
- Next step is Bridge Phase 1 scope planning and scope-record commit, not implementation.
- Sprint 24 should be treated as Bridge Phase 1 planning/scope gate unless later governance explicitly renames scope.

## 2X. Bridge Phase 1 Scope Decision (2026-05-03)

- Selected scope: `C. Bridge Preflight Reader + Contract Tests`.
- Bridge Phase 1 is now scope-planned, but implementation has not started.
- Implementation may start only after this control update is committed/pushed and Builder prompt is issued.
- Allowed scope:
  - read `.brain/ingest_report.json`
  - read `.brain/ingest_gaps.json`
  - validate schema versions, required fields, and run correlation (`run_id` / `created_at`)
  - return local preflight status: `PASS` / `WARN` / `FAIL`
  - fail closed on missing/invalid evidence
  - add contract tests
- Forbidden in Bridge Phase 1:
  - no UI
  - no write-back
  - no sync
  - no auto-promote
  - no ABW mutation
  - no production/Cognitive OS/enterprise-grade security claim

## 2Y. NVIDIA Bridge Phase 1 Completion Record (2026-05-03)

- NVIDIA Bridge Phase 1 `Preflight Reader + Contract Tests` is completed and pushed.
- Previous NVIDIA main before Bridge Phase 1:
  - `875c0e1ae6fa033fee3b348d3ea52f738bebfa52`
- Latest NVIDIA main after Bridge Phase 1:
  - `86abf49025d14138a97fc8706e94c245fcad1002`
- Commit:
  - `86abf49025d14138a97fc8706e94c245fcad1002`
  - `feat: add Bridge Phase 1 preflight reader`
- Push evidence:
  - `875c0e1..86abf49 main -> main`
  - `HEAD == origin/main: yes`
- Files committed:
  - `docs/bridge-phase-1-preflight.md`
  - `package.json`
  - `tests/bridge-preflight.test.mjs`
  - `tools/bridge-preflight.mjs`
- Boundaries preserved:
  - no UI
  - no write-back
  - no sync
  - no auto-promote
  - no ABW mutation
  - no server route integration
- Governance guardrail:
  - No further bridge/UI work may start until this control repo completion record is committed/pushed.
  - Next sequence must be explicit Bridge Phase 1 completion gate / next-scope planning.

## 2Z. Bridge Phase 1 Completion Gate Verdict (2026-05-03)

- Gate verdict selected: `C. INSERT_BRIDGE_PREFLIGHT_E2E_PROOF_SPRINT`.
- Bridge Phase 1 preflight reader is accepted as bounded/read-only/fail-closed.
- UI/write-back/sync/auto-promote scope remains NOT authorized.
- Next required sprint is bounded E2E proof:
  - ABW generates real `.brain/ingest_report.json` + `.brain/ingest_gaps.json`
  - NVIDIA preflight consumes those artifacts
  - PASS/WARN/FAIL paths are asserted end-to-end
- Governance sequence requirement:
  - No Builder prompt may be issued until this gate verdict record is committed/pushed.
  - No automatic Bridge UI follow-up.

## 3. Phase 1 - Internal Daily-Use Agent IDE

Sprint range: Sprint 1-16

### Sprint List (Phase 1)

- Sprint 1: Composer / Diff UX - done
- Sprint 2: Context Picker - done
- Sprint 3: Terminal / Job Manager UX - done
- Sprint 4: Enterprise / IDE Mode Toggle - done
- Sprint 5: Extension UX Toi Thieu - done
- Sprint 6: Monaco Workbench / Multi-tab Editor - done
- Sprint 7: Semantic Index Cache / Context Engine - done
- Sprint 8: LSP Diagnostics / Problems Panel - done
- Sprint 9: Browser E2E Smoke Harness - done
- Sprint 10: Settings / Provider Manager / API Key UI - done
- Sprint 11: Inline Edit kieu Cursor - done
- Sprint 12: Task Timeline + Recovery / Resume - done
- Sprint 13: Git / SCM Panel tot hon - done
- Sprint 14: Security Permission Model co ban - done
- Sprint 15: Project Rules / Memory UI toi thieu - done
- Sprint 16: Daily-use hardening / E2E regression pack - done

### Capability Target (Phase 1)

- Internal Agent IDE can be used daily by the builder/user.
- This phase does not claim ABW-governed Cognitive OS.
- This phase does not claim VS Code parity.
- This phase does not claim Cursor parity.

### Capability Warning

- Sprint 9 through Sprint 16 are complete in the Phase 1 daily-use track.
- Sprint 16 is the hardening/regression/readiness gate sprint, not a normal feature sprint.
- Sprint 17 must not start until Phase 1 Gate Review decides readiness direction.


### Phase 1 Daily-use Track Status

- Sprint 9 Browser E2E Smoke Harness complete.
- Sprint 10 Settings / Provider Manager / API Key UI complete.
- Sprint 11 Inline Edit kieu Cursor complete.
- Sprint 12 Task Timeline + Recovery / Resume complete.
- Sprint 13 Git / SCM Panel tot hon complete.
- Sprint 14 Security Permission Model co ban complete.
- Sprint 15 Project Rules / Memory UI toi thieu complete.
- Sprint 16 Daily-use hardening / E2E regression pack complete.

### Current Readiness Verdict

- INTERNAL_DAILY_USE_CANDIDATE.
- Candidate only, not production readiness.
- Not Cognitive OS and not VS Code parity.

### Sprint 13 Capability Note

- SCM panel exists in the NVIDIA workbench.
- Git read APIs exist (`/api/git/status`, `/api/git/log`, `/api/git/diff`).
- Guarded stage/unstage/discard APIs exist with mutation controls.
- Commit draft is template-only.
- No git commit/push product flow exists.
- This is not VS Code SCM parity.
- ABW bridge remains planned and not implemented.


### Sprint 14 Capability Note

- Basic centralized permission model exists.
- Permission APIs exist (/api/permissions, /api/permissions/check, /api/security/summary, /api/security/audit_log).
- Security/Permissions UI exists in Settings.
- Permission audit log exists under ignored runtime state (.nvidia-agent/security).
- Endpoint guards are centralized/improved across mutation routes.
- Reserved actions deny/fail closed (abw.bridge.reserved, git.commit, git.push).
- This is not enterprise-grade security and not full sandboxing.
- ABW bridge remains planned and not implemented.

### Sprint 15 Capability Note

- Project Rules / Memory UI exists in Settings.
- Rules persist under ignored runtime state (`.nvidia-agent/rules/project-rules.json`).
- Project rules APIs exist.
- `@rules` context exists and is bounded.
- Enabled rules/memory are included; disabled rules/memory are excluded from context.
- Secret-like content is rejected.
- No automatic self-learning.
- Not a self-growing wiki.
- Not ABW governance/proof.
- ABW bridge remains planned and not implemented.

### Sprint 16 Gate Note

- Sprint 16 is a major hardening/regression/readiness evaluation gate, not a normal feature sprint.
- Sprint 16 shipped expanded real-browser smoke regression coverage.
- Sprint 16 shipped API regression pack coverage.
- Sprint 16 shipped permission/guard matrix checks.
- Sprint 16 shipped selected real endpoint mutation guard checks.
- Sprint 16 shipped daily-use readiness reports under ignored runtime state.
- Sprint 16 verdict is INTERNAL_DAILY_USE_CANDIDATE, not production-ready.

### Gate Warning Before Sprint 17

- Sprint 17 must not start until Phase 1 Gate Review chooses one of:
  - proceed to Phase 2 / Sprint 17
  - insert cleanup sprint
  - insert bugfix sprint
  - downgrade readiness

### Required Audit Gate (Phase 1)

- Sprint 9: Browser smoke baseline gate (real-browser pass required, not full E2E proof)
- Sprint 16: Full daily-use readiness audit

### Sprint 16 Decision Outcomes

- PASS: internal daily-use candidate
- PARTIAL: continue hardening
- FAIL: schedule cleanup or rework sprint

## 4. Phase 2 - Cursor / Antigravity-like Agent IDE

Sprint range: Sprint 17-28

### Sprint List (Phase 2)

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

### Capability Target (Phase 2)

- Internal Agent IDE becomes closer to Cursor or Antigravity.
- Task planning, edits, provider routing, recovery, and approvals become stronger.
- This phase still does not claim VS Code platform parity.

### Required Audit Gate (Phase 2)

- Sprint 20: provider or routing audit
- Sprint 24: recovery or resume audit
- Sprint 28: Cursor-like UX capability review

## 5. Phase 3 - ABW-Governed Internal Cognitive Workspace

Sprint range: Sprint 29-40

### Sprint List (Phase 3)

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

### Capability Target (Phase 3)

- Agent IDE plus ABW becomes useful for technical chatbot, SOP, internal translation, fault investigation, and report generation.
- ABW helps weak agents reduce hallucination, overclaiming, and unsupported answers.
- Evidence, gaps, sources, and audit trails become visible.

### Important Milestones

- Sprint 32: technical chatbot pilot begins
- Sprint 33: translation or report workspace begins
- Sprint 34: fault investigation workspace begins
- Sprint 36: evidence or audit visibility gate
- Sprint 40: Cognitive OS internal pilot gate

### Required Audit Gate (Phase 3)

- Sprint 30: ABW bridge contract audit
- Sprint 36: Evidence or Audit trust audit
- Sprint 40: Cognitive OS internal pilot audit

## 6. Phase 4 - Governed Knowledge Ingestion / Self-Growing Wiki v1

Sprint range: Sprint 41-52

### Sprint List (Phase 4)

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

### Capability Target (Phase 4)

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

### Required Audit Gate (Phase 4)

- Sprint 44: governed ingest readiness audit
- Sprint 49: verification gate audit
- Sprint 52: self-growth safety audit

## 7. Phase 5 - Self-Improving Agent IDE / Controlled Tool Generation

Sprint range: Sprint 53-60

### Sprint List (Phase 5)

- Sprint 53: Agent IDE Self-Improvement Loop
- Sprint 54: Safe Code Change Proposal
- Sprint 55: Auto-Test / Auto-Audit Before Apply
- Sprint 56: Self-Patch Review Queue
- Sprint 57: Plugin / Skill Self-Update Workflow
- Sprint 58: Knowledge-to-Code Generation Guard
- Sprint 59: Regression + Rollback Automation
- Sprint 60: Self-Improving Platform Beta

### Capability Target (Phase 5)

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

### Required Audit Gate (Phase 5)

- Sprint 55: auto-test or auto-audit gate
- Sprint 60: self-improving platform beta audit

## 8. Phase 6 - Enterprise Cognitive OS Runtime

Sprint range: Sprint 61-80

### Sprint List (Phase 6)

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

### Capability Target (Phase 6)

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

### Required Audit Gate (Phase 6)

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
| --- | --- | --- | --- | --- |
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
| --- | --- | --- | --- | --- |
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

## 2026-05-03 Update - NVIDIA File Edit/Apply Workflow Proof Completed

- NVIDIA File Edit/Apply Workflow Proof is completed and pushed.
- NVIDIA commit: `3f46cd0cd12de749d529a5df864e50711d600c42`.
- NVIDIA files changed:
  - `nvidia_playground.html`
  - `tools/browser-smoke.mjs`
  - `tools/agent-capability-harness.mjs`
- Validation recorded:
  - `npm run browser:smoke -- --start-server --port 3456` PASS `104/0`
  - guard matrix PASS `16/16`
  - div balance `open=330 close=330`
  - `npm run agent:audit` PASS `25/25`
  - `npm run bridge:preflight:test` PASS `38/38`
  - `npm run bridge:preflight:e2e` PASS `22/22`
- Proven scope:
  - file edit/apply workflow visibility improved
  - file/proposal/diff/review/apply/task/log markers are more discoverable
  - workflow wording is more honest
  - apply path remains guarded
  - smoke/usability checks prove markers are visible/testable
  - guard matrix remains meaningful
  - bridge regressions remain passing
- Limitations remain:
  - daily-use readiness not proven
  - Vietnamese localization incomplete
  - full Agent IDE UX not proven
  - inline-edit widget still not observable in current smoke path
- Boundary remains:
  - no bridge UI
  - no write-back expansion
  - no sync
  - no auto-promote
  - no ABW mutation
- Next scope requires explicit gate review / next-scope planning.

## 2026-05-03 Update - Next Scope: NVIDIA UI Monolith Decomposition

- Latest next-scope gate verdict: `A. PROCEED_TO_NVIDIA_UI_MONOLITH_DECOMPOSITION`.
- NVIDIA Inline-Edit Visibility Proof is completed and recorded.
- `nvidia_playground.html` remains large/monolithic at about `298,383` bytes / `6,053` lines.
- Next sprint scope is narrow and NVIDIA-only: tiny staged decomposition / structure hardening only, not feature expansion.
- Expected focus is `nvidia_playground.html` plus directly related smoke/structure checks.
- Daily-use readiness remains unproven.
- Bridge UI, packaging, write-back expansion, sync, and auto-promote remain forbidden unless a later gate explicitly authorizes them.

## 2026-05-03 Update - NVIDIA UI Structure Guardrails Completed

- NVIDIA UI Structure Guardrails are completed and pushed.
- NVIDIA commit: `b5b6b9c06ada2dc499fc8d0b1f5e29885bd43405`.
- NVIDIA files changed:
  - `nvidia_playground.html`
  - `tools/browser-smoke.mjs`
- Validation recorded:
  - `npm run browser:smoke -- --start-server --port 3456` PASS `109/0`
  - warnings `[]`
  - div balance `open=330 close=330`
  - new checks pass:
    - `Critical UI shell roots exist`
    - `Critical editor workflow roots exist`
    - `Critical bottom-panel roots exist`
  - `npm run agent:audit` PASS `25/25`
  - `npm run bridge:preflight:test` PASS `38/38`
  - `npm run bridge:preflight:e2e` PASS `22/22`
- Proven scope:
  - critical UI root sections now have explicit smoke protection
  - structure guardrails were added without moving major DOM sections
  - no new feature was added
  - no bridge UI/write-back expansion/sync/auto-promote was added
  - bridge regressions remain passing
- Limitations remain:
  - physical monolith size is not reduced
  - UI monolith still exists
  - real file write/create remains unproven and has direct negative manual-use evidence
  - daily-use readiness remains unproven
  - Vietnamese localization remains incomplete
- Next action:
  - run separate gate for NVIDIA Real File Write/Create Flow Failure

## 2026-05-03 Update - Next Scope: NVIDIA Real File Write/Create Repair

- Latest next-scope gate verdict: `A. PROCEED_TO_NVIDIA_REAL_FILE_WRITE_CREATE_REPAIR`.
- NVIDIA UI Structure Guardrails are completed and recorded.
- Real file write/create remains unproven and has direct negative user evidence from manual use.
- Next sprint scope is NVIDIA-only and must focus on guarded real file write/create repair in the autonomous agent flow.
- Required proof must cover:
  - user request -> `write_file`
  - workspace file or pending edit exists
  - blocked outside-workspace path
  - preserved trust/approval/workspace-boundary protections
- Daily-use readiness remains blocked.
- Bridge UI, packaging, sync, auto-promote, and ABW mutation remain forbidden unless a later gate explicitly authorizes them.

## 2026-05-03 Update - NVIDIA Inline-Edit Visibility Proof Completed

- NVIDIA Inline-Edit Visibility Proof is completed and pushed.
- NVIDIA commit: `05dcb6c59d98675e01c200c5a78e86ec5640d185`.
- NVIDIA files changed:
  - `nvidia_playground.html`
  - `tools/browser-smoke.mjs`
- Validation recorded:
  - `npm run browser:smoke -- --start-server --port 3456` PASS `106/0`
  - warnings `[]`
  - inline-edit action/widget checks pass
  - guard matrix PASS `16/16`
  - div balance `open=330 close=330`
  - `npm run agent:audit` PASS `25/25`
  - `npm run bridge:preflight:test` PASS `38/38`
  - `npm run bridge:preflight:e2e` PASS `22/22`
- Proven scope:
  - two remaining inline-edit smoke warnings are removed
  - inline-edit action is observable through real Monaco action state
  - inline-edit widget is observable through real visible UI state
  - smoke checks remain meaningful and non-fake
  - no silent write path added
  - no approval/trust bypass added
  - bridge regressions remain passing
- Limitations remain:
  - daily-use readiness not proven
  - Vietnamese localization incomplete
  - full Agent IDE UX not proven
  - `nvidia_playground.html` remains large/monolithic
  - `window.editor` exposure is broader than ideal (accepted for current smoke-proof scope)
- Boundary remains:
  - no bridge UI
  - no write-back expansion
  - no sync
  - no auto-promote
  - no ABW mutation
- Next scope requires explicit gate review / next-scope planning.

## 2026-05-04 Update - NVIDIA Real File Write/Create Repair Completed

- NVIDIA Real File Write/Create Repair is completed and pushed.
- NVIDIA commit: `9e14a2d26f049cb81a3af3dffc941b598bb1aeea`.
- Validation recorded:
  - `npm run write:create:proof` PASS `19/0`
  - `npm run browser:smoke -- --start-server --port 3456` PASS `109/0`
  - warnings `[]`
  - div balance `330/330`
  - guard matrix `16/16`
  - `npm run agent:audit` PASS `25/25`
  - `npm run bridge:preflight:test` PASS `38/38`
  - `npm run bridge:preflight:e2e` PASS `22/22`
- Semantics confirmed:
  - `write_file` creates a pending edit proposal
  - `apply_pending_edit` writes the reviewed edit to disk after review/apply
- What was proven:
  - safe explicit create-file intent now reaches `write_file`
  - a pending edit artifact is created inside the workspace
  - outside-workspace, no-approval, and untrusted paths remain blocked
- Limitations remain:
  - automatic disk write without apply is not proven
  - daily-use readiness is not proven
  - full Agent IDE UX is not proven
- Next action:
  - run gate review / next-scope planning

## 2026-05-04 Update - NVIDIA Apply Pending Edit To Disk Proof Selected

- Latest next-scope verdict: `A. PROCEED_TO_NVIDIA_APPLY_PENDING_EDIT_TO_DISK_PROOF`.
- NVIDIA Real File Write/Create Repair is complete.
- Proven so far:
  - `write_file -> pending edit` is proven for safe explicit create-file intent
  - outside-workspace, no-approval, and untrusted write paths remain blocked
- Remaining gap:
  - `pending edit -> apply_pending_edit -> file exists on disk` is not yet proven
- Next work focus:
  - reviewed apply-to-disk proof for the guarded pending edit path
- Readiness status:
  - daily-use readiness remains blocked
- Boundary remains:
  - no bridge UI
  - no packaging
  - no sync
  - no auto-promote
  - no ABW mutation

## 2026-05-04 Update - NVIDIA Apply Pending Edit To Disk Proof Completed

- Completed and recorded NVIDIA Apply Pending Edit To Disk Proof in the NVIDIA repo.
- NVIDIA commit: `ae2b26649d97d62e08dc3e25e851d468ed05f23f`
- Validation:
  - `apply:proof` PASS `30/0`
  - `write:create:proof` PASS `19/0`
  - `browser:smoke` PASS `109/0`
  - `agent:audit` PASS `25/25`
  - `bridge:preflight:test` PASS `38/38`
  - `bridge:preflight:e2e` PASS `22/22`
- Proven:
  - `write_file -> pending edit -> apply_pending_edit -> file exists on disk`
- Limitations:
  - full manual UI E2E is still not proven
  - daily-use readiness is still not proven
- Next action:
  - run gate review / next-scope planning
## 2026-05-04 Update - NVIDIA Full Manual Create/Apply E2E Proof Completed

- NVIDIA Full Manual Create/Apply E2E Proof is completed and pushed.
- NVIDIA commit: `68efc6b8437ce5d518b7ad6d4b49469b78271de6`.
- NVIDIA files changed:
  - `package.json`
  - `tools/browser-smoke.mjs`
  - `tests/manual-ui-create-apply-e2e.test.mjs`
- Validation recorded:
  - `manual:proof` PASS `22/0`
  - `apply:proof` PASS `30/0`
  - `write:create:proof` PASS `19/0`
  - `browser:smoke` PASS `109/0`
  - readiness `HARDENING_BASELINE_PASS_NOT_DAILY_USE_READY`
  - guard matrix PASS `16/16`
  - `agent:audit` PASS `25/25`
  - `bridge:preflight:test` PASS `38/38`
  - `bridge:preflight:e2e` PASS `22/22`
  - encoding/mojibake clean
- What is proven:
  - `user prompt -> pending edit visible -> Review + Apply -> file exists on disk -> content verified`
  - target path is visible in UI
  - cleanup is verified
  - UI/status wording remains honest
- Limitations:
  - this is fixture-backed browser/UI E2E using `NVIDIA_TEST_CHAT_FIXTURE`
  - this does not prove live provider-quality create/apply
  - this does not prove daily-use readiness
  - full Vietnamese localization and full Agent IDE UX remain unproven
  - full bridge is not implemented
- Next action:
  - run gate review / next-scope planning

## 2026-05-04 Update - Next Scope Selected: NVIDIA Daily-Use Readiness Audit

- Latest next-scope gate verdict: `B. PROCEED_TO_NVIDIA_DAILY_USE_READINESS_AUDIT`.
- NVIDIA Full Manual Create/Apply E2E Proof is complete.
- Proven so far:
  - fixture-backed browser/UI create/apply path is proven
  - `user prompt -> pending edit visible -> Review + Apply -> file exists on disk -> content verified`
- Remaining gap:
  - live provider-quality create/apply remains unproven
- Readiness status:
  - daily-use readiness is not yet claimed
- Next work focus:
  - a NVIDIA-only readiness audit that returns `PASS`, `PARTIAL`, or `FAIL`
  - if `PASS` is not justified, the audit must identify the next blocker and exact next sprint
- Boundary remains:
  - no bridge UI
  - no packaging
  - no sync
  - no auto-promote
  - no ABW mutation

## 2026-05-04 Update - NVIDIA Daily-Use Readiness Audit Result

- Readiness verdict: `PARTIAL`.
- Latest next-scope gate verdict: `A. LIVE_PROVIDER_CREATE_APPLY_PROOF`.
- NVIDIA has strong bounded workflow evidence, but it is not daily-use ready yet.
- Proven so far:
  - fixture-backed manual UI create/apply E2E is proven
  - guarded file workflow, smoke coverage, trust boundaries, and bridge preflight tests are strong
- Next blocker:
  - live provider-quality create/apply remains unproven
- Readiness wording:
  - must remain `HARDENING_BASELINE_PASS_NOT_DAILY_USE_READY` until a future audit justifies an upgrade
- Boundary remains:
  - no bridge UI
  - no packaging
  - no sync
  - no auto-promote
  - no ABW mutation

## 2026-05-04 Update - NVIDIA Live Provider Create/Apply Proof Harness Completed

- NVIDIA Live Provider Create/Apply Proof harness is completed and pushed.
- The harness is honest and blocks explicitly when provider env is unavailable.
- Current environment result is:
  - `LIVE_PROVIDER_CREATE_APPLY_BLOCKED_PROVIDER_UNAVAILABLE`
- This does not prove live provider-quality create/apply `PASS`.
- Daily-use readiness remains not `PASS`.
- Packaging remains blocked.
- Bridge UI, sync, and auto-promote remain blocked.
- Next step is gate review / next-scope planning.

## 2026-05-04 Update - NVIDIA Vietnamese Create-File Routing Fix Completed

- NVIDIA Vietnamese create-file routing fix is completed and pushed.
- NVIDIA commit: `aada52c61286a61b6766d96f181d1d38fb39d46f`.
- User-observed chatbot-only fallback for a Vietnamese create-file prompt is addressed.
- Exact prompt covered:
  - `viết cho tôi chương trình tính tổng 2 số A+B và đóng gói nó thành một file`
- The prompt now maps to `proof/sum_ab.py` through the guarded pending-edit flow.
- Manual UI evidence confirms:
  - pending edit is created before disk write
  - `Review + Apply` writes the file to disk
  - content includes `def sum_ab(a, b):` and `return a + b`
- Validation recorded:
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
- Manual UI create-file path now has stronger evidence, but daily-use readiness remains not `PASS`.
- Packaging remains blocked.
- Bridge UI, sync, and auto-promote remain blocked.
- NVIDIA has untracked out-of-scope `test.txt`; it was not committed.
- Next step is gate review / next-scope planning.

## 2026-05-04 Update - NVIDIA Manual Approval Flow Fix Completed

- NVIDIA manual approval flow for `write_file` is completed and pushed.
- NVIDIA commit: `68658ad38ba064bc91e7447ba36378cf3beecc9d`.
- Auto-Accept OFF no longer falls into misleading chatbot fallback for `write_file` approval.
- Approval now creates pending edit only; Review + Apply remains required for disk write.
- Manual create-file workflow is stronger.
- Edit/delete/move/multi-file workflows remain unproven.
- Daily-use readiness remains not `PASS`.
- Packaging remains blocked.
- Bridge UI/sync/auto-promote remain blocked.
- Next step is gate review / next-scope planning.

## 2026-05-04 Update - Gate Selects Existing File Edit Workflow Proof

- Latest gate verdict:
  - `A. PROCEED_TO_EXISTING_FILE_EDIT_WORKFLOW_PROOF`
- Create-file + manual approval flow is accepted and stronger, but still not enough for daily-use readiness.
- Existing-file edit is now the next core Agent IDE blocker.
- Delete/move/multi-file workflows remain later scopes.
- Readiness remains `HARDENING_BASELINE_PASS_NOT_DAILY_USE_READY`.
- Packaging remains blocked.
- Bridge expansion remains blocked (`bridge UI`, `sync`, `auto-promote`).

## 2026-05-04 Update - NVIDIA Existing File Edit Workflow Proof Completed

- NVIDIA Existing File Edit Workflow Proof is completed and pushed.
- NVIDIA commit: `04479301bf0b4f3d3e4a08de1d22b5eba2193558`.
- Existing-file edit is now proven in bounded workflow:
  - fixture exists -> pending edit -> file unchanged before apply -> Review + Apply -> disk content verified -> cleanup/restore.
- Create-file and existing-file edit workflows are now stronger.
- Delete, move/rename, and multi-file edit remain unproven.
- Daily-use readiness remains `HARDENING_BASELINE_PASS_NOT_DAILY_USE_READY`.
- Packaging remains blocked.
- Bridge UI/sync/auto-promote remain blocked.
- Next step is gate review / next-scope planning.

## 2026-05-04 Update - Gate Selects Delete File Safety Proof

- Latest gate verdict:
  - `A. PROCEED_TO_DELETE_FILE_SAFETY_PROOF`
- Create-file and existing-file edit are accepted as bounded workflow proofs.
- Delete safety is now the next highest-risk missing file operation.
- Delete must be proven before move/rename and multi-file mutation.
- Readiness remains `HARDENING_BASELINE_PASS_NOT_DAILY_USE_READY`.
- Packaging remains blocked.
- Bridge expansion remains blocked (`bridge UI`, `sync`, `auto-promote`).

## 2026-05-04 Update - NVIDIA Delete File Safety Proof Completed

- NVIDIA Delete File Safety Proof is completed and pushed.
- Delete workflow is proven in bounded workflow:
  - fixture exists -> pending delete/approval state -> no deletion before apply -> approved delete -> disk absence verified -> cleanup/restore.
- Create-file, existing-file edit, and delete-file safety workflows are now stronger.
- Move/rename and multi-file edit remain unproven.
- Daily-use readiness remains `HARDENING_BASELINE_PASS_NOT_DAILY_USE_READY`.
- Packaging remains blocked.
- Bridge UI/sync/auto-promote remain blocked.
- Next step is gate review / next-scope planning.
