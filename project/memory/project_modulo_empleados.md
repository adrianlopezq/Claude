---
name: Módulo Gestión Empleados — boceto
description: Estructura aprobada. Pendiente: adrián recaba datos de empleados para ejecutar.
type: project
---
**Estado:** Estructura aprobada, pendiente datos reales para ejecutar. Solo acceso gerentes (adrián, mario).

## Secciones
1. **Contratos** — tipo (temp-3m/6m/indefinido), fechas, renovaciones, historial, alertas vencimiento
2. **Vacaciones** — 2,5 días/mes trabajado, días pendientes, opción abonar
3. **Datos personales** — nombre, alias, puesto, estado (activo/baja), historial cambios
4. **Apuntes** — texto libre por empleado (acuerdos verbales, advertencias, condiciones)
5. **Dashboard** — tabla resumen + alertas contratos/vacaciones

**Pendiente de recabar** (por empleado: hugo, maria, carla, omar, mario, adrián):
- Contrato: tipo actual, fecha inicio, nº renovaciones
- Vacaciones: días disfrutados este año
- Apuntes: condiciones especiales

**How to apply:** No ejecutar hasta tener los datos. Implementar en Deploy/panel/index.html con nuevas tablas Supabase.
