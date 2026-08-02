import 'package:flutter/material.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';

import '../../theme/arrels_colors.dart';
import '../../theme/arrels_text_styles.dart';
import '../../tokens/arrels_spacing.dart';
import '../actions/arrels_icon_button.dart';
import '../core/arrels_icon.dart';

enum ArrelsTone { info, success, warning, danger }

enum ArrelsAlertVariant { inline, page }

/// `components/feedback/Alert.d.ts`.
class ArrelsAlert extends StatelessWidget {
  const ArrelsAlert({
    super.key,
    this.tone = ArrelsTone.info,
    this.title,
    this.message,
    this.action,
    this.onDismiss,
    this.variant = ArrelsAlertVariant.inline,
  });

  final ArrelsTone tone;
  final String? title;
  final String? message;
  final Widget? action;
  final VoidCallback? onDismiss;
  final ArrelsAlertVariant variant;

  IconData get _icon => switch (tone) {
    ArrelsTone.info => LucideIcons.info,
    ArrelsTone.success => LucideIcons.circleCheck,
    ArrelsTone.warning => LucideIcons.triangleAlert,
    ArrelsTone.danger => LucideIcons.circleAlert,
  };

  @override
  Widget build(BuildContext context) {
    final colors = context.arrelsColors;
    final (background, foreground) = switch (tone) {
      ArrelsTone.info => (colors.infoBackground, colors.infoForeground),
      ArrelsTone.success => (
        colors.successBackground,
        colors.successForeground,
      ),
      ArrelsTone.warning => (
        colors.warningBackground,
        colors.warningForeground,
      ),
      ArrelsTone.danger => (colors.dangerBackground, colors.dangerForeground),
    };

    return Container(
      padding: const EdgeInsets.all(ArrelsSpacing.space4),
      decoration: BoxDecoration(
        color: background,
        borderRadius: BorderRadius.circular(
          variant == ArrelsAlertVariant.page
              ? ArrelsRadius.lg
              : ArrelsRadius.md,
        ),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ArrelsIcon(_icon, color: foreground),
          const SizedBox(width: ArrelsSpacing.space3),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                if (title != null)
                  Text(
                    title!,
                    style: ArrelsTextStyles.label.copyWith(color: foreground),
                  ),
                if (message != null)
                  Padding(
                    padding: EdgeInsets.only(
                      top: title != null ? ArrelsSpacing.space1 : 0,
                    ),
                    child: Text(
                      message!,
                      style: ArrelsTextStyles.bodySmall.copyWith(
                        color: colors.contentPrimary,
                      ),
                    ),
                  ),
                if (action != null)
                  Padding(
                    padding: const EdgeInsets.only(top: ArrelsSpacing.space3),
                    child: action,
                  ),
              ],
            ),
          ),
          if (onDismiss != null)
            ArrelsIconButton(
              icon: LucideIcons.x,
              label: 'Tancar',
              size: ArrelsIconButtonSize.small,
              onPressed: onDismiss,
            ),
        ],
      ),
    );
  }
}
