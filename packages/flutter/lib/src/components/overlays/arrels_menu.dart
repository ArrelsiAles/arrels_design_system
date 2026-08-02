import 'package:flutter/material.dart';

import '../../theme/arrels_colors.dart';
import '../../theme/arrels_text_styles.dart';
import '../../tokens/arrels_spacing.dart';
import '../core/arrels_icon.dart';

class ArrelsMenuItem {
  const ArrelsMenuItem({
    required this.value,
    required this.label,
    this.icon,
    this.shortcut,
    this.danger = false,
    this.divider = false,
  });

  final String value;
  final String label;
  final IconData? icon;
  final String? shortcut;
  final bool danger;

  /// Renders a divider above this item instead of the item itself.
  final bool divider;
}

/// `components/overlays/Menu.d.ts`. Wraps [PopupMenuButton] so the trigger
/// can be any widget (icon button, avatar, list item trailing, ...).
///
/// [trigger] must be a purely presentational widget (an icon, an avatar —
/// not an [ArrelsIconButton] or another tappable widget): [PopupMenuButton]
/// already wraps it in its own tap handling, and nesting another
/// interactive widget inside fights it for the gesture. Pass [tooltip] for
/// the trigger's accessible name instead of building it into [trigger].
class ArrelsMenu extends StatelessWidget {
  const ArrelsMenu({
    super.key,
    required this.items,
    required this.trigger,
    this.onSelected,
    this.tooltip,
  });

  final List<ArrelsMenuItem> items;
  final Widget trigger;
  final ValueChanged<String>? onSelected;
  final String? tooltip;

  @override
  Widget build(BuildContext context) {
    final colors = context.arrelsColors;

    return PopupMenuButton<String>(
      tooltip: tooltip,
      color: colors.surfaceRaised,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(ArrelsRadius.md),
        side: BorderSide(
          color: colors.borderDefault,
          width: ArrelsBorderWidth.regular,
        ),
      ),
      onSelected: onSelected,
      itemBuilder: (context) => [
        for (final item in items)
          if (item.divider)
            const PopupMenuDivider()
          else
            PopupMenuItem<String>(
              value: item.value,
              child: Row(
                children: [
                  if (item.icon != null) ...[
                    ArrelsIcon(
                      item.icon!,
                      size: ArrelsIconSize.sm,
                      color: item.danger
                          ? colors.dangerForeground
                          : colors.contentPrimary,
                    ),
                    const SizedBox(width: ArrelsSpacing.space2),
                  ],
                  Expanded(
                    child: Text(
                      item.label,
                      style: ArrelsTextStyles.body.copyWith(
                        color: item.danger
                            ? colors.dangerForeground
                            : colors.contentPrimary,
                      ),
                    ),
                  ),
                  if (item.shortcut != null)
                    Text(
                      item.shortcut!,
                      style: ArrelsTextStyles.caption.copyWith(
                        color: colors.contentSecondary,
                      ),
                    ),
                ],
              ),
            ),
      ],
      child: trigger,
    );
  }
}
