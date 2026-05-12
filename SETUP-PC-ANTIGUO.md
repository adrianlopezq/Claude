# Configurar PC antiguo para sync con Drive

## Contexto
Las carpetas Claude/ y RITUAL/ del escritorio ya estan en Google Drive.
Hay que borrar las originales del PC antiguo y crear symlinks que apunten a Drive.

---

## Pasos

### 1. Verificar que Google Drive esta sincronizado
Abrir el explorador de archivos y comprobar que existen estas carpetas:
- `G:\Mi unidad\Claude\`
- `G:\Mi unidad\RITUAL\`

Si no aparecen, esperar a que Google Drive termine de sincronizar antes de continuar.

### 2. Borrar las carpetas originales del escritorio
Abrir PowerShell como Administrador y ejecutar:
```powershell
Remove-Item "C:\Users\adria\Desktop\Claude" -Recurse -Force
Remove-Item "C:\Users\adria\Desktop\RITUAL" -Recurse -Force
```

### 3. Crear los symlinks
```powershell
New-Item -ItemType SymbolicLink -Path "C:\Users\adria\Desktop\Claude" -Target "G:\Mi unidad\Claude"
New-Item -ItemType SymbolicLink -Path "C:\Users\adria\Desktop\RITUAL" -Target "G:\Mi unidad\RITUAL"
```

### 4. Verificar que todo funciona
```powershell
Get-Item "C:\Users\adria\Desktop\Claude" | Select-Object LinkType, Target
Get-Item "C:\Users\adria\Desktop\RITUAL" | Select-Object LinkType, Target
```
Debe mostrar `LinkType = SymbolicLink` en ambos casos.

---

## Tambien: configurar la memoria de Claude

Ejecutar el script de setup de memoria (como Administrador):
```powershell
& "G:\Mi unidad\claude-config\setup.ps1"
```

---

## Resultado final esperado
- El escritorio tiene `Claude/` y `RITUAL/` como siempre
- Cualquier cambio en un PC aparece automaticamente en el otro via Google Drive
- La memoria de Claude esta sincronizada entre los dos PCs
