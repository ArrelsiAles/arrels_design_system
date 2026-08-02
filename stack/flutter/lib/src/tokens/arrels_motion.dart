import 'package:flutter/animation.dart';

/// Motion durations and easings (`tokens/primitives.tokens.json` `motion.*`).
abstract final class ArrelsMotion {
  static const instant = Duration(milliseconds: 80);
  static const fast = Duration(milliseconds: 160);
  static const standard = Duration(milliseconds: 240);
  static const complex = Duration(milliseconds: 360);

  static const enterCurve = Cubic(0.16, 1, 0.3, 1);
  static const exitCurve = Cubic(0.4, 0, 1, 1);

  const ArrelsMotion._();
}
