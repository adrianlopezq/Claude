---
name: acabamos
description: Comando de fin de sesion que Adrian usa para cerrar el trabajo del dia
metadata: 
  node_type: memory
  type: feedback
  originSessionId: 3e14cadc-5c68-4e93-a025-fb4355b6d558
---

Cuando Adrian escribe "ACABAMOS" es una señal de fin de sesion.
Acciones a ejecutar:
- Guardar un archivo PENDIENTES.txt en G:\Mi unidad\claude-config\ con todo lo que queda por hacer
- Guardar o actualizar memorias relevantes de la sesion
- Hacer git commit + push a GitHub con los cambios del dia (sync.ps1)

**Why:** Adrian tenia este flujo configurado en el PC antiguo y quiere recuperarlo.
**How to apply:** Cada vez que Adrian escriba "ACABAMOS", ejecutar estas acciones automaticamente.
