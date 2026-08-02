import 'package:flutter/material.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';

import '../../theme/arrels_colors.dart';
import '../../theme/arrels_text_styles.dart';
import '../../tokens/arrels_spacing.dart';
import '../actions/arrels_button.dart';
import '../core/arrels_icon.dart';

enum ArrelsDialogTone { default_, danger }

/// `components/overlays/Dialog.d.ts`. [show] wraps [showDialog] so callers
/// don't need to build the scrim/panel chrome themselves.
class ArrelsDialog extends StatelessWidget {
  const ArrelsDialog({
    super.key,
    this.title,
    this.description,
    this.tone = ArrelsDialogTone.default_,
    this.actions,
    this.width = 480,
    this.child,
  });

  final String? title;

  /// What will happen if the person confirms.
  final String? description;
  final ArrelsDialogTone tone;

  /// Buttons, primary last.
  final List<Widget>? actions;
  final double width;
  final Widget? child;

  static Future<T?> show<T>(
    BuildContext context, {
    String? title,
    String? description,
    ArrelsDialogTone tone = ArrelsDialogTone.default_,
    List<Widget>? actions,
    double width = 480,
    Widget? child,
  }) {
    return showDialog<T>(
      context: context,
      builder: (_) => ArrelsDialog(
        title: title,
        description: description,
        tone: tone,
        actions: actions,
        width: width,
        child: child,
      ),
    );
  }

  /// Convenience for the common "confirm this irreversible/risky action"
  /// pattern: resolves `true` on confirm, `null`/`false` on cancel/dismiss.
  static Future<bool> confirm(
    BuildContext context, {
    required String title,
    required String description,
    String confirmLabel = 'Confirmar',
    String cancelLabel = 'Cancel·lar',
    ArrelsDialogTone tone = ArrelsDialogTone.default_,
  }) async {
    final result = await show<bool>(
      context,
      title: title,
      description: description,
      tone: tone,
      actions: [
        Builder(
          builder: (context) => ArrelsButton(
            label: cancelLabel,
            variant: ArrelsButtonVariant.secondary,
            onPressed: () => Navigator.of(context).pop(false),
          ),
        ),
        Builder(
          builder: (context) => ArrelsButton(
            label: confirmLabel,
            variant: tone == ArrelsDialogTone.danger
                ? ArrelsButtonVariant.destructive
                : ArrelsButtonVariant.primary,
            onPressed: () => Navigator.of(context).pop(true),
          ),
        ),
      ],
    );
    return result ?? false;
  }

  @override
  Widget build(BuildContext context) {
    final colors = context.arrelsColors;

    return Dialog(
      backgroundColor: colors.surfaceRaised,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(ArrelsRadius.lg),
      ),
      child: ConstrainedBox(
        constraints: BoxConstraints(maxWidth: width),
        child: Padding(
          padding: const EdgeInsets.all(ArrelsSpacing.space6),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              if (title != null)
                Row(
                  children: [
                    if (tone == ArrelsDialogTone.danger) ...[
                      ArrelsIcon(
                        LucideIcons.triangleAlert,
                        color: colors.dangerForeground,
                      ),
                      const SizedBox(width: ArrelsSpacing.space2),
                    ],
                    Expanded(
                      child: Text(
                        title!,
                        style: ArrelsTextStyles.h3.copyWith(
                          color: colors.contentPrimary,
                        ),
                      ),
                    ),
                  ],
                ),
              if (description != null)
                Padding(
                  padding: const EdgeInsets.only(top: ArrelsSpacing.space2),
                  child: Text(
                    description!,
                    style: ArrelsTextStyles.body.copyWith(
                      color: colors.contentSecondary,
                    ),
                  ),
                ),
              if (child != null)
                Padding(
                  padding: const EdgeInsets.only(top: ArrelsSpacing.space4),
                  child: child,
                ),
              if (actions != null)
                Padding(
                  padding: const EdgeInsets.only(top: ArrelsSpacing.space6),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      for (final (i, action) in actions!.indexed) ...[
                        if (i > 0) const SizedBox(width: ArrelsSpacing.space2),
                        action,
                      ],
                    ],
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
