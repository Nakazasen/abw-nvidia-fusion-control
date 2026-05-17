param(
    [string]$Root = (Resolve-Path (Join-Path $PSScriptRoot "..\..")).Path
)

$contractPath = Join-Path $Root "01_GOVERNANCE\contracts\canonical-docs.json"
$known = @{}
$knownRoots = @(
    "00_SYSTEM/",
    "01_GOVERNANCE/",
    "02_ARCHITECTURE/",
    "03_OPERATIONS/",
    "04_RECOVERY/",
    "05_DECISIONS/",
    "06_VALIDATION/",
    "07_HISTORY/",
    "tools/governance/",
    "prompts/"
)

$knownRootFiles = @(
    "README.md",
    "START_HERE.md",
    "REPO_MAP.md",
    "AGENTS.md"
)

if (Test-Path $contractPath) {
    $contract = Get-Content -Raw -LiteralPath $contractPath | ConvertFrom-Json
    foreach ($doc in $contract.canonical_docs) {
        $known[$doc.path] = $true
    }
}

Write-Output "orphan-doc-scan: experimental; reports docs outside canonical contract for review"

Get-ChildItem -Path $Root -Recurse -File -Filter "*.md" |
    ForEach-Object {
        $relative = $_.FullName.Substring($Root.Length + 1).Replace("\", "/")
        $isKnownRootFile = $knownRootFiles -contains $relative
        $isKnownRoot = $false
        foreach ($prefix in $knownRoots) {
            if ($relative.StartsWith($prefix)) {
                $isKnownRoot = $true
                break
            }
        }
        if (-not $known.ContainsKey($relative) -and -not $isKnownRoot -and -not $isKnownRootFile) {
            [pscustomobject]@{
                severity = "info"
                file = $relative
                finding = "not routed by canonical docs, root files, or known cognition directories"
                note = "review whether this file should be mapped, archived, or explicitly exempted"
            } | ConvertTo-Json -Compress
        }
    }
