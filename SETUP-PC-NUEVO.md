# Conectar un PC nuevo al sync de Claude

## Requisitos previos
- Google Drive for Desktop instalado y con sesion iniciada (admin@ritualburger.es)
- Esperar a que la carpeta `G:\Mi unidad\claude-config\` aparezca sincronizada

---

## Pasos

### 1. Instalar Git (si no esta instalado)
Abrir PowerShell y ejecutar:
```powershell
winget install --id Git.Git -e --source winget --accept-package-agreements --accept-source-agreements
```

### 2. Ejecutar el script de setup
Abrir PowerShell **como Administrador** y ejecutar:
```powershell
& "G:\Mi unidad\claude-config\setup.ps1"
```

Esto crea automaticamente los symlinks necesarios:
- `~\.claude\projects\c--Users-adria--claude\memory\` -> carpeta memory en Drive
- `~\.claude\settings.json` -> settings.json en Drive (cuando exista)
- `~\.claude\CLAUDE.md` -> CLAUDE.md en Drive (cuando exista)

### 3. Verificar
```powershell
Get-Item "C:\Users\adria\.claude\projects\c--Users-adria--claude\memory" | Select-Object LinkType, Target
```
Debe mostrar `LinkType = SymbolicLink` y el target apuntando a `G:\Mi unidad\claude-config\memory`.

---

## Sincronizar con GitHub (opcional, para backup)

Configurar git en la carpeta de Drive:
```powershell
$env:PATH = "$env:PATH;C:\Program Files\Git\cmd"
Set-Location "G:\Mi unidad\claude-config"
git config user.email "admin@ritualburger.es"
git config user.name "Adrian"
```

Para sincronizar manualmente con GitHub en cualquier momento:
```powershell
& "G:\Mi unidad\claude-config\sync.ps1"
```

---

## Estructura resultante

```
G:\Mi unidad\claude-config\    <- carpeta real en Google Drive (se sincroniza sola)
    memory\                    <- memoria de Claude
    settings.json              <- configuracion (cuando exista)
    CLAUDE.md                  <- instrucciones globales (cuando exista)
    sync.ps1                   <- script para backup en GitHub
    setup.ps1                  <- este script de instalacion

C:\Users\adria\.claude\
    projects\c--Users-adria--claude\memory\  -> symlink a Drive
    settings.json                            -> symlink a Drive (cuando exista)
    CLAUDE.md                                -> symlink a Drive (cuando exista)
```

---

## Repo GitHub de referencia
https://github.com/adrianlopezq/Claude
