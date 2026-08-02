import 'package:flutter/material.dart';

import '../../theme/arrels_colors.dart';
import '../../theme/arrels_text_styles.dart';
import '../../tokens/arrels_spacing.dart';

/// `components/content/ListItem.d.ts`.
class ArrelsListItem extends StatelessWidget {
  const ArrelsListItem({
    super.key,
    this.leading,
    this.title,
    this.description,
    this.metadata,
    this.trailing,
    this.selected = false,
    this.onTap,
  });

  /// Typically an icon or [ArrelsAvatar].
  final Widget? leading;
  final Widget? title;
  final Widget? description;
  final Widget? metadata;
  final Widget? trailing;
  final bool selected;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    final colors = context.arrelsColors;

    return Material(
      color: selected ? colors.brandAccentSoft : Colors.transparent,
      borderRadius: BorderRadius.circular(ArrelsRadius.md),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(ArrelsRadius.md),
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: ArrelsSpacing.space4,
            vertical: ArrelsSpacing.space3,
          ),
          child: Row(
            children: [
              if (leading != null) ...[
                leading!,
                const SizedBox(width: ArrelsSpacing.space3),
              ],
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    if (title != null)
                      DefaultTextStyle(
                        style: ArrelsTextStyles.body.copyWith(
                          color: colors.contentPrimary,
                        ),
                        child: title!,
                      ),
                    if (description != null)
                      DefaultTextStyle(
                        style: ArrelsTextStyles.bodySmall.copyWith(
                          color: colors.contentSecondary,
                        ),
                        child: description!,
                      ),
                  ],
                ),
              ),
              if (metadata != null) ...[
                const SizedBox(width: ArrelsSpacing.space2),
                DefaultTextStyle(
                  style: ArrelsTextStyles.caption.copyWith(
                    color: colors.contentSecondary,
                  ),
                  child: metadata!,
                ),
              ],
              if (trailing != null) ...[
                const SizedBox(width: ArrelsSpacing.space2),
                trailing!,
              ],
            ],
          ),
        ),
      ),
    );
  }
}
