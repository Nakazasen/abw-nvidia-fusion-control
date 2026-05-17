param(
    [string]$ControlRoot = "D:\Sandbox\ABW_NVIDIA_FUSION_CONTROL",
    [string]$NvidiaRoot = "D:\Sandbox\Nvidia",
    [string]$AbwRoot = "D:\Sandbox\skill-Anti-brain-wiki_note",
    [int]$HandoffStaleDays = 14,
    [int]$AuditStaleDays = 30
)

$ErrorActionPreference = "Stop"

function Write-Section {
    param([string]$Title)
    Write-Host ""
    Write-Host "== $Title =="
}

function Get-GitSnapshot {
    param([string]$Name, [string]$Path)

    if (-not (Test-Path -LiteralPath $Path)) {
        return [pscustomobject]@{
            Name = $Name
            Path = $Path
            Present = $false
            Head = $null
            DirtyCount = $null
            Status = @("missing path")
        }
    }

    $head = $null
    $status = @()
    try {
        $head = (& git -C $Path rev-parse --short HEAD 2>$null)
        $status = @(& git -C $Path status --short 2>$null)
    } catch {
        $status = @("git inspection failed: $($_.Exception.Message)")
    }

    return [pscustomobject]@{
        Name = $Name
        Path = $Path
        Present = $true
        Head = $head
        DirtyCount = $status.Count
        Status = $status
    }
}

function Test-JsonFile {
    param([string]$Path)

    if (-not (Test-Path -LiteralPath $Path)) {
        return "missing"
    }

    try {
        Get-Content -LiteralPath $Path -Raw | ConvertFrom-Json | Out-Null
        return "valid JSON"
    } catch {
        return "invalid JSON: $($_.Exception.Message)"
    }
}

function Get-FileAge {
    param([string]$Path)

    if (-not (Test-Path -LiteralPath $Path)) {
        return $null
    }

    $item = Get-Item -LiteralPath $Path
    return [math]::Round(((Get-Date) - $item.LastWriteTime).TotalDays, 1)
}

Write-Host "Governance runtime status"
Write-Host "Generated: $((Get-Date).ToString('yyyy-MM-dd HH:mm:ss zzz'))"
Write-Host "Mode: report-only advisory; not CI enforcement; not readiness proof"

Write-Section "Repository State"
$repos = @(
    (Get-GitSnapshot -Name "CONTROL" -Path $ControlRoot),
    (Get-GitSnapshot -Name "NVIDIA" -Path $NvidiaRoot),
    (Get-GitSnapshot -Name "ABW" -Path $AbwRoot)
)

foreach ($repo in $repos) {
    if (-not $repo.Present) {
        Write-Host "WARN $($repo.Name): missing at $($repo.Path)"
        continue
    }

    $dirtyLabel = if ($repo.DirtyCount -eq 0) { "clean" } else { "$($repo.DirtyCount) changed entries" }
    Write-Host "$($repo.Name): head=$($repo.Head) state=$dirtyLabel path=$($repo.Path)"
}

Write-Section "Canonical Document Presence"
$canonicalDocs = @(
    "START_HERE.md",
    "REPO_MAP.md",
    "00_SYSTEM/PROJECT_PHILOSOPHY.md",
    "01_GOVERNANCE/GOVERNANCE_MAP.md",
    "03_OPERATIONS/HANDOFF.md",
    "03_OPERATIONS/CURRENT_BLOCKERS.md",
    "04_RECOVERY/RECOVERY_PROTOCOL.md",
    "04_RECOVERY/CONTEXT_COLLAPSE_PROTOCOL.md",
    "04_RECOVERY/EXECUTION_RECOVERY_PROTOCOL.md",
    "03_OPERATIONS/runtime_governance/RUNTIME_GOVERNANCE_SURFACE.md",
    "01_GOVERNANCE/runtime_contracts/runtime-warning-policy.md",
    "03_OPERATIONS/execution_layer/EXECUTION_SURFACE_MAP.md",
    "01_GOVERNANCE/execution_contracts/bounded-execution-contract.md",
    "06_VALIDATION/review_gates/HUMAN_REVIEW_REQUIRED_MATRIX.md"
)

foreach ($doc in $canonicalDocs) {
    $path = Join-Path $ControlRoot $doc
    if (Test-Path -LiteralPath $path) {
        Write-Host "present $doc"
    } else {
        Write-Host "WARN missing $doc"
    }
}

Write-Section "Governance Contract Status"
$contracts = @(
    "01_GOVERNANCE/contracts/governance-schema.json",
    "01_GOVERNANCE/contracts/canonical-docs.json",
    "01_GOVERNANCE/contracts/cognitive-routing.json",
    "01_GOVERNANCE/contracts/repo-truth-hierarchy.json",
    "01_GOVERNANCE/contracts/document-lifecycle.json"
)

foreach ($contract in $contracts) {
    $path = Join-Path $ControlRoot $contract
    Write-Host "$contract - $(Test-JsonFile -Path $path)"
}

Write-Section "Operational Age Warnings"
$handoffPath = Join-Path $ControlRoot "03_OPERATIONS/HANDOFF.md"
$handoffAge = Get-FileAge -Path $handoffPath
if ($null -eq $handoffAge) {
    Write-Host "WARN handoff missing"
} elseif ($handoffAge -gt $HandoffStaleDays) {
    Write-Host "WARN handoff age is $handoffAge days; reconcile before interpreting as latest truth"
} else {
    Write-Host "handoff age is $handoffAge days"
}

$auditDir = Join-Path $ControlRoot "07_HISTORY/governance_audits"
if (Test-Path -LiteralPath $auditDir) {
    $auditFiles = @(Get-ChildItem -LiteralPath $auditDir -Filter "*.md" -File)
    if ($auditFiles.Count -eq 0) {
        Write-Host "WARN no governance audit files found"
    } else {
        $latestAudit = $auditFiles | Sort-Object LastWriteTime -Descending | Select-Object -First 1
        $auditAge = [math]::Round(((Get-Date) - $latestAudit.LastWriteTime).TotalDays, 1)
        if ($auditAge -gt $AuditStaleDays) {
            Write-Host "WARN latest governance audit age is $auditAge days ($($latestAudit.Name))"
        } else {
            Write-Host "latest governance audit age is $auditAge days ($($latestAudit.Name))"
        }
    }
} else {
    Write-Host "WARN governance audit directory missing"
}

Write-Section "Blocker Indicators"
$blockersPath = Join-Path $ControlRoot "03_OPERATIONS/CURRENT_BLOCKERS.md"
if (Test-Path -LiteralPath $blockersPath) {
    $blockerText = Get-Content -LiteralPath $blockersPath -Raw
    $activePatterns = @(
        "active blocker",
        "current blocker",
        "gating constraint",
        "unresolved",
        "blocked"
    )
    $hits = @()
    foreach ($pattern in $activePatterns) {
        if ($blockerText -match $pattern) {
            $hits += $pattern
        }
    }

    if ($hits.Count -gt 0) {
        Write-Host "WARN blocker indicators present: $($hits -join ', ')"
        Write-Host "Interpret by reading 03_OPERATIONS/CURRENT_BLOCKERS.md directly."
    } else {
        Write-Host "no simple blocker indicators detected; manual review still required"
    }
} else {
    Write-Host "WARN blocker file missing"
}

Write-Section "Boundaries"
Write-Host "This output is advisory only."
Write-Host "It does not prove readiness, safety, compliance, or production maturity."
Write-Host "Use it to decide what must be manually inspected before making governance claims."
