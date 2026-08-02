# Changelog

## Unreleased

- El repositorio pasa a una arquitectura monorepo con documentación en `apps/docs`.
- La especificación humana se separa en `specifications`.
- Los tokens neutrales se convierten en el paquete `@arrels/design-tokens`.
- El adaptador Flutter se mueve a `packages/flutter` y puede consumirse mediante una dependencia Git con `path`.
- Los tokens Dart base se generan y validan desde la fuente neutral.
- CI valida documentación, aliases de tokens, formato, análisis y tests Flutter.
- El ZIP estático se retira; Git y los releases versionados pasan a ser el canal de distribución.

## 0.1.0 — 2026-08-01

- Se fija Precisión rosa como dirección aprobada sin eliminar las rutas exploratorias.
- Se separa el rosa de marca del rosa de acción accesible.
- Se documentan foundations light/dark, escalas y reglas responsive.
- Se publican tokens neutrales primitive, semantic y component.
- Se define el inventario de componentes y patrones de ARRELS360.
- Se añade un paquete de contexto e instrucciones para agentes de diseño.
