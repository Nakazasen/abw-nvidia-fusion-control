# governance tools

## Purpose

Experimental, non-destructive governance integrity checks.

## Status

- Experimental.
- Report-only.
- Not CI enforcement.
- Not production-grade governance.

## Scripts

- `check-governance.ps1`: runs lightweight local checks.
- `execution-trace.ps1`: prints a lightweight execution trace snapshot/template for bounded evidence capture.
- `runtime-status.ps1`: prints a bounded runtime governance snapshot across Control, NVIDIA, and ABW.
- `scan-broken-references.ps1`: reports markdown references to moved root docs.
- `scan-forbidden-claims.ps1`: reports forbidden claim keywords for human review.
- `scan-orphan-docs.ps1`: reports markdown files not listed in the canonical contract.

## Limits

- These scripts are heuristic prototypes.
- `runtime-status.ps1` is advisory only and must not be treated as readiness proof.
- `execution-trace.ps1` is a trace template helper, not telemetry or enforcement.
- They do not understand all historical/archive exceptions.
- Findings require human review.
