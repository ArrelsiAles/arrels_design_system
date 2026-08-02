import 'package:flutter/material.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';

import '../../theme/arrels_colors.dart';
import '../../theme/arrels_text_styles.dart';
import '../../tokens/arrels_spacing.dart';
import '../core/arrels_icon.dart';

enum ArrelsLinkVariant { inline, standalone }

/// `components/actions/Link.d.ts`. Callers own actual navigation — this
/// component only renders the affordance and calls [onTap].
class ArrelsLink extends StatelessWidget {
  const ArrelsLink({
    super.key,
    required this.label,
    this.onTap,
    this.variant = ArrelsLinkVariant.inline,
    this.external = false,
  });

  final String label;
  final VoidCallback? onTap;
  final ArrelsLinkVariant variant;
  final bool external;

  @override
  Widget build(BuildContext context) {
    final colors = context.arrelsColors;
    final style =
        (variant == ArrelsLinkVariant.inline
                ? ArrelsTextStyles.body
                : ArrelsTextStyles.label)
            .copyWith(
              color: colors.actionPrimaryBackground,
              decoration: variant == ArrelsLinkVariant.inline
                  ? TextDecoration.underline
                  : TextDecoration.none,
              decorationColor: colors.actionPrimaryBackground,
            );

    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: onTap,
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Flexible(
              child: Text(
                label,
                style: style,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            if (external) ...[
              const SizedBox(width: ArrelsSpacing.space1),
              ArrelsIcon(
                LucideIcons.arrowUpRight,
                size: ArrelsIconSize.sm,
                color: colors.actionPrimaryBackground,
              ),
            ],
          ],
        ),
      ),
    );
  }
}
