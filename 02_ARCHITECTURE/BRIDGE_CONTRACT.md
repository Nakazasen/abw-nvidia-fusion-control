# ABW x NVIDIA Bridge Contract

Status: `v0.1 draft`

Purpose: define the minimum implementable contract between the NVIDIA Agent Runtime and the ABW Governance Engine without merging source trees and without claiming integration before it exists.

## Current Reality

- ABW observed baseline: `v1.1.0`
- NVIDIA observed baseline: Sprint 1 Composer/Diff UX complete, Sprint 2 Context Picker next
- Bridge implementation status: not implemented
- Integration order: CLI first, API second

## Scope

This contract covers the first executable bridge boundary for:

- health checks
- route-query
- ask
- governance status mapping into NVIDIA UI
- stop conditions
- trust score and retrieval status handling
- sources, warnings, and gaps handling
- future binding between pending diffs and ABW continuation step ids

This contract does not implement the bridge and does not authorize source merging.

## Non-Negotiable Rules

- NVIDIA remains the product shell and active agent runtime.
- ABW remains the canonical governance engine.
- The bridge must not bypass Continuation Kernel for governed write/action flows.
- The bridge must not claim `grounded` or equivalent success when ABW returns draft, pending, disputed, stale, missing, blocked, or approval-required states.
- The bridge must preserve repo boundaries:
  - NVIDIA code stays in `D:\Sandbox\Nvidia`
  - ABW code stays in `D:\Sandbox\skill-Anti-brain-wiki_note`
- The control repo may define contracts and status only.
- Phase 1 uses CLI invocation.
- Phase 2 may add FastAPI/local API only after CLI behavior is stable and contract fields are proven useful.

## Phase 1 Transport

Preferred commands:

```powershell
abw version
abw doctor
abw ask "<prompt>"
```

Source-local fallback:

```powershell
cd D:\Sandbox\skill-Anti-brain-wiki_note
.\abw.bat version
.\abw.bat doctor
.\abw.bat ask "<prompt>"
```

NVIDIA should treat ABW as an external governed subsystem invoked by command and parsed by stable output fields.

## Health Contract

### Intent

NVIDIA needs a minimal read-only way to know whether ABW is present, healthy enough to route work, and attached to a recognizable workspace.

### Minimum command

- `abw doctor`
- `abw version`

### Minimum normalized health result

```json
{
  "bridge_ok": true,
  "abw_present": true,
  "abw_version": "1.1.0",
  "workspace_detected": true,
  "workspace_confidence": "high",
  "doctor_state": "ok",
  "warnings": [],
  "blocking_reasons": []
}
```

### Field meanings

- `bridge_ok`: NVIDIA could run and parse the ABW command
- `abw_present`: ABW runtime exists and responds
- `abw_version`: observed runtime version string
- `workspace_detected`: ABW recognized a workspace target
- `workspace_confidence`: one of `high`, `medium`, `low`, `none`
- `doctor_state`: one of `ok`, `degraded`, `blocked`, `unknown`
- `warnings`: non-fatal warnings safe to show in UI
- `blocking_reasons`: fatal reasons that prevent governed flows

### Health failure behavior

If health cannot be proven:

- NVIDIA may continue normal non-ABW IDE workflows only when the user is not invoking ABW-governed behavior.
- NVIDIA must not present ABW-governed status as active.
- NVIDIA must not label any enterprise answer as grounded through ABW.

## Route-Query Contract

### Intent

NVIDIA needs to ask ABW how a request should be classified before deciding whether it is a simple query, a gap case, a grounded answer, or a governed continuation/write flow.

### Expected ABW responsibility

ABW should expose or imply route semantics equivalent to:

- query lane
- grounded wiki lane
- gap lane
- bootstrap or greenfield lane
- governed continuation lane
- blocked or approval-required lane

### Minimum normalized route result

```json
{
  "route": "query",
  "lane": "wiki",
  "requires_grounding": true,
  "requires_continuation_gate": false,
  "approval_required": false,
  "warnings": [],
  "gaps": []
}
```

### Reserved route values

- `query`
- `wiki`
- `gaps`
- `bootstrap`
- `continuation`
- `blocked`
- `decision`

These concepts should later align with future NVIDIA context mentions:

- `@abw`
- `@wiki`
- `@gaps`
- `@route`
- `@decision`

## Ask Contract

### Intent

`ask` is the first practical bridge call because it already covers routing, grounded response behavior, and missing-evidence behavior.

### Minimum normalized ask result

```json
{
  "ok": true,
  "status": "grounded",
  "answer": "string",
  "trust_score": 0.92,
  "retrieval_status": "grounded_match",
  "sources": [
    {
      "path": "wiki/example.md",
      "confidence": 0.91
    }
  ],
  "warnings": [],
  "gaps": [],
  "route": "wiki",
  "step_id": null,
  "approval_required": false,
  "stop": false,
  "stop_reasons": []
}
```

### Field meanings

- `status`: user-visible governance status
- `answer`: rendered ABW answer or summary
- `trust_score`: normalized confidence or trust signal from ABW when available
- `retrieval_status`: retrieval outcome such as `grounded_match`, `fuzzy_match`, `no_match`, `insufficient_sources`
- `sources`: evidence list safe to display in NVIDIA UI
- `warnings`: advisory caveats that do not force stop
- `gaps`: missing knowledge or suggested next evidence targets
- `route`: normalized route category
- `step_id`: reserved for future continuation/write flows
- `approval_required`: governance gate requires user approval
- `stop`: ABW says execution must not continue
- `stop_reasons`: blocking reasons that NVIDIA must surface

