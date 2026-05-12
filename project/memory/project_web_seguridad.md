---
name: Web Ritual — auditoría y pendientes
description: 15 fixes aplicados (17 abr 2026). Pendientes priorizados: RLS+Auth críticos, SEO, Performance, etc.
type: project
---
## Fixes aplicados (17 abr 2026)
CSP panel, headers seguridad, CORS restringido, escapeHTML en XSS points, sesión 8h, rate limiting, min password 8 chars, console.error gateado por `_DEV`.

## Pendientes priorizados

| # | Tarea | Prioridad |
|---|---|---|
| 1 | RLS Supabase (11 tablas) — sin esto anon key expuesta = BD abierta | **Crítica** |
| 2 | Migrar a Supabase Auth — reemplazar SHA-256+salt por signInWithPassword | **Crítica** |
| 3 | SEO técnico (meta, headers, sitemap, Search Console) | Alta |
| 4 | Schema.org (Restaurant, Menu, LocalBusiness) | Alta |
| 5 | Core Web Vitals (LCP/CLS — impacto Lenis/GSAP) | Alta |
| 6 | innerHTML masivo — todo dato Supabase por escapeHTML | Media |
| 7 | Accesibilidad básica (contraste, alt texts, teclado) | Media |
| 8 | Flujo conversión (CTA reserva, camino desde Google) | Media |
| 9 | Cloudflare Turnstile en login | Baja |

**How to apply:** Empezar siempre por #1+#2. No hacer auditoría SEO/perf antes de resolver seguridad crítica.
