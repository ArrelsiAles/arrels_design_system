import 'package:flutter/material.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';

import '../../theme/arrels_colors.dart';
import '../../theme/arrels_text_styles.dart';
import '../../tokens/arrels_spacing.dart';
import '../actions/arrels_icon_button.dart';

/// `components/navigation/Pagination.d.ts`.
class ArrelsPagination extends StatelessWidget {
  const ArrelsPagination({
    super.key,
    this.page = 1,
    this.pageCount = 1,
    this.total,
    this.onChange,
  });

  final int page;
  final int pageCount;

  /// Total result count shown on the left.
  final int? total;
  final ValueChanged<int>? onChange;

  @override
  Widget build(BuildContext context) {
    final colors = context.arrelsColors;

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        if (total != null)
          Text(
            '$total resultats',
            style: ArrelsTextStyles.bodySmall.copyWith(
              color: colors.contentSecondary,
            ),
          )
        else
          const SizedBox.shrink(),
        Row(
          children: [
            ArrelsIconButton(
              icon: LucideIcons.chevronLeft,
              label: 'Pàgina anterior',
              size: ArrelsIconButtonSize.small,
              onPressed: page > 1 ? () => onChange?.call(page - 1) : null,
            ),
            const SizedBox(width: ArrelsSpacing.space2),
            Text(
              '$page / $pageCount',
              style: ArrelsTextStyles.label.copyWith(
                color: colors.contentPrimary,
              ),
            ),
            const SizedBox(width: ArrelsSpacing.space2),
            ArrelsIconButton(
              icon: LucideIcons.chevronRight,
              label: 'Pàgina següent',
              size: ArrelsIconButtonSize.small,
              onPressed: page < pageCount
                  ? () => onChange?.call(page + 1)
                  : null,
            ),
          ],
        ),
      ],
    );
  }
}
