# Sincroniza la configuracion de Claude con GitHub
# Uso: .\sync.ps1 [mensaje opcional]

param([string]$msg = "sync $(Get-Date -Format 'yyyy-MM-dd HH:mm')")

$dir = "G:\Mi unidad\claude-config"
Set-Location $dir

Write-Host "Pulling cambios de GitHub..." -ForegroundColor Cyan
git pull origin main

Write-Host "Commiteando cambios locales..." -ForegroundColor Cyan
git add -A
$status = git status --porcelain
if ($status) {
    git commit -m $msg
    git push origin main
    Write-Host "Sincronizado con GitHub." -ForegroundColor Green
} else {
    Write-Host "Sin cambios nuevos para commitear." -ForegroundColor Yellow
}
