import 'package:flutter/material.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';

import '../../theme/arrels_colors.dart';
import '../../theme/arrels_text_styles.dart';
import '../../tokens/arrels_spacing.dart';
import '../core/arrels_icon.dart';

enum ArrelsBadgeTone { neutral, info, success, warning, danger, brand }

/// `components/feedback/Badge.d.ts`. Include the status word in [label] —
/// color alone must never be the only signal (ACCESSIBILITY.md).
class ArrelsBadge extends StatelessWidget {
  const ArrelsBadge({
    super.key,
    required this.label,
    this.tone = ArrelsBadgeTone.neutral,
    this.icon,
    this.showIcon = false,
  });

  final String label;
  final ArrelsBadgeTone tone;
  final IconData? icon;
  final bool showIcon;

  IconData get _defaultIcon => switch (tone) {
        ArrelsBadgeTone.neutral => LucideIcons.circle,
        ArrelsBadgeTone.info => LucideIcons.info,
        ArrelsBadgeTone.success => LucideIcons.circleCheck,
        ArrelsBadgeTone.warning => LucideIcons.triangleAlert,
        ArrelsBadgeTone.danger => LucideIcons.circleAlert,
        ArrelsBadgeTone.brand => LucideIcons.sparkles,
      };

  @override
  Widget build(BuildContext context) {
    final colors = context.arrelsColors;
    final (background, foreground) = switch (tone) {
      ArrelsBadgeTone.neutral => (colors.surfaceSubtle, colors.contentSecondary),
      ArrelsBadgeTone.info => (colors.infoBackground, colors.infoForeground),
      ArrelsBadgeTone.success => (colors.successBackground, colors.successForeground),
      ArrelsBadgeTone.warning => (colors.warningBackground, colors.warningForeground),
      ArrelsBadgeTone.danger => (colors.dangerBackground, colors.dangerForeground),
      ArrelsBadgeTone.brand => (colors.brandAccentSoft, colors.brandOnAccentLarge),
    };

    return Container(
      height: ArrelsSpacing.space6,
      padding: const EdgeInsets.symmetric(horizontal: ArrelsSpacing.space2),
      decoration: BoxDecoration(
        color: background,
        borderRadius: BorderRadius.circular(ArrelsRadius.pill),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (showIcon) ...[
            ArrelsIcon(icon ?? _defaultIcon, size: ArrelsIconSize.sm, color: foreground),
            const SizedBox(width: ArrelsSpacing.space1),
          ],
          Text(label, style: ArrelsTextStyles.caption.copyWith(color: foreground)),
        ],
      ),
    );
  }
}
