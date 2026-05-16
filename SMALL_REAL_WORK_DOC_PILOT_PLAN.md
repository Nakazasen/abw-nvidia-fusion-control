# SMALL REAL WORK DOC PILOT PLAN (Sanitized, Bounded, Governance-Only)

## 1. Purpose

- Run a small controlled pilot using sanitized/approved work-like documents.
- Collect evidence about practical daily technical/work Q&A usefulness under strict boundaries.
- This plan is evidence-gathering only and is not a readiness upgrade.

## 2. Data Policy

Allowed data:
- sanitized work notes
- non-sensitive internal documents
- approved manuals/specifications
- public documents
- synthetic variants of work documents

Forbidden data:
- secrets
- credentials
- customer private data
- HR/legal/finance sensitive documents
- unsanitized contracts
- production incident data with sensitive details
- confidential supplier/customer names unless explicitly sanitized
- raw private screenshots/logs
- any data disallowed by workplace policy

## 3. Sanitization Checklist

Before pilot use, remove or replace:
- sensitive customer/supplier/person names
- serial numbers
- order numbers
- API keys/tokens/passwords
- sensitive internal IPs/hostnames
- sensitive exact incident timestamps
- contractual terms not explicitly approved
- any private identifiers

## 4. Pilot Document Set (Recommended 5-8 Docs)

- one sanitized technical manual/spec
- one sanitized maintenance/SOP note
- one sanitized troubleshooting note
- one Vietnamese operator note (sanitized)
- one intentionally unsupported dummy file
- one intentionally malformed test file
- one missing-topic case
- optional one public/manual reference

## 5. Pilot Questions

Include all categories:
- factual question with expected source
- procedure question
- troubleshooting question
- Vietnamese question
- missing-source question
- ambiguous question
- weak-source question
- "what document is missing?" gap-style question (if supported)

## 6. Safety Boundaries

Pilot must require:
- read-only ABW bridge path
- `ABW_READ_ONLY_QUERY=1`
- `ABW_REPO_PATH` set to repo-source ABW
- no Apply
- no sync
- no write-back
- no pending edits
- no `execute_command` through bridge path
- explicit trusted workspace
- repo clean state before and after run

## 7. Pass Criteria

Pilot passes only if all are true:
- no query-time `.brain` mutation
- missing-source returns `no_match` / `E0_unknown` / trust `0` / `sources=[]`
- weak evidence is visibly warned or trust-capped
- source/trust/evidence/warnings are visible
- unsupported/parse errors are reported honestly
- `generated_drafts` / `review_required` behavior is visible if fresh ingest is included
- no pending edits, no Apply, no sync, no write-back
- repos remain clean after run
- operator can understand answer/source/warning semantics

## 8. Fail Criteria

Pilot fails if any condition occurs:
- read-only query mutates `.brain`
- no-source question returns sourced success
- weak source is presented as strong evidence
- hidden pending edit/Apply/sync/write-back occurs
- repo becomes dirty unexpectedly
- warning/source/trust signals are hidden
- Vietnamese readability regresses
- sensitive data is accidentally included

## 9. Stop Conditions

Stop immediately if:
- any forbidden data is discovered
- unexpected mutation occurs
- missing-source overclaim occurs
- UI hides warning/source status
- bridge returns opaque failure for classifiable state
- repo dirty state appears unexpectedly

## 10. Evidence Template (Copyable)

```md
# VERDICT

One of:
- SMALL_REAL_WORK_DOC_PILOT_PLAN_READY
- SMALL_REAL_WORK_DOC_PILOT_BLOCKED_DATA_POLICY
- SMALL_REAL_WORK_DOC_PILOT_INCOMPLETE

# SCOPE

- workspace:
- data class:
- sanitized doc list:

# QUESTIONS

- q1:
- q2:
- q3:
- q4:
- q5:
- q6:
- q7:
- q8:

# INGEST RESULT

- ingested:
- skipped:
- unsupported_files:
- parse_errors:
- generated_drafts:
- review_required:
- promotion_performed:
- warnings:

# DIRECT ABW RESULT

- factual:
- procedure:
- troubleshooting:
- Vietnamese:
- missing-source:
- ambiguous:
- weak-source:
- gap-style:

# NVIDIA BRIDGE/UI RESULT

- version:
- doctor:
- ask factual:
- ask procedure:
- ask troubleshooting:
- ask Vietnamese:
- ask missing-source:
- ask ambiguous:
- ask weak-source:

# MUTATION SAFETY

- .brain before:
- .brain after:
- pending edits:
- Apply called:
- sync/write-back called:
- execute_command path:

# REPO CLEAN STATUS

- Control:
- NVIDIA:
- ABW:

# USEFULNESS

- usefulness score (1-5):
- what worked:
- blockers:

# NON-CLAIMS

- not DAILY_USE_READY
- not production-ready
- not full bridge ready
- not broad real-work-doc validation
```

## 11. Rollback / Cleanup Policy

- do not delete evidence until recorded
- no automatic cleanup of pilot workspace without human approval
- sanitize before committing any report
- never commit raw pilot data
- only commit sanitized summary to Control

## 12. Allowed Verdicts

- `SMALL_REAL_WORK_DOC_PILOT_PLAN_READY`
- `SMALL_REAL_WORK_DOC_PILOT_BLOCKED_DATA_POLICY`
- `SMALL_REAL_WORK_DOC_PILOT_INCOMPLETE`

## Planning-Only Boundary

- This sprint is governance/planning only.
- No real data ingest in this sprint.
- No real pilot execution in this sprint.
- No NVIDIA/ABW source mutation in this sprint.
