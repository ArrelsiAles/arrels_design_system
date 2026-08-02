# Accesibilidad

Estos requisitos forman parte del contrato del sistema, no son recomendaciones opcionales.

## Contraste

- Texto normal: mínimo 4.5:1.
- Texto grande y elementos gráficos esenciales: mínimo 3:1.
- `#C34880` + `#FFFFFF`: 4.61:1, par autorizado para acciones primarias.
- `#EF7EAD` y `#F08CAF`: no autorizados como fondo de texto blanco pequeño.
- Texto secundario debe mantenerse al menos en 4.5:1 cuando contiene información necesaria; 3:1 solo para metadatos verdaderamente auxiliares.

## Interacción

- Target mínimo 44×44; separación recomendada 8 px.
- Foco visible de 3 px con offset de 2 px.
- Orden de tabulación igual al orden visual.
- Ninguna acción depende exclusivamente de hover, swipe o drag.
- Estados disabled usan semántica nativa y no reciben interacción.

## Contenido y estado

- Label visible para cada campo; placeholder no sustituye al label.
- Error junto al campo, explicando causa y recuperación.
- Loading, empty, offline, success y failure se diseñan explícitamente.
- Color siempre acompañado por texto, icono o forma.
- Actualizaciones asíncronas relevantes se anuncian sin robar el foco.

## Responsive y texto

- Zoom no desactivado.
- Sin scroll horizontal en 375 px salvo tablas deliberadamente contenidas y etiquetadas.
- Dynamic Type o escalado al 200% no oculta acciones ni información.
- Navegación fija reserva safe areas e insets de contenido.
- `prefers-reduced-motion` y equivalentes nativos deben respetarse.

## Checklist de aceptación

- Light y dark probados por separado.
- Teclado completo en web.
- VoiceOver/TalkBack sobre flujos críticos.
- Estados de error no dependen solo del rojo.
- Charts incluyen resumen textual o tabla equivalente.
- Fechas, horas y números respetan el locale.

