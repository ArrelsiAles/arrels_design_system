## 0.1.1

* `ArrelsTheme` now also themes the standard Material widgets (`ElevatedButton`,
  `FilledButton`, `OutlinedButton`, `TextButton`, `Card`, `Dialog`, `AppBar`,
  `SnackBar`) using the brand's tokens, not just `ArrelsColors`/`InputDecorationTheme`.
  Apps using plain Material buttons/dialogs get the correct look automatically;
  `Arrels*` components remain the recommended way to build new UI.

## 0.1.0

* Initial release: tokens (colors, spacing, radius, motion), `ArrelsTheme`
  light/dark, and the first batch of `Arrels*` components.
