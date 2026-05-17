# Bounded Real User Pilot Checklist

## Ownership

- Owner: Auditor + Governance Recorder
- Role: Canonical pilot protocol template

## SOURCE OF TRUTH

- This file defines procedure and pass/fail criteria.
- Execution evidence belongs in pilot report files.

## DO NOT DUPLICATE

- Do not convert this checklist into an execution report.
- Keep historical run outcomes in append-only report artifacts.

## 1. Pilot Purpose

- This is a bounded user pilot for daily technical/work Q&A behavior.
- The goal is to assess practical usefulness and trust clarity for a limited read-only path.
- This is governance evidence only, not production-readiness evidence.
- This does not mean `DAILY_USE_READY`.

## 2. Allowed Data

Allowed:

- synthetic documents
- public documents
- non-sensitive internal documents
- sanitized work notes
- manuals/specs explicitly approved for local testing

Forbidden:

- secrets
- credentials
- customer private data
- HR/legal/finance sensitive documents
- contracts unless explicitly approved and sanitized
- production incident data containing sensitive details
- any data disallowed by workplace policy

## 3. Pilot Setup

Required before running:

- all 3 repos are clean (`Control`, `NVIDIA`, `ABW`)
- HEADs are recorded:
  - Control: `8debc95268acf9bc90fbf78265230acaeeccb387`
  - NVIDIA: `385f7af85350d6865095021b3ec03c5f5c34b90c`
  - ABW: `de1d8560d3a26000fb113e0acbfe947bd785f721`
- NVIDIA bridge runtime uses `ABW_REPO_PATH`
- bridge ask path uses `ABW_READ_ONLY_QUERY=1`
- workspace path is explicit and trusted
- read-only ABW bridge path only
- no pending-edit Apply action
- no sync
- no write-back
- no auto-apply
- do not bypass Review + Apply and trust boundaries

## 4. Test Document Set (Safe Only)

Prepare 5-10 safe docs, including:

- one technical manual
- one maintenance/SOP note
- one troubleshooting guide
- one intentionally unsupported file (safe dummy content)
- one intentionally malformed file if safe (for parser honesty checks)
- one Vietnamese note if relevant for operator context
- one missing-topic case expected to return no source/no match

## 5. Pilot Questions

Include at least one question for each category:

- direct factual question with expected source citation
- procedure question
- troubleshooting question
- Vietnamese question
- missing-source question
- ambiguous question
- weak-source question
- "what document should I ingest next?" style gap question if supported

## 6. Pass Criteria

Pilot passes only if all are true:

- answers display source/citation info
- no-source questions return `no_match` or explicit gap state
- weak evidence is visibly warned
- trust score/evidence tier is visible
- no pending edits are created
- no Apply is called
- no sync/write-back occurs
- repos remain clean after run
- no query-time workspace mutation occurs in read-only mode
- operator can understand answer/source/warning semantics

## 7. Fail Criteria

Pilot fails if any occur:

- confident answer with no source
- no-source question returns grounded success
- weak source presented as strong evidence
- hidden mutation occurs
- pending edit is created unexpectedly
- Apply/sync/write-back is triggered
- repo becomes unexpectedly dirty
- warnings are hidden in UI
- readable Vietnamese text regresses into mojibake

## 8. Evidence To Record

Operator should record:

- workspace path used
- document set and document types
- exact questions asked
- direct ABW JSON result summary
- NVIDIA UI/bridge result summary
- mutation safety result
- test/regression result used during pilot window
- subjective usefulness rating
- blockers and unclear behavior

## 9. Output Template

```markdown
# VERDICT

One of:
- REAL_USER_PILOT_PASS_BOUNDED
- REAL_USER_PILOT_FAIL_SOURCE_TRUST
- REAL_USER_PILOT_FAIL_MUTATION_SAFETY
- REAL_USER_PILOT_FAIL_UI_CLARITY
- REAL_USER_PILOT_INCOMPLETE

# PILOT SCOPE

- Workspace:
- Data class used:
- Document count/type:
- Read-only boundary confirmed (yes/no):

# QUESTION RESULTS

- Q1:
  - Direct ABW:
  - NVIDIA UI:
  - Source/trust/warning quality:
- Q2:
- Q3:
- Vietnamese Q:
- Missing-source Q:
- Weak-source/Ambiguous Q:

# MUTATION SAFETY

- Pending edits created:
- Apply triggered:
- Sync/write-back triggered:
- Query-time workspace mutation:
- Control repo clean:
- NVIDIA repo clean:
- ABW repo clean:

# USEFULNESS

- Operator usefulness score (1-5):
- Why:

# BLOCKERS

- Blocker 1:
- Blocker 2:

# NON-CLAIMS

- Not `DAILY_USE_READY`
- Not production-ready
- Not full bridge ready
- Not write-back/sync ready
- Not real private/work-doc validation completion
```

## 10. Non-Claims (Mandatory)

Even if this pilot passes:

- it does not automatically mean `DAILY_USE_READY`
- it does not automatically mean production-ready
- it does not automatically mean full bridge ready
- it does not automatically mean enterprise-ready
- it does not automatically mean real private/work documents are broadly validated
