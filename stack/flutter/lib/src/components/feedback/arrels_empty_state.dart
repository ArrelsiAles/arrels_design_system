import 'package:flutter/material.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';

import '../../theme/arrels_colors.dart';
import '../../theme/arrels_text_styles.dart';
import '../../tokens/arrels_spacing.dart';
import '../core/arrels_icon.dart';

/// `components/feedback/EmptyState.d.ts`. [description] should explain WHY
/// it's empty (no results vs. nothing created yet vs. permission-denied),
/// not just restate "no data".
class ArrelsEmptyState extends StatelessWidget {
  const ArrelsEmptyState({
    super.key,
    this.icon = LucideIcons.inbox,
    this.title,
    this.description,
    this.action,
  });

  final IconData icon;
  final String? title;
  final String? description;

  /// At most one action, e.g. an [ArrelsButton].
  final Widget? action;

  @override
  Widget build(BuildContext context) {
    final colors = context.arrelsColors;

    return Center(
      child: Padding(
        padding: const EdgeInsets.all(ArrelsSpacing.space8),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ArrelsIcon(icon, size: ArrelsIconSize.xl, color: colors.contentSecondary),
            const SizedBox(height: ArrelsSpacing.space4),
            if (title != null)
              Text(
                title!,
                textAlign: TextAlign.center,
                style: ArrelsTextStyles.title.copyWith(color: colors.contentPrimary),
              ),
            if (description != null)
              Padding(
                padding: const EdgeInsets.only(top: ArrelsSpacing.space2),
                child: Text(
                  description!,
                  textAlign: TextAlign.center,
                  style: ArrelsTextStyles.bodySmall.copyWith(
                    color: colors.contentSecondary,
                  ),
                ),
              ),
            if (action != null)
              Padding(
                padding: const EdgeInsets.only(top: ArrelsSpacing.space6),
                child: action,
              ),
          ],
        ),
      ),
    );
  }
}
