# Architecture State (Local-First Audit)

Date: 2026-05-17  
Scope source priority: Local repos first, remotes second

## 1. Repo State Snapshot

- Control (`D:\Sandbox\ABW_NVIDIA_FUSION_CONTROL`)
  - HEAD: `0794c8957f35c3f7f6827c641d890d16d3d25372`
  - Working tree: clean
- NVIDIA (`D:\Sandbox\Nvidia`)
  - HEAD: `74d8b7577c5fe923a7ba75b58a9a7acd17bd94a7`
  - Working tree: dirty
  - Local uncommitted delta: 7 files, `1104 insertions`, `183 deletions`
- ABW (`D:\Sandbox\skill-Anti-brain-wiki_note`)
  - HEAD: `39a23a288b3df695f618d72d964bb6fdb66e1714`
  - Working tree: clean

Remote comparison (secondary):
- Control `main`: `0794c8957f35c3f7f6827c641d890d16d3d25372` (matches local HEAD)
- NVIDIA `main`: `74d8b7577c5fe923a7ba75b58a9a7acd17bd94a7` (matches local commit; local has uncommitted sprint state)
- ABW `main`: `39a23a288b3df695f618d72d964bb6fdb66e1714` (matches local HEAD)

## 2. Current Architecture Shape

- Control repo is governance authority and audit trail, not implementation runtime.
- NVIDIA repo is active product shell/runtime with UI/server/tests and bounded ABW bridge endpoints.
- ABW repo is canonical governance/knowledge CLI engine with strict no-hallucination and read-only query safety mechanisms.

## 3. Active Direction Seen in Local Code

- NVIDIA local uncommitted work indicates active non-tech UX maturation:
  - document-assistant focus mode
  - left-sidebar resizing and plan-panel collapse ergonomics
  - trust-first ingest flow and related smoke assertions
  - stronger ABW ingest diagnostics (stdout/stderr preview, ingest debug logging)
  - ABW repo-path auto-resolution fallback in server
- This is incremental UX + safety hardening, not bridge expansion into write-back/sync.

## 4. Safety and Boundary Model

- Boundaries remain explicit:
  - ABW query path: read-only (`ABW_READ_ONLY_QUERY=1` model retained in governance evidence)
  - No automatic write-back/sync via NVIDIA bridge path
  - Trust/workspace gating is mandatory before ingest workflows
- Mutation safety is still a first-class architectural principle, not an afterthought.

## 5. Readiness Interpretation

- Accepted posture remains `BOUNDED_DAILY_USE_CANDIDATE_LOCAL_FILE_WORKFLOWS`.
- Local evidence does not justify `DAILY_USE_READY` or production-grade claims.
- Current architecture supports deterministic bounded local-file workflows with strict non-claims preserved.

