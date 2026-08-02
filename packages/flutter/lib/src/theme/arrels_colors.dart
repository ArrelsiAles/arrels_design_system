import 'package:flutter/material.dart';

import '../tokens/arrels_primitive_colors.dart';

/// Semantic color roles (`tokens/semantic-{light,dark}.tokens.json`).
///
/// Components consume these, never [ArrelsPrimitiveColors] directly. Access
/// via `context.arrelsColors` (see the `BuildContext` extension below) once
/// [ArrelsTheme] has registered it as a [ThemeExtension].
@immutable
class ArrelsColors extends ThemeExtension<ArrelsColors> {
  const ArrelsColors({
    required this.surfaceCanvas,
    required this.surfaceDefault,
    required this.surfaceRaised,
    required this.surfaceSubtle,
    required this.surfaceInverse,
    required this.contentPrimary,
    required this.contentSecondary,
    required this.contentInverse,
    required this.contentDisabled,
    required this.borderDefault,
    required this.borderStrong,
    required this.borderFocus,
    required this.brandAccent,
    required this.brandAccentSoft,
    required this.brandOnAccentLarge,
    required this.actionPrimaryBackground,
    required this.actionPrimaryForeground,
    required this.actionPrimaryHover,
    required this.actionPrimaryDisabled,
    required this.actionSecondaryBackground,
    required this.actionSecondaryForeground,
    required this.actionSecondaryBorder,
    required this.successForeground,
    required this.successBackground,
    required this.warningForeground,
    required this.warningBackground,
    required this.dangerForeground,
    required this.dangerBackground,
    required this.infoForeground,
    required this.infoBackground,
  });

  final Color surfaceCanvas;
  final Color surfaceDefault;
  final Color surfaceRaised;
  final Color surfaceSubtle;
  final Color surfaceInverse;

  final Color contentPrimary;
  final Color contentSecondary;
  final Color contentInverse;
  final Color contentDisabled;

  final Color borderDefault;
  final Color borderStrong;
  final Color borderFocus;

  /// Identity/illustration accent only — never as a small-text-on-white
  /// background; use [actionPrimaryBackground] for CTAs (see ACCESSIBILITY.md).
  final Color brandAccent;
  final Color brandAccentSoft;
  final Color brandOnAccentLarge;

  final Color actionPrimaryBackground;
  final Color actionPrimaryForeground;
  final Color actionPrimaryHover;
  final Color actionPrimaryDisabled;

  final Color actionSecondaryBackground;
  final Color actionSecondaryForeground;
  final Color actionSecondaryBorder;

  final Color successForeground;
  final Color successBackground;
  final Color warningForeground;
  final Color warningBackground;
  final Color dangerForeground;
  final Color dangerBackground;
  final Color infoForeground;
  final Color infoBackground;

  static const light = ArrelsColors(
    surfaceCanvas: ArrelsPrimitiveColors.neutral50,
    surfaceDefault: ArrelsPrimitiveColors.neutral25,
    surfaceRaised: ArrelsPrimitiveColors.neutral0,
    surfaceSubtle: ArrelsPrimitiveColors.neutral100,
    surfaceInverse: ArrelsPrimitiveColors.neutral1000,
    contentPrimary: ArrelsPrimitiveColors.neutral1000,
    contentSecondary: ArrelsPrimitiveColors.neutral500,
    contentInverse: ArrelsPrimitiveColors.neutral0,
    contentDisabled: ArrelsPrimitiveColors.neutral300,
    borderDefault: ArrelsPrimitiveColors.neutral200,
    borderStrong: ArrelsPrimitiveColors.neutral300,
    borderFocus: ArrelsPrimitiveColors.pink700,
    brandAccent: ArrelsPrimitiveColors.pink400,
    brandAccentSoft: ArrelsPrimitiveColors.pink50,
    brandOnAccentLarge: ArrelsPrimitiveColors.neutral1000,
    actionPrimaryBackground: ArrelsPrimitiveColors.pink600,
    actionPrimaryForeground: ArrelsPrimitiveColors.neutral0,
    actionPrimaryHover: ArrelsPrimitiveColors.pink700,
    actionPrimaryDisabled: ArrelsPrimitiveColors.neutral200,
    actionSecondaryBackground: ArrelsPrimitiveColors.neutral0,
    actionSecondaryForeground: ArrelsPrimitiveColors.neutral1000,
    actionSecondaryBorder: ArrelsPrimitiveColors.neutral300,
    successForeground: ArrelsPrimitiveColors.green700,
    successBackground: ArrelsPrimitiveColors.green100,
    warningForeground: ArrelsPrimitiveColors.amber700,
    warningBackground: ArrelsPrimitiveColors.amber100,
    dangerForeground: ArrelsPrimitiveColors.red700,
    dangerBackground: ArrelsPrimitiveColors.red100,
    infoForeground: ArrelsPrimitiveColors.indigo700,
    infoBackground: ArrelsPrimitiveColors.indigo100,
  );

