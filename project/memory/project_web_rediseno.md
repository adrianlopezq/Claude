---
name: project_web_rediseno
description: Rediseño web Ritual Burger — hero full-screen con fondo fijo, tipografía masiva, scroll-driven storytelling con GSAP ScrollTrigger
type: project
---
Inspiración: https://www.eathungrytiger.com/

**Why:** La web anterior tenía grid 50/50 hero. El rediseño implementa scroll-driven storytelling con fondo fijo y tipografía masiva estilo editorial.

## Implementado (abr 2026)

### Fondo fijo
- `#hero-fixed-bg`: `position: fixed; inset: 0; z-index: 0` — imagen `contenidoExtra1_ExtendedInverted.png`
- El hero es transparente, las secciones con fondo sólido lo tapan al scrollear

### Hero
- Full-screen: `height: 100vh`, imagen de fondo fija visible a través del hero transparente
- Overlay gradiente fuerte (`rgba(13,13,13,0.95)` abajo → transparent arriba) para legibilidad
- `padding-top: 7rem` en `#hero` para que flex-end no choque con la nav
- Tipografía: `clamp(3.5rem, 10vw, 11rem)`, weight 900, 2 líneas: "No es solo / una *burger.*"
- Eyebrow en flujo normal, justo encima del título
- CTAs en columna, `min-width: 220px`: "Reservar mesa" + "Ver carta" + "Pedir para recoger" (`left: 6vw`)
- Animaciones entrada con delay escalonado 0.8s–1.4s via `body.loaded`

### Secciones
- `#panel-reserva`, `#panel-manifiesto`: `background: var(--black)` (tapan fondo fijo)
- `.panel-content`: `background: transparent`
- `#carta-section`, `#reviews-section`: `background: transparent` (fondo fijo visible a través)

## Pendiente
- Scroll-driven GSAP scrub en hero (parallax de elementos según scroll)
- Sección diferenciadores: "carne fresca · sin congelados · smash en plancha · hecho al momento"
- Separadores dotted entre secciones

**How to apply:** Abrir sesión en Web/. El fondo fijo ya está. Próximo paso: diferenciadores + dotted separators.
