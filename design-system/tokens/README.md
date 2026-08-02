# Tokens

Los archivos usan la estructura DTCG (`$type`, `$value` y aliases entre llaves). Deben cargarse en este orden:

1. `primitives.tokens.json`
2. Uno de los modos: `semantic-light.tokens.json` o `semantic-dark.tokens.json`
3. `components.tokens.json`

Los adapters tecnológicos futuros pueden transformar esta fuente a CSS custom properties, Flutter `ThemeExtension`, Swift, Kotlin u otro formato. Esta versión no contiene esos adapters.

Regla: las pantallas consumen tokens semánticos o de componente; nunca primitives directamente.

