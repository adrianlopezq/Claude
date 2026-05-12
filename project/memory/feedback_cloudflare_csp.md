---
name: Cloudflare CSP bloquea CDN externos
description: Nunca usar CDN externos para JS en Deploy — la CSP de Cloudflare los bloquea
type: feedback
originSessionId: dc6d996c-b823-4911-bd93-7d3d8ea6c820
---
Nunca cargar librerías JS desde CDN externos (jsdelivr, unpkg, cdnjs) en el deploy de Cloudflare Pages.

**Why:** La CSP de Cloudflare bloquea `script-src` externos con error "violates Content Security Policy". Rompe toda la web en producción aunque funcione en local.

**How to apply:** Siempre descargar los archivos `.min.js` localmente con `curl` y servirlos desde `Deploy/js/`. Usar rutas relativas sin `/` inicial para que funcionen tanto en local como en Cloudflare.
