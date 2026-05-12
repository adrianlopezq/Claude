# Configura los symlinks de Claude Code en una maquina nueva
# Ejecutar una vez por maquina (como Administrador)
# Uso: .\setup.ps1

$driveConfig = "G:\Mi unidad\claude-config"
$claudeDir   = "$env:USERPROFILE\.claude"
$projectHash = "c--Users-$($env:USERNAME)--claude"
$memoryLink  = "$claudeDir\projects\$projectHash\memory"
$settingsLink = "$claudeDir\settings.json"
$claudeMdLink = "$claudeDir\CLAUDE.md"

function New-Symlink($link, $target) {
    if (Test-Path $link) {
        $item = Get-Item $link -Force
        if ($item.LinkType -eq "SymbolicLink") {
            Write-Host "Ya existe symlink: $link" -ForegroundColor Yellow
            return
        }
        Write-Host "ADVERTENCIA: ya existe un archivo/carpeta real en $link" -ForegroundColor Red
        Write-Host "Muevelo o eliminalo manualmente antes de continuar." -ForegroundColor Red
        return
    }
    $parent = Split-Path $link -Parent
    if (-not (Test-Path $parent)) { New-Item -ItemType Directory -Force -Path $parent | Out-Null }
    New-Item -ItemType SymbolicLink -Path $link -Target $target | Out-Null
    Write-Host "Symlink creado: $link -> $target" -ForegroundColor Green
}

Write-Host "=== Setup Claude Config Sync ===" -ForegroundColor Cyan
Write-Host "Drive config: $driveConfig"
Write-Host "Usuario: $env:USERNAME"
Write-Host ""

# Symlink para memory
New-Symlink $memoryLink "$driveConfig\memory"

# Symlink para settings.json (solo si existe en Drive)
if (Test-Path "$driveConfig\settings.json") {
    New-Symlink $settingsLink "$driveConfig\settings.json"
} else {
    Write-Host "settings.json no existe aun en Drive, se creara el symlink cuando exista." -ForegroundColor Yellow
}

# Symlink para CLAUDE.md (solo si existe en Drive)
if (Test-Path "$driveConfig\CLAUDE.md") {
    New-Symlink $claudeMdLink "$driveConfig\CLAUDE.md"
} else {
    Write-Host "CLAUDE.md no existe aun en Drive, se creara el symlink cuando exista." -ForegroundColor Yellow
}

Write-Host ""
Write-Host "Setup completado." -ForegroundColor Green
