param(
    [string]$Root = (Resolve-Path (Join-Path $PSScriptRoot "..\..")).Path
)

$moved = @(
    "ROADMAP.md",
    "DECISIONS.md",
    "RISKS.md",
    "HANDOFF.md",
    "INTEGRATION_JOURNAL.md",
    "SESSION_RESTORE.md",
    "SESSION_CLOSE.md",
    "NEXT.md"
)

Write-Output "broken-reference-scan: experimental; flags root-level moved doc names"

Get-ChildItem -Path $Root -Recurse -File -Filter "*.md" |
    Where-Object { $_.FullName -notmatch "\\07_HISTORY\\" } |
    ForEach-Object {
        $path = $_.FullName
        $text = Get-Content -Raw -LiteralPath $path
        foreach ($name in $moved) {
            if ($text -match "(?<![A-Za-z0-9_./-])$([regex]::Escape($name))(?![A-Za-z0-9_./-])") {
                [pscustomobject]@{
                    severity = "medium"
                    file = $path.Substring($Root.Length + 1)
                    finding = "possible stale root-level reference"
                    token = $name
                } | ConvertTo-Json -Compress
            }
        }
    }
