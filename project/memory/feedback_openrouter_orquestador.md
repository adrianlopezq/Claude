---
name: feedback_openrouter_orquestador
description: Adrián quiere actuar como orquestador — las implementaciones se delegan a agentes OpenRouter, no las ejecuta Claude directamente
type: feedback
originSessionId: 07c2fd7b-da55-424b-bfa1-f9589c1e6a1c
---
Cuando el usuario pida implementar algo (código, diseño, features), el rol de Claude es **orquestador y supervisor**, no ejecutor directo.

**Why:** El usuario tiene acceso a `mcp__mcp-agents__call_openrouter` y quiere ese modelo de trabajo donde Claude coordina y delega la ejecución a subagentes externos.

**How to apply:** Ante cualquier tarea de implementación, usar `mcp__mcp-agents__call_openrouter` con el modelo más adecuado, pasarle el briefing técnico completo (contexto del codebase, restricciones, output esperado), y aplicar/revisar el resultado. Claude no ejecuta la implementación por su cuenta aunque pueda hacerlo.

**Refuerzo (22 abr 2026):** El usuario lo ha corregido dos veces en la misma sesión. Si el agente devuelve una respuesta cortada o incorrecta, la solución es **ajustar el prompt y reintentar**, nunca implementar directamente. Sin excepciones.

**Refuerzo (22 abr 2026, segunda sesión):** El usuario lo recuerda explícitamente al inicio de sesión. Aplicar desde el primer cambio, sin necesidad de corrección. Siempre delegar, incluso cuando la tarea parece trivial.
