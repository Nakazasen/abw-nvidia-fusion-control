param(
    [string]$Root = (Resolve-Path (Join-Path $PSScriptRoot "..\..")).Path
)

$ErrorActionPreference = "Stop"

Write-Output "governance-check: experimental report-only scan"
Write-Output "root: $Root"

& (Join-Path $PSScriptRoot "scan-broken-references.ps1") -Root $Root
& (Join-Path $PSScriptRoot "scan-forbidden-claims.ps1") -Root $Root
& (Join-Path $PSScriptRoot "scan-orphan-docs.ps1") -Root $Root

Write-Output "governance-check: completed report-only scan"

