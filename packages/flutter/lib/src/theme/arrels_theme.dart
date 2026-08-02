import 'package:flutter/cupertino.dart' show CupertinoPageTransitionsBuilder;
import 'package:flutter/material.dart';

import '../tokens/arrels_spacing.dart';
import 'arrels_colors.dart';
import 'arrels_text_styles.dart';

/// Rounded rectangle shape at the given [radius], reused across the
/// button/card/dialog theme defaults below.
RoundedRectangleBorder _shape(double radius, [BorderSide side = BorderSide.none]) {
  return RoundedRectangleBorder(
    borderRadius: BorderRadius.circular(radius),
    side: side,
  );
}

/// Builds the app-level [ThemeData] for light/dark, registering
/// [ArrelsColors] as a [ThemeExtension] so every `Arrels*` component (and
/// any app screen) can read semantic colors via `context.arrelsColors`.
abstract final class ArrelsTheme {
  static ThemeData light() => _build(Brightness.light, ArrelsColors.light);

  static ThemeData dark() => _build(Brightness.dark, ArrelsColors.dark);

  static ThemeData _build(Brightness brightness, ArrelsColors colors) {
    final textTheme = TextTheme(
      displayLarge: ArrelsTextStyles.display.copyWith(
        color: colors.contentPrimary,
      ),
      headlineLarge: ArrelsTextStyles.h1.copyWith(color: colors.contentPrimary),
      headlineMedium: ArrelsTextStyles.h2.copyWith(
        color: colors.contentPrimary,
      ),
      headlineSmall: ArrelsTextStyles.h3.copyWith(color: colors.contentPrimary),
      titleLarge: ArrelsTextStyles.title.copyWith(color: colors.contentPrimary),
      bodyLarge: ArrelsTextStyles.bodyLarge.copyWith(
        color: colors.contentPrimary,
      ),
      bodyMedium: ArrelsTextStyles.body.copyWith(color: colors.contentPrimary),
      bodySmall: ArrelsTextStyles.bodySmall.copyWith(
        color: colors.contentSecondary,
      ),
      labelLarge: ArrelsTextStyles.label.copyWith(color: colors.contentPrimary),
      labelSmall: ArrelsTextStyles.caption.copyWith(
        color: colors.contentSecondary,
      ),
    );

    return ThemeData(
      useMaterial3: true,
      brightness: brightness,
      scaffoldBackgroundColor: colors.surfaceCanvas,
      canvasColor: colors.surfaceCanvas,
      fontFamily: 'Inter',
      colorScheme: ColorScheme(
        brightness: brightness,
        primary: colors.actionPrimaryBackground,
        onPrimary: colors.actionPrimaryForeground,
        secondary: colors.actionSecondaryBackground,
        onSecondary: colors.actionSecondaryForeground,
        error: colors.dangerForeground,
        onError: colors.contentInverse,
        surface: colors.surfaceRaised,
        onSurface: colors.contentPrimary,
      ),
      textTheme: textTheme,
      dividerColor: colors.borderDefault,
      focusColor: colors.borderFocus,
      splashFactory: InkRipple.splashFactory,
      visualDensity: VisualDensity.standard,
      extensions: [colors],
      pageTransitionsTheme: const PageTransitionsTheme(
        builders: {
          TargetPlatform.android: FadeUpwardsPageTransitionsBuilder(),
          TargetPlatform.iOS: CupertinoPageTransitionsBuilder(),
          TargetPlatform.macOS: CupertinoPageTransitionsBuilder(),
          TargetPlatform.linux: FadeUpwardsPageTransitionsBuilder(),
          TargetPlatform.windows: FadeUpwardsPageTransitionsBuilder(),
        },
      ),
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: colors.surfaceRaised,
        contentPadding: const EdgeInsets.symmetric(
          horizontal: ArrelsSpacing.space4,
          vertical: ArrelsSpacing.space3,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: colors.borderDefault),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: colors.borderDefault),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: colors.borderFocus, width: 2),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: colors.dangerForeground),
        ),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: colors.actionPrimaryBackground,
          foregroundColor: colors.actionPrimaryForeground,
          disabledBackgroundColor: colors.actionPrimaryDisabled,
          minimumSize: const Size(0, ArrelsControlSize.md),
          shape: _shape(ArrelsRadius.md),
          textStyle: ArrelsTextStyles.label,
        ),
      ),
      filledButtonTheme: FilledButtonThemeData(
        style: FilledButton.styleFrom(
          backgroundColor: colors.actionPrimaryBackground,
          foregroundColor: colors.actionPrimaryForeground,
          disabledBackgroundColor: colors.actionPrimaryDisabled,
          minimumSize: const Size(0, ArrelsControlSize.md),
          shape: _shape(ArrelsRadius.md),
          textStyle: ArrelsTextStyles.label,
        ),
      ),
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
          foregroundColor: colors.actionSecondaryForeground,
          backgroundColor: colors.actionSecondaryBackground,
          minimumSize: const Size(0, ArrelsControlSize.md),
          side: BorderSide(color: colors.actionSecondaryBorder),
          shape: _shape(ArrelsRadius.md),
          textStyle: ArrelsTextStyles.label,
        ),
      ),
      textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(
          foregroundColor: colors.contentPrimary,
          minimumSize: const Size(0, ArrelsControlSize.md),
          shape: _shape(ArrelsRadius.md),
          textStyle: ArrelsTextStyles.label,
        ),
      ),
      cardTheme: CardThemeData(
        color: colors.surfaceRaised,
        elevation: 0,
        margin: EdgeInsets.zero,
        shape: _shape(ArrelsRadius.lg, BorderSide(color: colors.borderDefault)),
      ),
      dialogTheme: DialogThemeData(
        backgroundColor: colors.surfaceRaised,
        shape: _shape(ArrelsRadius.lg),
      ),
      appBarTheme: AppBarTheme(
        backgroundColor: colors.surfaceRaised,
        foregroundColor: colors.contentPrimary,
        elevation: 0,
        surfaceTintColor: Colors.transparent,
      ),
      snackBarTheme: SnackBarThemeData(
        backgroundColor: colors.surfaceInverse,
        contentTextStyle: ArrelsTextStyles.bodySmall.copyWith(
          color: colors.contentInverse,
        ),
        shape: _shape(ArrelsRadius.md),
        behavior: SnackBarBehavior.floating,
      ),
    );
  }
}
