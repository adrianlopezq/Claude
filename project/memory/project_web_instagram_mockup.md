---
name: project_web_instagram_mockup
description: Sección Instagram web Ritual — mockup iPhone 17 Pro Max con imágenes reales. Estado y pendientes al 22 abr 2026.
type: project
originSessionId: 07c2fd7b-da55-424b-bfa1-f9589c1e6a1c
---
Sección Instagram de index.html rediseñada como perfil real de Instagram dentro de un mockup de iPhone.

**Why:** Mejorar autenticidad vs el feed genérico anterior. El cliente quería que pareciera la app real de Instagram.

**Estado al 22 abr 2026 (actualizado):**
- Mockup iPhone funcional: Dynamic Island flotando en pantalla, titanio gradiente, botones físicos laterales, aspect-ratio 1320/2868 (17 Pro Max)
- Imágenes reales descargadas localmente: `imagenes/ig_post1-9.jpg` + `imagenes/ig_profile.jpg` (ig_post5.jpg falló → usa Dorada.webp de fallback)
- Status bar: 15:00, iconos iPhone exactos (señal 4 barras, WiFi 2 arcos+punto, batería con terminal)
- **Statusbar corregida (22 abr):** `align-items: center`, `height: 54px`, `padding: 0 22px 0 57px`. DI centrado vertical con `top:50%; transform:translate(-50%,-50%)`. Fuente Inter (tabular-nums) cargada desde Google Fonts. Todo deployado a Cloudflare.

**Pendiente:**
- ig_post5.jpg usa Dorada.webp de fallback — reemplazar cuando se tenga imagen válida de ese post (foto croquetas/pasta Mar 25)

**How to apply:** Al continuar esta tarea, el archivo a editar es `C:/Users/adria/Desktop/RITUAL/Web/Deploy/index.html`. Las imágenes IG locales están en `imagenes/ig_post*.jpg`.
