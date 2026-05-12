---
name: CS2 ritual pre-partida
description: Runbook completo del ritual CS2 que se ejecuta cuando Adrián escribe "EJECUTAMOS". Hardware fijo G513QM (Ryzen 7 5800H, RTX 3060, 16GB, M.2 1TB). Lista cerrada, NO modificar sin OK explícito.
type: project
originSessionId: 9bec06ac-67b5-4388-bb8c-b330630d8048
---
# CS2 RITUAL PRE-PARTIDA — runbook

## TRIGGER
Adrián escribe **"EJECUTAMOS"** (solo o con contexto CS2/partida/ritual).
Si lo dice en contexto claramente NO-gaming, **preguntar antes** de ejecutar.

## CONTEXTO FIJO
- **Hardware:** ASUS ROG Strix G513QM — Ryzen 7 5800H · RTX 3060 Mobile · 16 GB RAM · 1 TB M.2
- **Asunción:** PC siempre enchufado a corriente AC (no comprobar batería).
- **PowerShell:** ejecutar como admin. Ante cualquier error → REPORTAR y CONTINUAR (no abortar el ritual).

## WHITELIST — NUNCA cerrar
FACEIT AC, CS2, Steam, Discord, TeamSpeak, Logitech G Hub, HyperX NGENUITY, todos los procesos `NVIDIA*`, MSI Afterburner, **este CLI de Claude**.

---

## FASE 0 — Snapshot inicial (registrar para reporte)
```powershell
$ramAntes = [math]::Round((Get-CimInstance Win32_OperatingSystem).FreePhysicalMemory/1024,0)
$procAntes = (Get-Process).Count
"RAM libre antes: $ramAntes MB | Procesos: $procAntes"
```

## FASE 1 — Limpieza de archivos
```powershell
# 1.1 TEMP usuario (usar Get-ChildItem para evitar conflicto con output de Claude CLI)
Get-ChildItem $env:TEMP -ErrorAction SilentlyContinue | Remove-Item -Recurse -Force -ErrorAction SilentlyContinue
# 1.2 Windows Temp
Remove-Item "C:\Windows\Temp\*" -Recurse -Force -ErrorAction SilentlyContinue
# 1.3 Prefetch
Remove-Item "C:\Windows\Prefetch\*" -Force -ErrorAction SilentlyContinue
# 1.4 DNS
ipconfig /flushdns
# 1.5 Shaders NVIDIA
Remove-Item "$env:LOCALAPPDATA\NVIDIA\DXCache\*" -Recurse -Force -ErrorAction SilentlyContinue
Remove-Item "$env:LOCALAPPDATA\NVIDIA\GLCache\*" -Recurse -Force -ErrorAction SilentlyContinue
# 1.6 Papelera
Clear-RecycleBin -Force -ErrorAction SilentlyContinue
```

## FASE 2 — Cerrar procesos (respetando whitelist)
Lista exacta a matar (Stop-Process -Name <X> -Force -ErrorAction SilentlyContinue):

**Navegadores:** `chrome`, `msedge`, `firefox`, `brave`, `opera`, `opera_gx`
**Office:** `WINWORD`, `EXCEL`, `POWERPNT`, `OUTLOOK`, `ONENOTE`
**Comms:** `slack`, `Telegram`, `WhatsApp`, `Spotify`
**Sync:** `OneDrive`, `Dropbox`, `googledrivesync`, `GoogleDriveFS`
**Adobe:** `Creative Cloud`, `Acrobat`, `AcroRd32`, `Adobe Desktop Service`
**Launchers:** `EpicGamesLauncher`, `EADesktop`, `Origin`, `UbisoftConnect`, `Battle.net`, `GalaxyClient`, `RiotClientServices`
**Xbox/Game Bar:** `GameBar`, `XboxAppServices`, `GameBarPresenceWriter`, `XboxGameBarWidgets`
**Periféricos no críticos:** `Razer Synapse`, `RzSynapse`, `iCUE`, `CorsairService`
**NUNCA cerrar:** `lghub`, `lghub_agent`, `lghub_system_tray` — cierra G Hub y cambia la sensibilidad del ratón
**Editores/notas:** `Notion`, `Obsidian`, `claude` *(SOLO el desktop, NO el CLI — ver nota)*
**NUNCA cerrar:** `Code` (VSCode — el CLI corre dentro), `chrome` (puede estar en uso)
**Grabadores:** `obs64`, `obs32`, `XSplit.Core`, `Streamlabs OBS`
**ASUS bloatware:** `ArmouryCrate`, `ArmouryCrate.UserSessionHelper`, `ROGLiveService`, `GameSDK`, `AsusOptimization`, `MyASUS`, `GameFirst VI`, `gamefirst`

**NOTA Claude Desktop vs CLI:** matar `claude.exe` solo si está corriendo como app de escritorio. El CLI corre dentro de la terminal/VSCode → NO matar. Detectar por `Get-Process claude | Where-Object Path -match 'AppData\\Local\\Programs\\claude'`.

**Procesos GPU zombie:** `nvidia-smi` → si hay procesos `<defunct>` o consumiendo VRAM sin app abierta, matarlos por PID.

