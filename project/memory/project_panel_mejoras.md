---
name: Panel mejoras pendientes
description: Sidebar implementado. Excel export bugueado. Auth/RLS crítico pendiente.
type: project
originSessionId: 2ca193bc-3511-4275-beba-fd81f1682756
---
## CRÍTICO — Migración auth (próxima sesión)
Plan listo. 5 fases:
1. Crear 6 usuarios Supabase Auth con emails `username@ritual.internal`
2. Metadata de rol en `raw_user_meta_data`
3. Reescribir auth JS: SHA-256 → `supabase.auth.signInWithPassword()`
4. Activar RLS tabla a tabla (empezar: `saldos_socios`, `empleados`, `passwords`)
5. Eliminar tabla `passwords`
**Por qué:** anon key expuesta en JS → cualquiera lee/escribe toda la BD sin RLS.

## Sidebar izquierdo — IMPLEMENTADO (2026-04-23)
- Desktop: sidebar fijo 200px con logo, nav vertical, footer usuario/salir
- Mobile ≤768px: select sticky en top (funcional, no decorativo)
- Archivo: `C:/Users/adria/Desktop/RITUAL/Web/Deploy/panel/index.html`
- Backup: `index.backup.20260423_2256.html` (mismo directorio)

## Excel export turnos — BUGUEADO (2026-04-23)
- Error Excel: "formato o extensión no válidos"
- Causa: SpreadsheetML XML guardado con extensión .xlsx — Excel lo rechaza
- Fix pendiente: cambiar a extensión .xls (SpreadsheetML es formato .xls, no .xlsx) O generar CSV
- Solución recomendada: exportar como .xls cambiando `a.download` a `.xls` y MIME a `application/vnd.ms-excel`
- Alternativamente: usar formato CSV que es 100% compatible sin librerías

## Motion / Spinner — PENDIENTE DEPLOY
- Helpers `_btnLoad`, `_btnDone`, `_btnReset` + keyframes `btnSpin`/`btnPop` añadidos al panel
- Botones cubiertos: doLogin, createPassword, registrarError, guardarTurnos, marcarSalida
- **Pendiente:** deploy a Cloudflare Pages
- Referencia animaciones: `C:\Users\adria\Desktop\assets\Motion System.html`

## Descartado
- Pedidos: Makro manual, carne tiene calculadora.
- Nóminas: XML via asesoría, remesa CaixaBank.
