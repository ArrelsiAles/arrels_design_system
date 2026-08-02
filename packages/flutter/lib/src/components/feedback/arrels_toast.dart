import 'package:flutter/material.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';

import '../../theme/arrels_colors.dart';
import '../../theme/arrels_text_styles.dart';
import '../../tokens/arrels_spacing.dart';
import 'arrels_alert.dart';
import '../core/arrels_icon.dart';

/// `components/feedback/Toast.d.ts`. Flutter has no standalone "toast"
/// primitive — [show] drives a [SnackBar] through the nearest
/// [ScaffoldMessenger] so it gets the platform's built-in 3-5s auto-dismiss
/// and `aria-live`-equivalent announcement behavior for free.
abstract final class ArrelsToast {
  static void show(
    BuildContext context, {
    required String message,
    ArrelsTone tone = ArrelsTone.success,
    String? actionLabel,
    VoidCallback? onAction,
    VoidCallback? onDismiss,
  }) {
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
    final icon = switch (tone) {
      ArrelsTone.info => LucideIcons.info,
      ArrelsTone.success => LucideIcons.circleCheck,
      ArrelsTone.warning => LucideIcons.triangleAlert,
      ArrelsTone.danger => LucideIcons.circleAlert,
    };

    ScaffoldMessenger.of(context)
      ..hideCurrentSnackBar()
      ..showSnackBar(
        SnackBar(
          duration: const Duration(seconds: 4),
          backgroundColor: background,
          behavior: SnackBarBehavior.floating,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(ArrelsRadius.md),
          ),
          onVisible: () {},
          content: Row(
            children: [
              ArrelsIcon(icon, color: foreground),
              const SizedBox(width: ArrelsSpacing.space2),
              Expanded(
                child: Text(
                  message,
                  style: ArrelsTextStyles.bodySmall.copyWith(
                    color: colors.contentPrimary,
                  ),
                ),
              ),
            ],
          ),
          action: actionLabel != null
              ? SnackBarAction(
                  label: actionLabel,
                  textColor: foreground,
                  onPressed: onAction ?? () {},
                )
              : null,
        ),
      ).closed.then((_) => onDismiss?.call());
  }

  const ArrelsToast._();
}