## FASE 3 — Servicios y energía
```powershell
# 3.1 Servicios temporales (vuelven al reinicio)
Stop-Service -Name SysMain -Force -ErrorAction SilentlyContinue
Stop-Service -Name WSearch -Force -ErrorAction SilentlyContinue
# 3.2 Plan energía Máximo Rendimiento (sesión)
powercfg -setactive 8c5e7fda-e8bf-4a96-9a85-a6e23a8c635c
# 3.3 Liberar RAM standby (si EmptyStandbyList.exe disponible en PATH)
if (Get-Command EmptyStandbyList.exe -ErrorAction SilentlyContinue) {
    EmptyStandbyList.exe standbylist
}
# 3.4 Focus Assist ON (silenciar notificaciones)
# Manual: Win+A → Asistente concentración → "Solo alarmas".
# (Sin API estable en PowerShell; documentar y avisar al usuario.)
```

## FASE 4 — Registro (backup .reg PRIMERO)
```powershell
$ts = Get-Date -Format "yyyyMMdd_HHmm"
$bak = "$env:USERPROFILE\Desktop\registry_backup_cs2_$ts.reg"
reg export "HKCU\System\GameConfigStore" "$bak" /y
reg export "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile" "${bak}.mm.reg" /y
"Backup en: $bak"
```

Cambios (ejecutar uno a uno con `reg add`):
```cmd
:: 4.1 Game Bar / DVR off
reg add "HKCU\System\GameConfigStore" /v GameDVR_Enabled /t REG_DWORD /d 0 /f
reg add "HKCU\System\GameConfigStore" /v GameDVR_FSEBehaviorMode /t REG_DWORD /d 2 /f
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\GameDVR" /v AllowGameDVR /t REG_DWORD /d 0 /f

:: 4.2 Prioridad multimedia juegos
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile" /v SystemResponsiveness /t REG_DWORD /d 0 /f
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile" /v NetworkThrottlingIndex /t REG_DWORD /d 0xFFFFFFFF /f
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile\Tasks\Games" /v "GPU Priority" /t REG_DWORD /d 8 /f
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile\Tasks\Games" /v Priority /t REG_DWORD /d 6 /f
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile\Tasks\Games" /v "Scheduling Category" /t REG_SZ /d High /f

:: 4.3 MenuShowDelay
reg add "HKCU\Control Panel\Desktop" /v MenuShowDelay /t REG_SZ /d 0 /f
```

**4.4 Nagle off** (requiere identificar GUID del adaptador activo):
```powershell
$guid = (Get-NetAdapter | Where-Object Status -eq "Up" | Select-Object -First 1).InterfaceGuid
$path = "HKLM:\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters\Interfaces\$guid"
Set-ItemProperty -Path $path -Name TcpAckFrequency -Value 1 -Type DWord
Set-ItemProperty -Path $path -Name TCPNoDelay -Value 1 -Type DWord
```

## FASE 5 — Verificaciones hardware (G513QM)
- **Modo Turbo activo** en GHelper → confirmar antes de lanzar CS2.
- **MSI Afterburner → cargar perfil 3** (undervolt RTX 3060).
- **Check baterías periféricos:** auriculares wireless + ratón wireless (avisar si <30%).

## FASE 6 — Snapshot final + reporte
```powershell
$ramDespues = [math]::Round((Get-CimInstance Win32_OperatingSystem).FreePhysicalMemory/1024,0)
$procDespues = (Get-Process).Count
"=== REPORTE RITUAL CS2 ==="
"RAM libre: $ramAntes MB → $ramDespues MB (+$($ramDespues-$ramAntes))"
"Procesos: $procAntes → $procDespues (-$($procAntes-$procDespues))"
"Backup .reg: $bak"
nvidia-smi --query-gpu=temperature.gpu,utilization.gpu,memory.used --format=csv,noheader
```

---

## NO TOCAR sin OK explícito
- Registro: aceleración ratón, `Win32PrioritySeparation`, HAGS
- Defender / firewall
- Caché Steam/CS2 (rompe verificación)
- Plan de energía permanente
- Disk cleanup profundo del sistema
- PBO / Ryzen Master en 5800H
- Dynamic Boost off (solo si stutter detectado)

## ONE-TIME (ya aplicado, NO repetir)
1. ~~MUX Switch~~ — no existe en este modelo
2. ✅ GHelper instalado, Armoury Crate desinstalado
3. ✅ Curva ventilador agresiva en GHelper (CPU 90W, GPU 90W, curva personalizada activa)
4. ✅ Undervolt RTX 3060 — 1850MHz @ 850mV — guardado en **perfil 3 de MSI Afterburner**
5. ✅ Panel NVIDIA: Power Max Performance, Low Latency Ultra, Threaded On, Texture HighPerf, VSync Off, Sharpening Off
6. ✅ CS2 launch options: `-threads 8`
7. ✅ GHelper: PCIe Link State Management desactivado, Stop/Start NVIDIA services activado, límite carga batería 80%, ejecutar al inicio activado
8. ✅ Autoexec CS2: vprof_off, cl_hide_avatar_images 1, cl_autohelp 0 añadidos

## COPIA DE SEGURIDAD
Copia `.txt` mantenida en `C:\Users\adria\Desktop\RITUAL_CS2_BACKUP.txt` por si se pierde el archivo de memoria.
