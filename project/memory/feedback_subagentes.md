---
name: Prohibición subagentes Claude
description: Nunca usar múltiples subagentes Claude simultáneos — solo OpenRouter vía MCP
type: feedback
originSessionId: 7cf9efee-3ac0-482f-96b9-b669823a478d
---
NUNCA lanzar más de 1 subagente Claude (Agent tool) a la vez. Está prohibido salvo que Adrián lo diga explícitamente o sea absolutamente imprescindible.

**Why:** Los subagentes Claude consumen tokens del contexto principal. Con 6-7 subagentes en paralelo, Adrián se queda sin tokens y no puede seguir trabajando.

**How to apply:** Para auditorías, análisis o tareas paralelas → usar siempre `call_openrouter` vía MCP con modelos económicos (Kimi, DeepSeek, Gemini Flash). Si se necesita un subagente Claude, máximo 1 y de forma secuencial, nunca en paralelo.
