param(
    [string]$Root = (Resolve-Path (Join-Path $PSScriptRoot "..\..")).Path
)

$claims = @(
    "DAILY_USE_READY",
    "production-ready",
    "full bridge ready",
    "Cognitive OS achieved",
    "enterprise-grade security",
    "packaging-ready",
    "VS Code parity",
    "Cursor parity"
)

Write-Output "forbidden-claim-scan: experimental; context requires human review"

Get-ChildItem -Path $Root -Recurse -File -Filter "*.md" |
    ForEach-Object {
        $relative = $_.FullName.Substring($Root.Length + 1)
        $lines = Get-Content -LiteralPath $_.FullName
        for ($i = 0; $i -lt $lines.Count; $i++) {
            foreach ($claim in $claims) {
                if ($lines[$i] -like "*$claim*") {
                    $context = $lines[$i]
                    $windowStart = [Math]::Max(0, $i - 5)
                    $window = ($lines[$windowStart..$i] -join " ")
                    $looksBounded = $context -match "not|non-claim|forbidden|does not|blocked|without explicit|cannot|must not" -or
                        $window -match "Non-Claims|Forbidden|Do not claim|Do not|must not|without explicit governance promotion|Active Non-Claims|Explicitly Non-Achieved"
                    [pscustomobject]@{
                        severity = $(if ($looksBounded) { "info" } else { "high" })
                        file = $relative
                        line = $i + 1
                        token = $claim
                        note = $(if ($looksBounded) { "appears bounded" } else { "review required" })
                    } | ConvertTo-Json -Compress
                }
            }
        }
    }
