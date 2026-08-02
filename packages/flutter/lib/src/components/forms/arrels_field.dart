import 'package:flutter/material.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';

import '../../theme/arrels_colors.dart';
import '../../theme/arrels_text_styles.dart';
import '../../tokens/arrels_spacing.dart';
import '../core/arrels_icon.dart';

/// `components/forms/Field.d.ts` — the label/helper/error/counter chrome
/// shared by every form control. [ArrelsTextField], [ArrelsSelect] etc. use
/// this internally; reach for it directly only when wrapping a bespoke
/// control that still needs to look consistent.
class ArrelsField extends StatelessWidget {
  const ArrelsField({
    super.key,
    required this.child,
    this.label,
    this.required = false,
    this.helper,
    this.error,
    this.counter,
  });

  final String? label;
  final bool required;
  final String? helper;

  /// Replaces [helper] and switches the caption to danger styling.
  final String? error;
  final String? counter;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    final colors = context.arrelsColors;
    final caption = error ?? helper;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        if (label != null) ...[
          RichText(
            text: TextSpan(
              style: ArrelsTextStyles.label.copyWith(
                color: colors.contentPrimary,
              ),
              children: [
                TextSpan(text: label),
                if (required)
                  TextSpan(
                    text: ' *',
                    style: TextStyle(color: colors.dangerForeground),
                  ),
              ],
            ),
          ),
          const SizedBox(height: ArrelsSpacing.space1),
        ],
        child,
        if (caption != null || counter != null) ...[
          const SizedBox(height: ArrelsSpacing.space1),
          Row(
            children: [
              if (error != null) ...[
                ArrelsIcon(
                  LucideIcons.circleAlert,
                  size: ArrelsIconSize.sm,
                  color: colors.dangerForeground,
                ),
                const SizedBox(width: ArrelsSpacing.space1),
              ],
              if (caption != null)
                Expanded(
                  child: Text(
                    caption,
                    style: ArrelsTextStyles.caption.copyWith(
                      color: error != null
                          ? colors.dangerForeground
                          : colors.contentSecondary,
                    ),
                  ),
                ),
              if (counter != null)
                Text(
                  counter!,
                  style: ArrelsTextStyles.caption.copyWith(
                    color: colors.contentSecondary,
                  ),
                ),
            ],
          ),
        ],
      ],
    );
  }
}
