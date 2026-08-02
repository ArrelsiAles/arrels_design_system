import 'package:flutter/material.dart';

import '../../theme/arrels_colors.dart';
import '../../theme/arrels_text_styles.dart';
import '../../tokens/arrels_spacing.dart';

/// `components/forms/Checkbox.d.ts`. Checked state uses
/// [ArrelsColors.actionPrimaryBackground] with a white check, per
/// `tokens/components.tokens.json` (`selectionControl`).
class ArrelsCheckbox extends StatelessWidget {
  const ArrelsCheckbox({
    super.key,
    this.label,
    this.help,
    required this.value,
    this.tristate = false,
    this.enabled = true,
    this.onChanged,
  });

  final Widget? label;
  final String? help;
  final bool? value;
  final bool tristate;
  final bool enabled;
  final ValueChanged<bool?>? onChanged;

  @override
  Widget build(BuildContext context) {
    final colors = context.arrelsColors;
    final control = SizedBox(
      width: ArrelsControlSize.sm,
      height: ArrelsControlSize.sm,
      child: Checkbox(
        value: value,
        tristate: tristate,
        onChanged: enabled ? onChanged : null,
        activeColor: colors.actionPrimaryBackground,
        checkColor: colors.contentInverse,
        side: BorderSide(color: colors.borderStrong),
      ),
    );

    if (label == null && help == null) return control;

    return InkWell(
      onTap: enabled && onChanged != null
          ? () => onChanged!(tristate ? null : !(value ?? false))
          : null,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          control,
          const SizedBox(width: ArrelsSpacing.space2),
          Flexible(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                if (label != null)
                  DefaultTextStyle(
                    style: ArrelsTextStyles.body.copyWith(
                      color: enabled
                          ? colors.contentPrimary
                          : colors.contentDisabled,
                    ),
                    child: label!,
                  ),
                if (help != null)
                  Text(
                    help!,
                    style: ArrelsTextStyles.caption.copyWith(
                      color: colors.contentSecondary,
                    ),
                  ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
