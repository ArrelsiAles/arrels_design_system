# Tokens

Los archivos usan la estructura DTCG (`$type`, `$value` y aliases entre llaves). Deben cargarse en este orden:

1. `primitives.tokens.json`
2. Uno de los modos: `semantic-light.tokens.json` o `semantic-dark.tokens.json`
3. `components.tokens.json`

Los adaptadores tecnológicos transforman esta fuente a CSS custom properties, Flutter `ThemeExtension`, Swift, Kotlin u otro formato. Flutter ya se genera parcialmente desde estos archivos mediante `npm run generate` desde la raíz del repositorio.

Regla: las pantallas consumen tokens semánticos o de componente; nunca primitives directamente.

## Validación

```bash
npm run check:tokens
```

El comando valida aliases y comprueba que los archivos Dart generados coinciden con esta fuente.