  static const dark = ArrelsColors(
    surfaceCanvas: ArrelsPrimitiveColors.neutral950,
    surfaceDefault: ArrelsPrimitiveColors.neutral900,
    surfaceRaised: ArrelsPrimitiveColors.neutral875,
    surfaceSubtle: ArrelsPrimitiveColors.neutral850,
    surfaceInverse: ArrelsPrimitiveColors.neutral25,
    contentPrimary: ArrelsPrimitiveColors.neutral25,
    contentSecondary: ArrelsPrimitiveColors.neutral600,
    contentInverse: ArrelsPrimitiveColors.neutral1000,
    contentDisabled: ArrelsPrimitiveColors.neutral700,
    borderDefault: ArrelsPrimitiveColors.neutral800,
    borderStrong: ArrelsPrimitiveColors.neutral700,
    borderFocus: ArrelsPrimitiveColors.pink300,
    brandAccent: ArrelsPrimitiveColors.pink300,
    brandAccentSoft: ArrelsPrimitiveColors.pink900,
    brandOnAccentLarge: ArrelsPrimitiveColors.neutral1000,
    actionPrimaryBackground: ArrelsPrimitiveColors.pink600,
    actionPrimaryForeground: ArrelsPrimitiveColors.neutral0,
    actionPrimaryHover: ArrelsPrimitiveColors.pink700,
    actionPrimaryDisabled: ArrelsPrimitiveColors.neutral800,
    actionSecondaryBackground: ArrelsPrimitiveColors.neutral875,
    actionSecondaryForeground: ArrelsPrimitiveColors.neutral25,
    actionSecondaryBorder: ArrelsPrimitiveColors.neutral700,
    successForeground: ArrelsPrimitiveColors.green400,
    successBackground: ArrelsPrimitiveColors.green900,
    warningForeground: ArrelsPrimitiveColors.amber400,
    warningBackground: ArrelsPrimitiveColors.amber900,
    dangerForeground: ArrelsPrimitiveColors.red400,
    dangerBackground: ArrelsPrimitiveColors.red900,
    infoForeground: ArrelsPrimitiveColors.indigo400,
    infoBackground: ArrelsPrimitiveColors.indigo900,
  );

  @override
  ArrelsColors copyWith({
    Color? surfaceCanvas,
    Color? surfaceDefault,
    Color? surfaceRaised,
    Color? surfaceSubtle,
    Color? surfaceInverse,
    Color? contentPrimary,
    Color? contentSecondary,
    Color? contentInverse,
    Color? contentDisabled,
    Color? borderDefault,
    Color? borderStrong,
    Color? borderFocus,
    Color? brandAccent,
    Color? brandAccentSoft,
    Color? brandOnAccentLarge,
    Color? actionPrimaryBackground,
    Color? actionPrimaryForeground,
    Color? actionPrimaryHover,
    Color? actionPrimaryDisabled,
    Color? actionSecondaryBackground,
    Color? actionSecondaryForeground,
    Color? actionSecondaryBorder,
    Color? successForeground,
    Color? successBackground,
    Color? warningForeground,
    Color? warningBackground,
    Color? dangerForeground,
    Color? dangerBackground,
    Color? infoForeground,
    Color? infoBackground,
  }) {
    return ArrelsColors(
      surfaceCanvas: surfaceCanvas ?? this.surfaceCanvas,
      surfaceDefault: surfaceDefault ?? this.surfaceDefault,
      surfaceRaised: surfaceRaised ?? this.surfaceRaised,
      surfaceSubtle: surfaceSubtle ?? this.surfaceSubtle,
      surfaceInverse: surfaceInverse ?? this.surfaceInverse,
      contentPrimary: contentPrimary ?? this.contentPrimary,
      contentSecondary: contentSecondary ?? this.contentSecondary,
      contentInverse: contentInverse ?? this.contentInverse,
      contentDisabled: contentDisabled ?? this.contentDisabled,
      borderDefault: borderDefault ?? this.borderDefault,
      borderStrong: borderStrong ?? this.borderStrong,
      borderFocus: borderFocus ?? this.borderFocus,
      brandAccent: brandAccent ?? this.brandAccent,
      brandAccentSoft: brandAccentSoft ?? this.brandAccentSoft,
      brandOnAccentLarge: brandOnAccentLarge ?? this.brandOnAccentLarge,
      actionPrimaryBackground:
          actionPrimaryBackground ?? this.actionPrimaryBackground,
      actionPrimaryForeground:
          actionPrimaryForeground ?? this.actionPrimaryForeground,
      actionPrimaryHover: actionPrimaryHover ?? this.actionPrimaryHover,
      actionPrimaryDisabled:
          actionPrimaryDisabled ?? this.actionPrimaryDisabled,
      actionSecondaryBackground:
          actionSecondaryBackground ?? this.actionSecondaryBackground,
      actionSecondaryForeground:
          actionSecondaryForeground ?? this.actionSecondaryForeground,
      actionSecondaryBorder:
          actionSecondaryBorder ?? this.actionSecondaryBorder,
      successForeground: successForeground ?? this.successForeground,
      successBackground: successBackground ?? this.successBackground,
      warningForeground: warningForeground ?? this.warningForeground,
      warningBackground: warningBackground ?? this.warningBackground,
      dangerForeground: dangerForeground ?? this.dangerForeground,
      dangerBackground: dangerBackground ?? this.dangerBackground,
      infoForeground: infoForeground ?? this.infoForeground,
      infoBackground: infoBackground ?? this.infoBackground,
    );
  }

