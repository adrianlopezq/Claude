---
name: Sistema de fichaje — estado actual
description: FIX-M5 aplicado (madrugada). Bug UTC en turnos pendiente. Refuerzo robustez abr 2026.
type: project
---
## Estado actual (abr 2026)
- FIX-M5: salidas de cena en madrugada (00-08h) → guardar con fecha de ayer. Aplicado y BD limpia.
- Ventana fichaje: turno+3h margen. Fuera de ventana, botón deshabilitado.
- Drift reloj cliente vs servidor: >5min bloquea fichaje (`_lastServerDate` desde header HTTP Supabase).
- horas_extra negativas: permitido (sale antes del fin de turno).

## Bug pendiente — UTC en tabla turnos
`turnos.fecha` guardado con UTC → en España se almacena 1 día antes. `salidas.fecha` usa local (correcto). Divergencia bloquea cruce turno↔salida.

**Estrategia correcta (NO reintentar compat dual):**
1. Backup SQL tabla turnos
2. `UPDATE turnos SET fecha = fecha + INTERVAL '1 day'` (atómico, fuera de horario)
3. Cambiar código a `toISOLocal` puro

**Regla activa:** Al corregir fechas de madrugada, verificar horario del empleado (Carla no trabaja jueves). Constraint único: `salidas_empleado_id_fecha_turno_tipo_key`.
