# ARRELS360 Pink Design System

Versión `0.1.0` de la base visual compartida de Arrels i Ales y ARRELS360.

Este directorio contiene la especificación humana neutral respecto a la tecnología. Define decisiones de diseño, contratos de componentes y patrones de producto para que una pantalla conserve la misma identidad al implementarse en web, Flutter u otra plataforma. Los valores machine-readable viven en [`../packages/tokens`](../packages/tokens/README.md).

La web Astro continúa siendo el laboratorio visual. Las rutas terracota y azul se conservan como exploraciones; **Precisión rosa** es la dirección aprobada y documentada aquí.

## Cómo leer el sistema

1. [`foundations/FOUNDATIONS.md`](foundations/FOUNDATIONS.md): color, tipografía, espacio, forma, elevación, movimiento y responsive.
2. [`../packages/tokens/`](../packages/tokens/README.md): valores machine-readable siguiendo la estructura de Design Tokens Community Group.
3. [`components/COMPONENTS.md`](components/COMPONENTS.md): contratos de los componentes compartidos.
4. [`patterns/PATTERNS.md`](patterns/PATTERNS.md): combinaciones propias del trabajo asistencial y operativo.
5. [`accessibility/ACCESSIBILITY.md`](accessibility/ACCESSIBILITY.md): mínimos no negociables.
6. [`claude/`](claude/): contexto listo para entregar a un agente de diseño.

## Capas

- **Foundations:** decisiones base que no conocen componentes.
- **Primitives:** valores literales; no deben utilizarse directamente en una pantalla.
- **Semantic tokens:** expresan intención, por ejemplo `color.action.primary.background`.
- **Component tokens:** concretan esa intención en un componente.
- **Patterns:** resuelven situaciones recurrentes de ARRELS360.
- **Templates y pantallas:** validan composición; no crean nuevas reglas.

Atomic Design se usa solo como referencia conceptual. La clasificación operativa del sistema se basa en intención, componentes y patrones, porque es más clara entre tecnologías y evita debates sobre si una pieza es átomo, molécula u organismo.

## Regla de implementación

Una tecnología puede adaptar navegación, tipografía dinámica o controles nativos, pero no puede cambiar silenciosamente la semántica, jerarquía, contraste, contenido o estado. Toda excepción debe documentarse como adaptación de plataforma.

## Estado

- Dirección aprobada: Precisión rosa.
- Modos: light y dark.
- Idiomas editoriales: mallorquín y castellano.
- Fuente UI: Inter, con fallback de sistema.
- Componentes: contratos neutrales compartidos.
- Adaptadores disponibles: Flutter en [`../packages/flutter`](../packages/flutter/README.md).
