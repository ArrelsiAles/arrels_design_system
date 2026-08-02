# ARRELS360 Design System

Monorepo del sistema de diseño compartido de Arrels i Ales y ARRELS360. Contiene la especificación neutral, los tokens, los paquetes consumibles por tecnología y la web pública de documentación.

## Estructura

```text
apps/docs/           Web Astro de documentación
packages/tokens/     Fuente de verdad machine-readable
packages/flutter/    Paquete consumible por aplicaciones Flutter
specifications/      Foundations, componentes, patrones y accesibilidad
tooling/             Generadores y validaciones entre tecnologías
```

Cada aplicación o paquete es dueño de su propio `src` o `lib/src`. No existe un `src` global del repositorio.

## Fuente de verdad

Los valores base viven en [`packages/tokens/src`](packages/tokens/src). Los adaptadores tecnológicos no deben mantener copias manuales: se generan o validan contra esos archivos.

```bash
npm run generate       # Regenera los tokens Flutter
npm run check:tokens   # Falla si Flutter no coincide con los tokens
```

Las decisiones humanas y contratos de componentes viven en [`specifications`](specifications/README.md).

## Documentación web

```bash
npm ci
npm run dev
npm run check:docs
npm run build:pages
```

La aplicación Astro vive en [`apps/docs`](apps/docs). GitHub Pages publica únicamente su `dist`.

## Flutter

Desde otro repositorio:

```yaml
dependencies:
  arrels_design_system_flutter:
    git:
      url: https://github.com/ArrelsiAles/arrels_design_system.git
      ref: <release-tag>
      path: packages/flutter
```

Durante desarrollo local:

```yaml
dependencies:
  arrels_design_system_flutter:
    path: ../arrels_design_system/packages/flutter
```

Sustituye `<release-tag>` por un tag publicado después de integrar esta estructura. Las aplicaciones deben fijar un tag o commit; no deben depender de `main` en producción.

Para validar el paquete:

```bash
cd packages/flutter
flutter pub get
dart format --output=none --set-exit-if-changed .
dart analyze
flutter test
```

## Añadir una tecnología

Una implementación nueva se crea en `packages/<tecnologia>` solamente cuando exista una API consumible real. Las demos y playgrounds deben vivir en `examples/`, no dentro de `packages/`.

El primer release mantiene una versión sincronizada para tokens y adaptadores. El versionado independiente se pospone hasta que los stacks tengan ritmos de publicación distintos.
