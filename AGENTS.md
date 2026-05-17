# AGENTS.md - ABW NVIDIA Fusion Control

## Repo purpose

This repo is the governance/control repo for:

Cognitive OS for Enterprise (ABW_NVIDIA IDE)

It coordinates:
- ABW repo
- NVIDIA repo
- cross-repo governance
- audit trail
- handoff state
- readiness boundaries
- source-of-truth decisions

It is not the primary implementation repo.

## Exact repo paths

Control:
D:\Sandbox\ABW_NVIDIA_FUSION_CONTROL

NVIDIA:
D:\Sandbox\Nvidia

ABW:
D:\Sandbox\skill-Anti-brain-wiki_note

## Source-of-truth governance files

The core governance files are:
- 05_DECISIONS/ROADMAP.md
- 05_DECISIONS/DECISIONS.md
- 05_DECISIONS/RISKS.md
- 03_OPERATIONS/HANDOFF.md
- 07_HISTORY/INTEGRATION_JOURNAL.md

These files must remain consistent with each other.

## Current governance posture

Current accepted readiness label:
BOUNDED_DAILY_USE_CANDIDATE_LOCAL_FILE_WORKFLOWS

Forbidden claims unless explicitly promoted by governance:
- DAILY_USE_READY
- production-ready
- full bridge ready
- Cognitive OS achieved
- enterprise-grade security
- packaging-ready
- VS Code parity
- Cursor parity

## Current accepted NVIDIA state

Latest accepted NVIDIA implementation commit:
207a30bce6bc3a9f9171dd236df789fa6ec10ca8

Latest accepted Control governance commit:
a12485f3d380d3d1c8c8ae6a66976f6f2075c47c

Latest accepted manual result:
MANUAL_PATH_REVALIDATION_V3_PASS

Previous blocker:
MANUAL_PATH_REVALIDATION_V3_FAIL

Current interpretation:
The previous NVIDIA real UI/manual path blocker is closed for the deterministic local file-workflow path.
This does not promote the project to DAILY_USE_READY.

## Working rules

Never:
- fake success
- silently mutate files
- bypass Review + Apply
- bypass workspace trust
- auto-reset dirty work
- silently discard user work
- overclaim readiness
- mutate ABW without explicit governance scope
- open bridge/sync/packaging work without explicit governance approval

Always:
- preserve audit trail
- record honest failure
- prefer regression/audit before feature expansion
- verify repo path before mutation
- verify git status before commit
- keep Control/NVIDIA/ABW boundaries explicit

## Role workflow

Architect:
- defines scope
- preserves boundaries
- writes builder/auditor prompts
- does not overclaim evidence

Builder:
- implements minimal scoped change
- runs targeted tests
- records exact pass/fail evidence
- does not mutate outside scope

Auditor:
- verifies claims against code, tests, and governance
- looks for overclaims, missing evidence, and boundary violations
- recommends commit only if evidence is sufficient

Governance Recorder:
- updates 05_DECISIONS/ROADMAP.md, 05_DECISIONS/DECISIONS.md, 05_DECISIONS/RISKS.md, 03_OPERATIONS/HANDOFF.md, and 07_HISTORY/INTEGRATION_JOURNAL.md
- preserves not-proven lists
- does not promote readiness without explicit decision

## Session recovery order

When resuming:
1. Verify exact repo path.
2. Run git status --short.
3. Check current HEAD.
4. Compare against latest governance state.
5. Read 03_OPERATIONS/HANDOFF.md first.
6. Read 05_DECISIONS/DECISIONS.md and 05_DECISIONS/RISKS.md next.
7. Only then inspect implementation repos.

## Dirty work policy

Do not reset or clean dirty work by default.

If sync is blocked:
- use named stash only with user approval
- do not pop stash automatically
- audit stash before selective recovery

## Vietnamese text policy

Readable Vietnamese is intentional.

Do not classify readable Vietnamese as mojibake.

Only classify broken encodings when they match the mojibake markers listed in the operator prompt for this rewrite.

## Latest sync note

The home machine has synced:
- Control: a12485f3d380d3d1c8c8ae6a66976f6f2075c47c
- NVIDIA: 207a30bce6bc3a9f9171dd236df789fa6ec10ca8
- ABW: fe0520626d8f254476424242e29ea2bef4807f73

Local recovered files must be audited before commit.
