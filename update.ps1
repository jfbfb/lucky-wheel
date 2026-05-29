# Push changes to GitHub (auto-deploy Pages)
#   .\update.ps1
#   .\update.ps1 "fix sound"

param([string]$Message)

$ErrorActionPreference = "Stop"
$SiteUrl = "https://jfbfb.github.io/lucky-wheel/"
$RepoUrl = "https://github.com/jfbfb/lucky-wheel"
Set-Location $PSScriptRoot

function Step($t) { Write-Host ""; Write-Host ">> $t" -ForegroundColor Cyan }

if (-not (Test-Path ".git")) {
    Write-Host "ERROR: not a git repo" -ForegroundColor Red
    exit 1
}

Step "check"
$changes = @(git status --porcelain)
if ($changes.Count -eq 0) {
    Write-Host "No changes." -ForegroundColor Yellow
    Write-Host $SiteUrl
    exit 0
}
git status -s

if ([string]::IsNullOrWhiteSpace($Message)) {
    $Message = Read-Host "Commit message (Enter = default)"
}
if ([string]::IsNullOrWhiteSpace($Message)) {
    $Message = "update " + (Get-Date -Format "yyyy-MM-dd HH:mm")
}

Step "commit"
git add -A
git commit -m $Message
if ($LASTEXITCODE -ne 0) { Write-Host "ERROR: commit failed" -ForegroundColor Red; exit 1 }

Step "push"
git push origin main
if ($LASTEXITCODE -ne 0) { Write-Host "ERROR: push failed" -ForegroundColor Red; exit 1 }

Write-Host ""
Write-Host "========================================" -ForegroundColor Green
Write-Host " OK" -ForegroundColor Green
Write-Host " Site: $SiteUrl"
Write-Host " Repo: $RepoUrl"
Write-Host " Wait 1-2 min for Pages." -ForegroundColor Green
Write-Host "========================================" -ForegroundColor Green
