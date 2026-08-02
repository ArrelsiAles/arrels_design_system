import 'package:flutter/material.dart';

import '../../theme/arrels_colors.dart';
import '../../theme/arrels_text_styles.dart';
import '../../tokens/arrels_spacing.dart';

enum ArrelsCardVariant { static_, interactive, selectable }

/// `components/content/Card.d.ts`.
class ArrelsCard extends StatelessWidget {
  const ArrelsCard({
    super.key,
    required this.child,
    this.variant = ArrelsCardVariant.static_,
    this.selected = false,
    this.elevation,
    this.onTap,
    this.title,
    this.meta,
  });

  final ArrelsCardVariant variant;
  final bool selected;

  /// Force an elevation level 0-3; otherwise derived from [variant].
  final int? elevation;
  final VoidCallback? onTap;
  final Widget? title;

  /// Small right-aligned metadata next to [title].
  final Widget? meta;
  final Widget child;

  int get _elevation =>
      elevation ?? (variant == ArrelsCardVariant.static_ ? 0 : 1);

  @override
  Widget build(BuildContext context) {
    final colors = context.arrelsColors;
    final borderColor = selected ? colors.borderFocus : colors.borderDefault;

    final content = Padding(
      padding: const EdgeInsets.all(ArrelsSpacing.space6),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          if (title != null)
            Padding(
              padding: const EdgeInsets.only(bottom: ArrelsSpacing.space4),
              child: Row(
                children: [
                  Expanded(
                    child: DefaultTextStyle(
                      style: ArrelsTextStyles.title.copyWith(
                        color: colors.contentPrimary,
                      ),
                      child: title!,
                    ),
                  ),
                  ?meta,
                ],
              ),
            ),
          child,
        ],
      ),
    );

    return Material(
      color: colors.surfaceRaised,
      elevation: _elevation.toDouble(),
      shadowColor: Colors.black.withValues(alpha: 0.08),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(ArrelsRadius.lg),
        side: BorderSide(
          color: borderColor,
          width: selected ? 2 : ArrelsBorderWidth.regular,
        ),
      ),
      clipBehavior: Clip.antiAlias,
      child: variant == ArrelsCardVariant.static_
          ? content
          : InkWell(onTap: onTap, child: content),
    );
  }
}