  @override
  ArrelsColors lerp(ThemeExtension<ArrelsColors>? other, double t) {
    if (other is! ArrelsColors) return this;
    Color c(Color a, Color b) => Color.lerp(a, b, t)!;
    return ArrelsColors(
      surfaceCanvas: c(surfaceCanvas, other.surfaceCanvas),
      surfaceDefault: c(surfaceDefault, other.surfaceDefault),
      surfaceRaised: c(surfaceRaised, other.surfaceRaised),
      surfaceSubtle: c(surfaceSubtle, other.surfaceSubtle),
      surfaceInverse: c(surfaceInverse, other.surfaceInverse),
      contentPrimary: c(contentPrimary, other.contentPrimary),
      contentSecondary: c(contentSecondary, other.contentSecondary),
      contentInverse: c(contentInverse, other.contentInverse),
      contentDisabled: c(contentDisabled, other.contentDisabled),
      borderDefault: c(borderDefault, other.borderDefault),
      borderStrong: c(borderStrong, other.borderStrong),
      borderFocus: c(borderFocus, other.borderFocus),
      brandAccent: c(brandAccent, other.brandAccent),
      brandAccentSoft: c(brandAccentSoft, other.brandAccentSoft),
      brandOnAccentLarge: c(brandOnAccentLarge, other.brandOnAccentLarge),
      actionPrimaryBackground: c(
        actionPrimaryBackground,
        other.actionPrimaryBackground,
      ),
      actionPrimaryForeground: c(
        actionPrimaryForeground,
        other.actionPrimaryForeground,
      ),
      actionPrimaryHover: c(actionPrimaryHover, other.actionPrimaryHover),
      actionPrimaryDisabled: c(
        actionPrimaryDisabled,
        other.actionPrimaryDisabled,
      ),
      actionSecondaryBackground: c(
        actionSecondaryBackground,
        other.actionSecondaryBackground,
      ),
      actionSecondaryForeground: c(
        actionSecondaryForeground,
        other.actionSecondaryForeground,
      ),
      actionSecondaryBorder: c(
        actionSecondaryBorder,
        other.actionSecondaryBorder,
      ),
      successForeground: c(successForeground, other.successForeground),
      successBackground: c(successBackground, other.successBackground),
      warningForeground: c(warningForeground, other.warningForeground),
      warningBackground: c(warningBackground, other.warningBackground),
      dangerForeground: c(dangerForeground, other.dangerForeground),
      dangerBackground: c(dangerBackground, other.dangerBackground),
      infoForeground: c(infoForeground, other.infoForeground),
      infoBackground: c(infoBackground, other.infoBackground),
    );
  }
}

extension ArrelsColorsContext on BuildContext {
  /// Shorthand for the current [ArrelsColors], e.g. `context.arrelsColors`.
  ArrelsColors get arrelsColors => Theme.of(this).extension<ArrelsColors>()!;
}
