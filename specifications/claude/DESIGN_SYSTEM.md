# ARRELS360 · Contexto de diseño para Claude

ARRELS360 es el producto digital de Arrels i Ales, una empresa dedicada al cuidado, acompañamiento y coordinación de servicios para personas. El ecosistema incluye un admin operativo, una app para trabajadores y experiencias web/mobile para familias. Debe soportar planificación, visitas, fichaje, rutas, incidencias, evidencias, permisos, comunicación y seguimiento.

La identidad aprobada es **Precisión rosa**: minimalista, humana, moderna, clara y calmada. Combina densidad funcional tipo Notion/shadcn con precisión, profundidad y movimiento discretos de inspiración Apple. No debe parecer una app cosmética ni infantil.

## Fuentes de verdad

Lee en este orden:

1. `specifications/foundations/FOUNDATIONS.md`
2. `packages/tokens/src/primitives.tokens.json`
3. `packages/tokens/src/semantic-light.tokens.json` y `semantic-dark.tokens.json`
4. `packages/tokens/src/components.tokens.json`
5. `specifications/components/COMPONENTS.md`
6. `specifications/patterns/PATTERNS.md`
7. `specifications/accessibility/ACCESSIBILITY.md`

## Reglas esenciales

- Usa `#EF7EAD`/`#F08CAF` como rosa de marca, no como CTA con texto blanco pequeño.
- Usa `#C34880` con blanco para acciones primarias.
- Inter es la familia base; cuerpo 16 px en móvil y 14–16 px en web.
- Usa escala de 4 puntos, targets mínimos de 44×44 y una sola CTA primaria por pantalla.
- Diseña light y dark de forma explícita.
- No inventes datos, métricas, permisos, automatizaciones ni capacidades del producto.
- Diferencia admin denso, trabajador táctil y familia calmada sin romper la identidad.
- Los objetos enviados por chat son estructuras revisables, no simples burbujas decorativas.
- Incluye estados loading, empty, error, offline y disabled cuando correspondan.
- Usa iconos vectoriales outline; no emoji.
- El contenido debe poder redactarse en mallorquín y castellano sin truncarse.
