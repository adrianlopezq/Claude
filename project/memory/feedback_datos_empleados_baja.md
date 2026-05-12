---
name: Preservar datos históricos de empleados al darles de baja
description: Nunca borrar horas extra ni datos de turnos de socios cuando un empleado deja la empresa
type: feedback
---

Al dar de baja a un empleado (como Aitana, Marta), NUNCA tocar:

- **Tabla `salidas`** (horas extra): conservar siempre todos los registros históricos, sin importar si el empleado ya no está. Son datos contables/laborales de la empresa.
- **Tabla `turnos` de socios**: los turnos de mario y adrián son intocables. Su historial tiene valor para la empresa.

**Why:** Los datos de horas extra son información crítica para la empresa (nóminas, auditorías). Los turnos de los socios también. Solo se pueden limpiar datos de empleados de baja si se pide explícitamente y con confirmación.

**How to apply:** Cuando se elimine a un empleado del sistema (panel, USERS, etc.), únicamente tocar el código/interfaz. No proponer ni ejecutar ningún DELETE sobre `salidas` o `turnos` históricos. Si alguien lo pide, avisar del riesgo antes de proceder.