### Ask result expectations

- If ABW has evidence, NVIDIA should show the answer with sources and status.
- If ABW has only partial evidence, NVIDIA should show bounded status plus warnings.
- If ABW has no adequate evidence, NVIDIA should show missing or gap state rather than fabricating confidence.
- If ABW indicates continuation or governed action, NVIDIA should not auto-convert that answer into direct writes without a later continuation-step contract.

## Governance Status Mapping To NVIDIA UI

NVIDIA should reserve stable UI states for these ABW outcomes:

| ABW status | NVIDIA UI meaning | Execution policy |
|---|---|---|
| `grounded` | Evidence-backed answer | Safe to display as grounded |
| `draft` | Provisional answer | Display as non-final, no grounded badge |
| `pending_grounding` | Evidence needed or grounding incomplete | Display caution, do not claim verified |
| `disputed` | Contradictory evidence or unresolved conflict | Show conflict state |
| `stale` | Evidence may be outdated | Show stale warning |
| `missing` | No sufficient evidence | Show gap or missing state |
| `blocked` | Governance hard stop | Do not continue governed action |
| `approval_required` | Human approval needed | Hold action pending approval |

Auxiliary signals:

- `trust_score` -> confidence meter or badge, never replacing status
- `retrieval_status` -> retrieval detail line or info panel
- `sources` -> citation or evidence panel
- `warnings` -> caution banner or expandable details
- `gaps` -> next-evidence suggestions or missing-knowledge panel

## Stop Conditions

NVIDIA must stop governed execution when ABW reports or implies any of the following:

- knowledge gap is blocking
- unsafe zone hard block
- locked decision override without approval
- rollback contract missing or unsafe
- explicit `approval_required`
- workspace confidence is `none` or too weak for the requested action
- grounding backend unavailable for a request that requires grounded output
- disputed evidence on a write-critical action
- missing required sources for an enterprise answer that is about to be shown as verified

When stop conditions are present:

- do not write files through an ABW-governed flow
- do not show success state
- show the stop reason clearly
- offer the next safe action if ABW provides one

## Trust Score And Retrieval Status Handling

### Trust score

- NVIDIA should display `trust_score` only as a supporting signal.
- `trust_score` must never override a blocking or non-grounded status.
- If `trust_score` is absent, NVIDIA should not invent one.

### Retrieval status

Reserved values currently observed or expected:

- `grounded_match`
- `fuzzy_match`
- `no_match`
- `insufficient_sources`
- `unknown`

Retrieval status is diagnostic and explanatory. It should help the user understand why ABW is confident, partial, or missing evidence.

## Sources, Warnings, And Gaps Handling

### Sources

- Preserve source path and confidence when ABW provides them.
- Sources should be visible in UI for grounded or partially grounded answers.
- NVIDIA should not rewrite away weak or partial sourcing.

### Warnings

- Warnings are advisory unless promoted into stop reasons.
- Warnings must remain attached to the answer or governed action record.
- Warning examples:
  - possible stale evidence
  - heuristic suspicion
  - bounded partial answer
  - optional evidence missing

### Gaps

- Gaps should be first-class UI output, not buried in plain text.
- Gap objects may later drive context picker affordances, ingest actions, or next-step prompts.
- NVIDIA should prepare for gap display even before interactive gap resolution exists.

## Pending Diff To ABW Step Id Future Contract

This is not implemented yet, but the contract boundary should be reserved now.

Future governed write flow:

1. NVIDIA sends intent to ABW.
2. ABW selects or approves a continuation step.
3. ABW returns `step_id`.
4. NVIDIA creates pending diffs under that `step_id`.
5. User reviews diffs and tests.
6. NVIDIA reports the result back to ABW.
7. ABW records the outcome into `.brain/step_history.jsonl`.

Reserved future fields:

```json
{
  "step_id": "abw-step-123",
  "pending_diff_id": "nvidia-diff-456",
  "rollback_contract": "required",
  "execution_outcome": "pending"
}
```

## CLI First, API Second

Implementation order is fixed for now:

1. CLI bridge for `version`, `doctor`, and `ask`
2. Stable normalization layer in NVIDIA
3. UI status mapping and stop semantics
4. Only then consider FastAPI or local API for realtime or richer structured transport

Reasons:

- the ABW repo already exposes a usable CLI path
- the bridge is not yet proven valuable enough to justify a deeper transport layer
- CLI-first reduces architecture risk while the status contract is still evolving

## Known Open Issues

- Exact JSON output shape from `abw ask` is not yet locked in this control repo.
- Exit-code semantics are not yet formally specified.
- Continuation-step execution contract is future work.
- No verified new ABW HMAC or equivalent security-audit evidence was observed in this pass.
- ABW docs and workflows still show encoding risk in parts of the repo.
- NVIDIA `npm run agent:audit` is not end-to-end bridge proof.

## Definition Of Ready For Bridge Coding

Bridge coding may start only when:

- this contract is accepted as the minimum status boundary
- NVIDIA-side normalization rules are agreed
- stop conditions are agreed
- ABW output fields required for health and ask are explicitly chosen
- the implementation is still scoped as CLI-first
