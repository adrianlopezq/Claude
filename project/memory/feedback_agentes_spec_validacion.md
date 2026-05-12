---
name: Agentes externos — spec + validación automática
description: Protocolo obligatorio al trabajar con agentes externos (OpenRouter, kimi, deepseek, etc.)
type: feedback
originSessionId: 22c35708-e083-49ef-bb82-0619ccc823c8
---
Siempre que se trabaje con uno o más agentes externos, seguir este protocolo sin excepción.

## Parte 1 — Spec estructurada (no prompt en prosa)

Claude genera una spec exacta antes de mandar al agente. Formato obligatorio:

- **TAREA**: qué hacer en una línea
- **REGLAS**: lista de cambios exactos con estructuras HTML/CSS/JS concretas
- **PROHIBIDO**: lista de lo que NO debe hacer el agente
- **INPUT**: código exacto a reemplazar (líneas o bloques)
- **OUTPUT esperado**: estructura esperada del resultado

Nunca enviar descripción en prosa. Siempre restricciones explícitas y ejemplos de lo que NO hacer.

## Parte 2 — validate.js junto con cada tarea

Junto con el prompt/spec, Claude genera un script `validate.js` que verifica el output del agente antes de que Claude lo revise. Checks típicos:

- IDs duplicados en HTML
- Elementos que debían eliminarse siguen presentes
- Estructura esperada ausente
- Selectores CSS que ya no aplican

Flujo:
1. Agente devuelve output
2. Usuario corre `node validate.js`
3. Si falla → Claude recibe solo el error específico, no el output completo
4. Si pasa → Claude aplica directamente sin revisión profunda

## Por qué

Sin spec precisa, los agentes cometen errores semánticos (IDs duplicados, posicionamiento roto) que Claude tiene que corregir consumiendo tokens extra. La validación mecánica elimina ese coste antes de que Claude vea el output.

**How to apply:** En cualquier sesión donde se use `call_openrouter` o similar, aplicar ambas partes antes de lanzar el agente.
