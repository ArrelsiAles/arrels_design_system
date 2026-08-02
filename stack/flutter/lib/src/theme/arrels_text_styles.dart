import 'package:flutter/widgets.dart';

/// Type scale from `foundations/FOUNDATIONS.md` (Inter family).
///
/// Colors are intentionally omitted here — pair with [ArrelsColors] at the
/// call site (e.g. `.copyWith(color: context.arrelsColors.contentPrimary)`).
abstract final class ArrelsTextStyles {
  static const _family = 'Inter';

  static const display = TextStyle(
    fontFamily: _family,
    fontSize: 56,
    height: 64 / 56,
    fontWeight: FontWeight.w700,
  );
  static const h1 = TextStyle(
    fontFamily: _family,
    fontSize: 40,
    height: 48 / 40,
    fontWeight: FontWeight.w700,
  );
  static const h2 = TextStyle(
    fontFamily: _family,
    fontSize: 32,
    height: 40 / 32,
    fontWeight: FontWeight.w700,
  );
  static const h3 = TextStyle(
    fontFamily: _family,
    fontSize: 24,
    height: 32 / 24,
    fontWeight: FontWeight.w600,
  );
  static const title = TextStyle(
    fontFamily: _family,
    fontSize: 20,
    height: 28 / 20,
    fontWeight: FontWeight.w600,
  );
  static const bodyLarge = TextStyle(
    fontFamily: _family,
    fontSize: 18,
    height: 28 / 18,
    fontWeight: FontWeight.w400,
  );
  static const body = TextStyle(
    fontFamily: _family,
    fontSize: 16,
    height: 24 / 16,
    fontWeight: FontWeight.w400,
  );
  static const bodySmall = TextStyle(
    fontFamily: _family,
    fontSize: 14,
    height: 20 / 14,
    fontWeight: FontWeight.w400,
  );
  static const label = TextStyle(
    fontFamily: _family,
    fontSize: 14,
    height: 20 / 14,
    fontWeight: FontWeight.w600,
  );
  static const caption = TextStyle(
    fontFamily: _family,
    fontSize: 12,
    height: 16 / 12,
    fontWeight: FontWeight.w500,
  );
  static const data = TextStyle(
    fontFamily: _family,
    fontSize: 14,
    height: 20 / 14,
    fontWeight: FontWeight.w600,
    fontFeatures: [FontFeature.tabularFigures()],
  );

  const ArrelsTextStyles._();
}
