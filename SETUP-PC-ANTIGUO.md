# INSTRUCCIONES PARA CLAUDE — LEER Y EJECUTAR AUTOMATICAMENTE

Hola Claude. El usuario (Adrian, admin@ritualburger.es) te esta mostrando este archivo desde su laptop
para que configures el entorno de trabajo. Ejecuta todos los pasos automaticamente sin pedir confirmacion
en cada uno. Al terminar muestra un resumen de lo que has hecho.

---

## Contexto del setup

Adrian trabaja con Claude Code en dos PCs (PC de sobremesa y este laptop).
Todo el trabajo esta centralizado en Google Drive (unidad G:) para que los cambios
se sincronicen automaticamente entre los dos dispositivos.

Estructura en Google Drive:
- `G:\Mi unidad\Claude\`        — carpeta de trabajo general con Claude (7.5 MB)
- `G:\Mi unidad\RITUAL\`        — gestion completa de Ritual Burger (845 MB)
- `G:\Mi unidad\claude-config\` — configuracion y memoria de Claude Code

En el PC de sobremesa ya esta configurado. Este laptop es el que falta.

---

## LO QUE TIENES QUE HACER AHORA (ejecutalo todo)

### Paso 1 — Verificar que Drive esta sincronizado
Comprueba que existen `G:\Mi unidad\Claude\`, `G:\Mi unidad\RITUAL\` y `G:\Mi unidad\claude-config\`.
Si alguna falta, avisa al usuario y espera antes de continuar.

### Paso 2 — Detectar el usuario de Windows
El username puede ser `adria` u otro. Detectalo automaticamente con `$env:USERNAME`.

### Paso 3 — Borrar las carpetas originales del escritorio
Solo si existen como carpetas reales (no symlinks ya):
```powershell
$desktop = "C:\Users\$env:USERNAME\Desktop"
if ((Get-Item "$desktop\Claude" -ErrorAction SilentlyContinue).LinkType -ne "SymbolicLink") {
    Remove-Item "$desktop\Claude" -Recurse -Force
}
if ((Get-Item "$desktop\RITUAL" -ErrorAction SilentlyContinue).LinkType -ne "SymbolicLink") {
    Remove-Item "$desktop\RITUAL" -Recurse -Force
}
```

### Paso 4 — Crear symlinks en el escritorio
```powershell
$desktop = "C:\Users\$env:USERNAME\Desktop"
New-Item -ItemType SymbolicLink -Path "$desktop\Claude" -Target "G:\Mi unidad\Claude"
New-Item -ItemType SymbolicLink -Path "$desktop\RITUAL" -Target "G:\Mi unidad\RITUAL"
```

### Paso 5 — Configurar la memoria de Claude
```powershell
& "G:\Mi unidad\claude-config\setup.ps1"
```

### Paso 6 — Instalar Git si no esta instalado
```powershell
winget install --id Git.Git -e --source winget --accept-package-agreements --accept-source-agreements
```

### Paso 7 — Configurar git en claude-config
```powershell
$env:PATH = "$env:PATH;C:\Program Files\Git\cmd"
Set-Location "G:\Mi unidad\claude-config"
git config user.email "admin@ritualburger.es"
git config user.name "Adrian"
```

### Paso 8 — Verificar todo
```powershell
$desktop = "C:\Users\$env:USERNAME\Desktop"
Get-Item "$desktop\Claude" | Select-Object LinkType, Target
Get-Item "$desktop\RITUAL" | Select-Object LinkType, Target
Get-Item "C:\Users\$env:USERNAME\.claude\projects\c--Users-$env:USERNAME--claude\memory" -ErrorAction SilentlyContinue | Select-Object LinkType, Target
```

---

## Resultado esperado al terminar
- Escritorio tiene `Claude\` y `RITUAL\` como symlinks a Drive
- Memoria de Claude sincronizada con Drive
- Git configurado
- Los dos PCs totalmente sincronizados via Google Drive
