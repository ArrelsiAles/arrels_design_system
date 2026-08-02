## 0.1.11

* Fixed oversized text-field placeholders/labels/typed text: `ArrelsTheme`'s
  `InputDecorationTheme` never set `hintStyle`/`labelStyle`, so Material 3's
  default (`TextTheme.bodyLarge`, mapped here to the 18px "body-lg" token)
  applied — noticeably bigger than the intended 16px "body" size for form
  text. Added explicit `hintStyle`/`labelStyle`/`floatingLabelStyle` to the
  theme, and set an explicit `ArrelsTextStyles.body` style on the typed/hint
  text in `ArrelsTextField`, `ArrelsSelect` (including its dropdown items),
  and `ArrelsSearchField` instead of relying on the ambient default.

## 0.1.10

* Reverted 0.1.8: the regular border width token goes back to 1px
  (`dimension.border.default`). That change was based on a mixup — the
  "borders look too thick" feedback was actually about the *focus* border
  (fixed correctly in 0.1.9, which stays), not the regular one. Regular
  borders/dividers/text-field outlines are back to 1px.

## 0.1.9

* Lowered the focus border width token from 3px to 1px
  (`dimension.border.focus`, regenerated into `ArrelsBorderWidth.focus`) and
  wired `ArrelsTheme`'s `InputDecorationTheme.focusedBorder` to it instead of
  a hardcoded `2` — the focused-field ring was reported as too thick,
  separately from the regular (0.5px, see 0.1.8) border weight.

## 0.1.8

* Lowered the "regular" border width token from 1px to 0.5px
  (`packages/tokens/src/primitives.tokens.json`'s `dimension.border.default`,
  regenerated into `ArrelsBorderWidth.regular`) — the brand's borders,
  dividers and text-field outlines should read as subtle hairlines, not a
  full 1px stroke. Every component that draws a "regular" border
  (`ArrelsButton` secondary, `ArrelsCard`, `ArrelsCheckbox`, `ArrelsMenu`,
  `ArrelsIconButton` outline tone) and `ArrelsTheme`'s
  `InputDecorationTheme`/`DividerThemeData` now reference the token
  explicitly instead of relying on `BorderSide`'s implicit 1.0 default, so
  this one token change actually takes effect everywhere. Focus rings and
  the selected-card border stay at their own explicit weights (2-3px) —
  those are deliberate emphasis, not the "chrome" this change targets.

## 0.1.7

* Bundle real Inter font files (regular/medium/semibold/bold) as package
  assets instead of only naming `fontFamily: 'Inter'` in `ThemeData`. Without
  the actual glyphs, browsers/platforms were substituting a fallback font
  that renders visibly bolder/heavier at the same declared weight — this is
  what made text (and, by association, the whole UI) look "too black" or
  coarse. `pubspec.yaml`'s `flutter: fonts:` section is package-level, so
  consuming apps get Inter automatically, no per-app font declaration
  needed.
* `ArrelsMenu` gains a `tooltip` param (forwarded to the underlying
  `PopupMenuButton`) so callers don't need to build accessibility text into
  `trigger`. Documented that `trigger` must be presentational — an
  `ArrelsIconButton` (or anything else with its own `onPressed`) fights the
  `PopupMenuButton`'s own tap handling for the gesture.

## 0.1.6

* `ArrelsTheme` disables the Material splash/ripple globally
  (`splashFactory: NoSplash.splashFactory`, transparent `splashColor`/
  `highlightColor`). Every `Arrels*` component's `InkWell` reads this from
  `Theme` rather than setting its own factory, so this removes the ripple
  from all of them (and from any other Material widget in a consuming app).

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
