---
name: Aviso cambio modelo Sonnet → Opus
description: Avisar a Adrián cuando una tarea sea demasiado compleja para Sonnet y requiera Opus.
type: feedback
originSessionId: 91bfd2df-b15f-4167-9f93-14c5f048778c
---
Adrián usa Sonnet por defecto para ahorrar tokens y no tocar el límite de Claude Pro.

Cuando detectes que una tarea supera lo que Sonnet resuelve bien, avísale explícitamente:
> "Esta tarea es compleja — te recomiendo cambiar a Opus para este chat."

**Casos típicos que justifican el aviso:**
- Debugging complejo con mucho contexto (panel ~3300 líneas, múltiples archivos, bug difícil)
- Decisiones arquitectónicas grandes (migración auth, módulo empleados desde cero)
- Razonamiento encadenado muy largo o análisis estratégico profundo
- Sonnet lleva 2+ intentos sin resolver algo

**Why:** Adrián pasó a Sonnet como default (abr 2026) para reducir consumo. Quiere que yo gestione el aviso de cuándo subir, no tener que recordarlo él.

**How to apply:** Avisa antes de empezar la tarea, no a mitad. Si ya estás dentro y ves que se complica, avisa también.
