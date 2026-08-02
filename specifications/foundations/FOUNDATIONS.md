# Foundations · Precisión rosa

## Principios

1. **Humana:** hablamos de personas y necesidades, no de expedientes.
2. **Precisa:** estado, responsable, momento y consecuencia son visibles.
3. **Calmada:** la densidad se organiza; no se oculta ni se decora.
4. **Confiable:** una acción crítica siempre confirma qué ocurrirá.
5. **Moderna:** profundidad, movimiento y detalle son funcionales y discretos.

## Color

El rosa tiene dos funciones deliberadamente separadas:

- `brand.accent` — `#EF7EAD` en light y `#F08CAF` en dark. Identidad, ilustración, selección suave y detalles de marca. No admite texto blanco pequeño.
- `action.primary` — `#C34880` en ambos modos. CTA, checkbox seleccionado y progreso interactivo. Con blanco alcanza 4.61:1 y cumple WCAG AA para texto normal.

No sustituir `action.primary` por `brand.accent` aunque visualmente parezcan cercanos. El primero es un par de contraste; el segundo, una expresión de marca.

### Light

| Rol | Valor | Uso |
|---|---:|---|
| Canvas | `#F0F0F5` | Fondo global |
| Surface | `#FAFAFE` | Regiones de contenido |
| Raised | `#FFFFFF` | Cards, menús, diálogos |
| Subtle | `#E8E8F1` | Agrupación y selección neutra |
| Text primary | `#0C0D13` | Titulares y cuerpo |
| Text secondary | `#666874` | Metadatos y ayuda |
| Border | `#D8D9E2` | Divisores y controles |
| Brand accent | `#EF7EAD` | Identidad y detalles |
| Action primary | `#C34880` | Acciones con texto blanco |
| Focus ring | `#B73570` | Foco visible |

### Dark

| Rol | Valor | Uso |
|---|---:|---|
| Canvas | `#090A0F` | Fondo global |
| Surface | `#11121A` | Regiones de contenido |
| Raised | `#171821` | Cards, menús, diálogos |
| Subtle | `#1D1E29` | Agrupación neutra |
| Text primary | `#F8F8FB` | Titulares y cuerpo |
| Text secondary | `#9697A4` | Metadatos y ayuda |
| Border | `#2C2E3B` | Divisores y controles |
| Brand accent | `#F08CAF` | Identidad y detalles |
| Action primary | `#C34880` | Acciones con texto blanco |
| Focus ring | `#F08CAF` | Foco visible sobre oscuro |

Los estados success, warning, danger e info siempre combinan color con icono o texto. Nunca se comunica un estado exclusivamente por color.

## Tipografía

Familia: `Inter`, seguida por la fuente sans-serif del sistema. Se usa una única familia para mantener consistencia entre administración, trabajadores y familias.

| Rol | Tamaño / línea | Peso | Uso |
|---|---|---:|---|
| Display | 56/64 desktop, 40/48 mobile | 700 | Portadas, nunca en UI densa |
| Heading 1 | 40/48 desktop, 32/40 mobile | 700 | Título de página |
| Heading 2 | 32/40 desktop, 28/36 mobile | 700 | Sección principal |
| Heading 3 | 24/32 | 650 | Card o bloque complejo |
| Title | 20/28 | 650 | Card, modal, sheet |
| Body large | 18/28 | 400 | Mensajes humanos destacados |
| Body | 16/24 | 400 | Texto base y móvil |
| Body small | 14/20 | 400 | Tablas y metadatos |
| Label | 14/20 | 600 | Controles |
| Caption | 12/16 | 500 | Información auxiliar no crítica |
| Data | 14/20 | 550 | Horas, métricas y tablas; cifras tabulares |

El cuerpo productivo nunca baja de 14 px en web ni de 16 px en móvil. Los tamaños menores vistos dentro de mockups escalados no son tokens válidos.

## Espacio, tamaño y grid

- Base: 4 puntos.
- Escala: `0, 4, 8, 12, 16, 24, 32, 40, 48, 64, 80, 96`.
- Target táctil: mínimo 44×44 pt; se recomienda 48×48 dp en Android.
- Input y botón estándar: 44 px web, 48 px móvil.
- Gutter: 16 px teléfono, 24 px tablet, 32 px desktop, 48 px desktop ancho.
- Contenido de lectura: máximo 720 px.
- Contenido administrativo: máximo 1440 px, con sidebar adaptativa.

Breakpoints de referencia: 375, 768, 1024 y 1440 px. Son puntos de validación, no condiciones para ocultar contenido esencial.

## Forma, bordes y elevación

- Radio small 8 px: tags y controles compactos.
- Radio medium 12 px: inputs y botones.
- Radio large 20 px: cards y sheets.
- Radio xlarge 28 px: superficies editoriales o de marca.
- Pill 999 px: badges y controles segmentados.
- Borde estándar 1 px. No usar bordes dobles como decoración.
- Elevación 0: estructuras y tablas.
- Elevación 1: card interactiva o sticky toolbar.
- Elevación 2: menú, popover y sheet.
- Elevación 3: diálogo crítico.
- Blur solo para scrims, overlays o barras que cubren contenido; nunca como ornamento gratuito.

## Iconografía

- Estilo outline, esquinas redondeadas, stroke 1.75–2 px.
- Tamaños visuales: 16, 20, 24 y 32 px.
- Los iconos interactivos viven dentro de targets de al menos 44×44.
- Un icono sin etiqueta visible requiere nombre accesible.
- No usar emoji como iconografía estructural.

## Movimiento

- Instantáneo: 80 ms, feedback de pulsación.
- Rápido: 160 ms, hover, focus, selección.
- Estándar: 240 ms, popover, expansión y cambio de estado.
- Complejo: 360 ms máximo, sheet o cambio contextual.
- Entrada: `cubic-bezier(0.16, 1, 0.3, 1)`.
- Salida: `cubic-bezier(0.4, 0, 1, 1)`.
- Respetar reduced motion: eliminar desplazamiento y conservar una transición breve de opacidad.

## Densidad

- **Admin:** compacta pero legible. Filas de tabla de 44–52 px, filtros persistentes y acciones secundarias agrupadas.
- **Trabajadores:** táctil y operativa. Una acción primaria por pantalla, estado offline siempre visible cuando aplica.
- **Familias:** calmada. Más espacio vertical, lenguaje directo y detalle bajo demanda.

