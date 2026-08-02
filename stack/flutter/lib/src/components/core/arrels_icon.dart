import 'package:flutter/widgets.dart';

import '../../tokens/arrels_spacing.dart';

/// Thin wrapper around a Lucide [IconData] enforcing the brand's icon scale.
///
/// Unlike the web reference (which takes a string icon name and a variable
/// stroke width), Flutter icon fonts bake stroke weight into the glyph —
/// pass the [IconData] directly (e.g. `LucideIcons.calendarClock`) and use
/// [ArrelsIconSize] for `size`.
class ArrelsIcon extends StatelessWidget {
  const ArrelsIcon(
    this.icon, {
    super.key,
    this.size = ArrelsIconSize.md,
    this.color,
    this.semanticLabel,
  });

  final IconData icon;
  final double size;
  final Color? color;

  /// Accessible name. Leave null for decorative icons (paired with visible
  /// text elsewhere) so they stay hidden from assistive tech.
  final String? semanticLabel;

  @override
  Widget build(BuildContext context) {
    return Icon(
      icon,
      size: size,
      color: color,
      semanticLabel: semanticLabel,
    );
  }
}
