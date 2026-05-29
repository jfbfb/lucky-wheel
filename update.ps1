param([string]$Message)

$ErrorActionPreference = "Stop"
$SiteUrl = "https://jfbfb.github.io/lucky-wheel/"
$RepoUrl = "https://github.com/jfbfb/lucky-wheel"
Set-Location $PSScriptRoot

if (-not (Test-Path ".git")) {
    Write-Host "ERROR: not a git repo" -ForegroundColor Red
    exit 1
}

$changes = @(git status --porcelain)
if ($changes.Count -eq 0) {
    Write-Host "No changes. Site is up to date." -ForegroundColor Yellow
    Write-Host $SiteUrl
    exit 0
}

git status -s

if ([string]::IsNullOrWhiteSpace($Message)) {
    $Message = Read-Host "Commit message"
}
if ([string]::IsNullOrWhiteSpace($Message)) {
    $Message = "update " + (Get-Date -Format "yyyy-MM-dd HH:mm")
}

git add -A
git commit -m $Message
if ($LASTEXITCODE -ne 0) { exit 1 }

git push origin main
if ($LASTEXITCODE -ne 0) { exit 1 }

Write-Host ""
Write-Host "Done! Site: $SiteUrl" -ForegroundColor Green
Write-Host "Repo:  $RepoUrl" -ForegroundColor Green
Write-Host "Pages updates in 1-2 minutes." -ForegroundColor Green
