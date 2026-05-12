---
name: MCP Agentes — OpenRouter como subagente
description: MCP server operativo. Claude orquesta, subagentes ejecutan via OpenRouter.
type: project
originSessionId: 7cf9efee-3ac0-482f-96b9-b669823a478d
---
## Arquitectura
Claude Code (orquestador) → `call_openrouter(model, prompt)` → OpenRouter API
MCP: `C:/Users/adria/.claude/mcp-agents/index.js` | Keys en `~/.claude.json`

## Routing de modelos
| Tarea | Modelo | Coste |
|---|---|---|
| HTML/CSS/UI, tareas rápidas | `google/gemini-2.0-flash-001` | GRATIS |
| Razonamiento estratégico (sin prisa) | `deepseek/deepseek-r1:free` | GRATIS |
| Contenido largo español, marketing | `qwen/qwen3-235b-a22b:free` | GRATIS |
| JS medio-complejo, refactors sin contexto Ritual | `deepseek/deepseek-chat-v3-0324` | ~$0.14/M |
| JS muy complejo | `moonshotai/kimi-k2.6` | ~$0.15/M |

**Regla: 80% tareas → modelo FREE.**
Claude siempre hace: bugs panel Ritual, Supabase, fichaje, turnos, auth, decisiones arquitectura.
**API keys:** OpenRouter renovada el 2026-04-23 (key anterior eliminada). Gemini pendiente renovar.
