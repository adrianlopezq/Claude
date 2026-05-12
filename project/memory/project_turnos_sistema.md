---
name: Sistema de turnos semanales
description: Reglas asignación, equipo activo, bug UTC, balance socios.
type: project
originSessionId: 77707ff8-aa95-418b-b4f9-5e7915939f02
---
## Equipo activo
hugo, maria, carla, omar, mario, adrián. (Marta y Aitana fuera.)

## Plantilla turnos
- Jue noche: 3 | Vie noche: 5 | Sáb mediodía: 3 | Sáb noche: 5 | Dom mediodía: 3 | Dom noche: 4

## Reglas asignación
- omar → siempre plancha
- carla → prep prioritario; empaqu si no puede; NUNCA plancha; NO trabaja jueves
- maria → prep (menor prioridad que carla); empaqu cuando carla ocupa prep
- hugo → cualquier cocina; camarero solo con adrián/mario
- mario/adrián → preferencia camarero; cubren cualquier puesto
- adrián → no trabaja jueves (sin excepciones); puede trabajar todos los demás turnos sin límite

## Objetivo turnos/semana
omar:4 · maría:3 · hugo:3 · carla:3-5 · mario:máx · adrián:todos los necesarios (no mínimo). No añadir personas extra al template.

## Flujo semanal
Prompt: "Disponibles: X,X. Ausencias: X. Notas: X"
Tabla `turnos`: empleado=username, fecha=YYYY-MM-DD, turno=comida|cena, rol=cocina|sala.
**CRÍTICO:** Restar 1 día a todas las fechas antes de insertar en Supabase (bug UTC). `_getWeekStartForDate` usa `T12:00:00`.

## Balance socios
Cuenta turnos mario/adrián desde 2026-03-30. Miércoles recogida en tabla `miercoles_recogida`.
fecha = toISO(dates[0]) = fecha del jueves (UTC -1 día). Saldos en tabla `saldos_socios`.

## Bugs pendientes (2026-04-30)
- **Contador socios no suma turnos recién subidos**: turnos se visualizan correctos pero el contador mario/adrián del panel no los contabiliza. Investigar query/filtro fecha en sesión Panel/.
- **Saldar turnos**: comportamiento por verificar antes de pulsarlo. Confirmar si solo inserta en `saldos_socios` o además limpia `turnos`.

## Valor económico turno (acordado 2026-04-30)
4h × 9€/h = **36€/turno**. Usado en PDF compensación socios sep–mar (Mario +10) y abril (Adrián +5). Pendiente acordar nº turnos miércoles sep–mar.
