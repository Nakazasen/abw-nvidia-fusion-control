param(
    [string]$Repo = "CONTROL",
    [string]$WorkspacePath = (Get-Location).Path,
    [string]$Action = "unspecified",
    [ValidateSet("safe", "bounded-risk", "human-review-required", "forbidden-autonomy")]
    [string]$SafetyClass = "bounded-risk",
    [string]$Result = "not-run",
    [switch]$Markdown
)

$ErrorActionPreference = "Stop"

function Get-GitState {
    param([string]$Path)

    if (-not (Test-Path -LiteralPath $Path)) {
        return [pscustomobject]@{
            head = $null
            dirty_count = $null
            status = @("missing path")
        }
    }

    try {
        $head = (& git -C $Path rev-parse --short HEAD 2>$null)
        $status = @(& git -C $Path status --short 2>$null)
        return [pscustomobject]@{
            head = $head
            dirty_count = $status.Count
            status = $status
        }
    } catch {
        return [pscustomobject]@{
            head = $null
            dirty_count = $null
            status = @("git inspection failed: $($_.Exception.Message)")
        }
    }
}

$timestamp = Get-Date
$traceId = "exec-{0}-{1}" -f $timestamp.ToString("yyyyMMdd-HHmmss"), (($Action -replace '[^A-Za-z0-9_-]', '-') -replace '-+', '-').Trim('-').ToLowerInvariant()
$git = Get-GitState -Path $WorkspacePath

if ($Markdown) {
    Write-Host "# Execution Trace"
    Write-Host ""
    Write-Host "- trace_id: `$traceId`"
    Write-Host "- created_at: `$($timestamp.ToString('yyyy-MM-dd HH:mm:ss zzz'))`"
    Write-Host "- repo: `$Repo`"
    Write-Host "- workspace_path: `$WorkspacePath`"
    Write-Host "- action: `$Action`"
    Write-Host "- safety_class: `$SafetyClass`"
    Write-Host "- result: `$Result`"
    Write-Host "- git_head: `$($git.head)`"
    Write-Host "- dirty_entries: `$($git.dirty_count)`"
    Write-Host "- governance_constraints:"
    Write-Host "  - `03_OPERATIONS/execution_layer/ACTION_BOUNDARY_MAP.md`"
    Write-Host "  - `01_GOVERNANCE/execution_contracts/action-evidence-contract.md`"
    Write-Host "  - `06_VALIDATION/review_gates/HUMAN_REVIEW_REQUIRED_MATRIX.md`"
    Write-Host "- non_claims:"
    Write-Host "  - This trace is not readiness proof."
    Write-Host "  - This trace is not autonomous enforcement."
    Write-Host "  - This trace is not production telemetry."
    exit 0
}

Write-Host "Execution trace snapshot"
Write-Host "trace_id: $traceId"
Write-Host "created_at: $($timestamp.ToString('yyyy-MM-dd HH:mm:ss zzz'))"
Write-Host "repo: $Repo"
Write-Host "workspace_path: $WorkspacePath"
Write-Host "action: $Action"
Write-Host "safety_class: $SafetyClass"
Write-Host "result: $Result"
Write-Host "git_head: $($git.head)"
Write-Host "dirty_entries: $($git.dirty_count)"
Write-Host "status: advisory trace template only; not telemetry, not enforcement, not readiness proof"
