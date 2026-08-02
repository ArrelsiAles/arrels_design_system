# arrels_design_system_flutter

Flutter implementation of the ARRELS360 "Precisió rosa" design system —
tokens, theme and `Arrels*` components shared across the admin, worker and
family apps. Source of truth for the design decisions themselves lives in
`../arrels_design_system/design-system` (foundations, components, tokens,
accessibility, patterns) — this package is the Flutter adapter for it.

## Usage

Point at it as a path dependency from an app's `pubspec.yaml`:

```yaml
dependencies:
  arrels_design_system_flutter:
    path: ../arrels_design_system_flutter
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
prop contracts documented in the design system's DesignSync project
(`components/**/*.d.ts`):

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
