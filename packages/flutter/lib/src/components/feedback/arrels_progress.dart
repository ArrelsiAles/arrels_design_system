import 'package:flutter/material.dart';

import '../../theme/arrels_colors.dart';
import '../../theme/arrels_text_styles.dart';
import '../../tokens/arrels_spacing.dart';

/// `components/feedback/Progress.d.ts`.
class ArrelsProgress extends StatelessWidget {
  const ArrelsProgress({
    super.key,
    this.value,
    this.label,
    this.description,
    this.indeterminate = false,
  });

  /// 0-100. Ignored when [indeterminate] is true.
  final double? value;
  final String? label;
  final String? description;
  final bool indeterminate;

  @override
  Widget build(BuildContext context) {
    final colors = context.arrelsColors;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        if (label != null)
          Padding(
            padding: const EdgeInsets.only(bottom: ArrelsSpacing.space1),
            child: Text(
              label!,
              style: ArrelsTextStyles.label.copyWith(
                color: colors.contentPrimary,
              ),
            ),
          ),
        ClipRRect(
          borderRadius: BorderRadius.circular(ArrelsRadius.pill),
          child: LinearProgressIndicator(
            value: indeterminate ? null : (value ?? 0) / 100,
            minHeight: 8,
            backgroundColor: colors.surfaceSubtle,
            color: colors.actionPrimaryBackground,
          ),
        ),
        if (description != null)
          Padding(
            padding: const EdgeInsets.only(top: ArrelsSpacing.space1),
            child: Text(
              description!,
              style: ArrelsTextStyles.caption.copyWith(
                color: colors.contentSecondary,
              ),
            ),
          ),
      ],
    );
  }
}
