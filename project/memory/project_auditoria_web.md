---
name: Auditoría Web Ritual — estado y próximos pasos
description: Auditoría 7 agentes completada. Pendiente ejecutar los fixes priorizados.
type: project
originSessionId: 7cf9efee-3ac0-482f-96b9-b669823a478d
---
## Estado (2026-04-23)
Auditoría completa. Plan en `C:\Users\adria\Desktop\Claude\AUDITORIA_WEB_RITUAL.md`.

Todos los agentes completados: A1 SEO ✅ | A2 Schema ✅ | A3 Performance ✅ | A4 Funcional ✅ | A5 Accesibilidad ✅ | A6 Conversión ✅ | A7 Meta-Revisor ✅

## Top 5 fixes críticos (por impacto)
1. `functions/api.js` — no propaga method/body, POST/PUT silenciados a GET, updateSheet roto
2. Scripts síncronos sin `defer` — bloquean parser, LCP degradado
3. Accesibilidad — contraste insuficiente, falta `<main>`, elementos no navegables por teclado
4. `_redirects` — bloquea `/equipo` (301→/panel), turnos inaccesibles para staff
5. `index.html` — falta canonical, OG sin dimensiones

## Archivos más afectados
1. `index.html` — ~10 issues
2. `functions/api.js` — ~5 issues
3. `carta.html` — ~4 issues
4. `_redirects` — 2 críticos
5. `equipo/index.html` — 2 issues

## Próximo paso
Decidir con Adrián qué fixes ejecutar y en qué orden. Empezar por api.js + _redirects (funcionalidad rota).

**Why:** Adrián quiere revisar el análisis antes de ejecutar nada.
**How to apply:** Al retomar, preguntar qué fixes priorizar antes de tocar ningún archivo.
