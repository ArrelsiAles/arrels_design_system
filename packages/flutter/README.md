# arrels_design_system_flutter

Flutter implementation of the ARRELS360 "Precisió rosa" design system —
tokens, theme and `Arrels*` components shared across the admin, worker and
family apps. The human specification lives in `../../specifications` and the
machine-readable source of truth lives in `../tokens/src`. This package is the
Flutter adapter for those shared decisions.

## Usage

Point at a versioned Git tag from an app's `pubspec.yaml`:

```yaml
dependencies:
  arrels_design_system_flutter:
    git:
      url: https://github.com/ArrelsiAles/arrels_design_system.git
      ref: <release-tag>
      path: packages/flutter
```

Replace `<release-tag>` with a published repository tag. Production apps
must not track `main` directly.

For local development, use the package path:

```yaml
dependencies:
  arrels_design_system_flutter:
    path: ../arrels_design_system/packages/flutter
```

Wire the theme in `MaterialApp`:

```dart
MaterialApp(
  theme: ArrelsTheme.light(),
  darkTheme: ArrelsTheme.dark(),
  ...
)
```

Read semantic colors from any `BuildContext` via `context.arrelsColors`
(never hardcode a hex or reach for `ArrelsPrimitiveColors` directly outside
the theme layer itself):

```dart
Container(color: context.arrelsColors.surfaceCanvas)
```

Components follow the `Arrels`-prefixed naming convention and mirror the
contracts documented in `../../specifications/components/COMPONENTS.md`:

```dart
ArrelsButton(
  label: 'Desa',
  variant: ArrelsButtonVariant.primary,
  iconStart: LucideIcons.check,
  onPressed: () {},
)
```

## What's included (v0.1.0)

- **Tokens**: colors (primitives + light/dark semantic), spacing/radius/
  control/icon/border scales, typography, motion durations/easings.
- **Theme**: `ArrelsTheme.light()` / `.dark()` building a full `ThemeData`,
  with `ArrelsColors` registered as a `ThemeExtension`.
- **Actions**: `ArrelsButton`, `ArrelsIconButton`, `ArrelsLink`.
- **Forms**: `ArrelsField`, `ArrelsTextField` (input + textarea),
  `ArrelsSelect`, `ArrelsSearchField`, `ArrelsCheckbox`, `ArrelsRadio`,
  `ArrelsSwitch`.
- **Feedback**: `ArrelsAlert`, `ArrelsBadge`, `ArrelsToast`, `ArrelsProgress`,
  `ArrelsSkeleton`, `ArrelsEmptyState`, `ArrelsOfflineState`.
- **Content**: `ArrelsAvatar`, `ArrelsCard`, `ArrelsListItem`,
  `ArrelsMetricCard`.
- **Navigation**: `ArrelsPagination`, `ArrelsTabs`.
- **Overlays**: `ArrelsDialog` (+ `.show`/`.confirm` helpers), `ArrelsMenu`.

Icons are passed as Lucide `IconData` (from `lucide_icons_flutter`) rather
than string names — Flutter icon fonts bake stroke weight into the glyph,
so there's no runtime "stroke width" knob like the web reference has.

Inter (regular/medium/semibold/bold, `fonts/inter/*.ttf`, SIL Open Font
License 1.1) ships as a package asset — consuming apps get the real
typeface automatically via `ArrelsTheme`'s `fontFamily: 'Inter'`, no extra
`pubspec.yaml` font declaration needed. Without the actual glyphs bundled,
`fontFamily: 'Inter'` alone just falls back to the platform's default sans
at each declared weight, which reads noticeably bolder/heavier than the
real Inter regular.

## Deferred to a later pass

Documented in the design system but not yet built here — add following the
same pattern (token-driven, `Arrels`-prefixed, matching the `.d.ts` contract
in the DesignSync "ARRELS360 Design System" project) when a consuming app
needs one:

- Navigation: `ArrelsSidebar`, `ArrelsTopBar`, `ArrelsBreadcrumb`,
  `ArrelsBottomNavigation` (arrelsiales_admin currently has its own
  hand-built `AppSidebar`/`ShellHeader` — migrating those onto shared
  components is a candidate follow-up, not done automatically here).
- Overlays: `ArrelsSheet`, `ArrelsPopover`, `ArrelsTooltip`.
- Content: `ArrelsAccordion`, `ArrelsTimeline`.
- Forms: `ArrelsCombobox`, `ArrelsDatePicker`, `ArrelsTimePicker`,
  `ArrelsFileUpload`.
- Data: `ArrelsTable`, `ArrelsFilterBar`, `ArrelsToolbar`,
  `ArrelsChartContainer`, `ArrelsSchedule`.
- Domain-specific ARRELS360 components (`VisitCard`, `RouteStop`,
  `IncidentCard`, `SharedPlanMessage`, `ChatComposer`, `EvidenceCard`,
  `SyncQueue`, `FamilyAccessRow`, `ClockAction`) — these are product
  compositions, not generic design-system primitives; consider whether
  they belong in this package at all vs. as feature-local widgets in each
  app.
