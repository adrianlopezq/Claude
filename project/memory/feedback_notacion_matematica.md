---
name: Notación matemática en PDFs y respuestas
description: Adrián exige ecuaciones matemáticas reales, no notación de ordenador en una línea
type: feedback
originSessionId: a1e3c654-d9c0-4291-8918-afffe2649828
---
Cuando se generan PDFs con contenido matemático o se escriben ecuaciones en respuestas, usar siempre notación matemática correcta con sus símbolos correspondientes (σ², λ, ∫, ≤, →, fracciones en vertical, etc.).

**Why:** Adrián lo señaló explícitamente al ver ecuaciones escritas en notación de ordenador (sigma^2, integral f(x)dx en una línea, etc.) en lugar de ecuaciones tipografiadas correctamente.

**How to apply:**
- En PDFs: usar matplotlib mathtext para renderizar ecuaciones como imágenes con símbolos reales
- En el chat: NO escribir ecuaciones en ASCII (ni cajas con barras, ni `sigma^2`, ni LaTeX `$$...$$` que no se renderiza). Las ecuaciones van SIEMPRE en HTML con MathJax para que se rendericen.
- Si hay que mostrar una ecuación durante una explicación, añadirla al HTML del proyecto y pedir al usuario que recargue.
- En texto plano del chat solo se permiten símbolos Unicode sueltos (σ², λ, →) en frases cortas, nunca ecuaciones completas.
