# Configura los symlinks de Claude Code en una maquina nueva
# Ejecutar una vez por maquina (como Administrador)
# Uso: .\setup.ps1

$driveConfig = "G:\Mi unidad\claude-config"
$claudeDir   = "$env:USERPROFILE\.claude"
$projectHash = "c--Users-$($env:USERNAME)-Desktop-Claude"
$projectLink = "$claudeDir\projects\$projectHash"

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
Write-Host "Project hash: $projectHash"
Write-Host ""

# Symlink para el proyecto completo (memory + otros datos del proyecto)
New-Symlink $projectLink "$driveConfig\project"

# Symlink para settings.json global
if (Test-Path "$driveConfig\settings.json") {
    New-Symlink "$claudeDir\settings.json" "$driveConfig\settings.json"
} else {
    Write-Host "settings.json no existe aun en Drive, copialo manualmente." -ForegroundColor Yellow
}

# Symlink para commands/ (skills)
if (Test-Path "$driveConfig\commands") {
    New-Symlink "$claudeDir\commands" "$driveConfig\commands"
} else {
    Write-Host "commands/ no existe en Drive, creandolo..." -ForegroundColor Yellow
    New-Item -ItemType Directory -Force -Path "$driveConfig\commands" | Out-Null
    New-Symlink "$claudeDir\commands" "$driveConfig\commands"
}

# Symlink para keybindings.json
if (Test-Path "$driveConfig\keybindings.json") {
    New-Symlink "$claudeDir\keybindings.json" "$driveConfig\keybindings.json"
} else {
    Write-Host "keybindings.json no existe en Drive aun, se ignorara." -ForegroundColor Yellow
}

Write-Host ""
Write-Host "Setup completado." -ForegroundColor Green
Write-Host ""
Write-Host "Verifica los symlinks:" -ForegroundColor Cyan
Get-Item "$claudeDir\projects\$projectHash" -ErrorAction SilentlyContinue | Select-Object Name, LinkType, @{n='Target';e={$_.Target}}
Get-Item "$claudeDir\settings.json" -ErrorAction SilentlyContinue | Select-Object Name, LinkType, @{n='Target';e={$_.Target}}
Get-Item "$claudeDir\commands" -ErrorAction SilentlyContinue | Select-Object Name, LinkType, @{n='Target';e={$_.Target}}
Get-Item "$claudeDir\keybindings.json" -ErrorAction SilentlyContinue | Select-Object Name, LinkType, @{n='Target';e={$_.Target}}
