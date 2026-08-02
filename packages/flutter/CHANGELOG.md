## 0.1.5

* `dart format` fix on `arrels_link.dart` (0.1.4 CI failed the
  `dart format --set-exit-if-changed` check).

## 0.1.4

* Fix `ArrelsLink` overflowing in constrained layouts: its label `Text` now
  wraps in `Flexible` with `TextOverflow.ellipsis`, matching `ArrelsButton`.

## 0.1.3

* `ArrelsTextField` gains `initialValue` (like `TextFormField.initialValue`)
  for the common BLoC pattern of a stateless edit form seeded from cubit
  state with no controller. Internally now built on `TextFormField`.

## 0.1.2

* Reverted the 0.1.1 Material widget theming (`elevatedButtonTheme`,
  `dialogTheme`, `cardTheme`, `appBarTheme`, `snackBarTheme`, etc.). It papered
  over consuming apps still using raw `ElevatedButton`/`AlertDialog`/`Card`
  instead of `ArrelsButton`/`ArrelsDialog`/`ArrelsCard`. `ArrelsTheme` is
  intentionally back to only colors, text styles and `InputDecorationTheme` —
  a plain Material widget rendering unstyled is a signal to swap it for the
  matching `Arrels*` component, not something to theme away.

## 0.1.1

* `ArrelsTheme` now also themes the standard Material widgets (`ElevatedButton`,
  `FilledButton`, `OutlinedButton`, `TextButton`, `Card`, `Dialog`, `AppBar`,
  `SnackBar`) using the brand's tokens, not just `ArrelsColors`/`InputDecorationTheme`.
  Apps using plain Material buttons/dialogs get the correct look automatically;
  `Arrels*` components remain the recommended way to build new UI.

## 0.1.0

* Initial release: tokens (colors, spacing, radius, motion), `ArrelsTheme`
  light/dark, and the first batch of `Arrels*` components.
