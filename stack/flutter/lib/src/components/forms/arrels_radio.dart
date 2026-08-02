import 'package:flutter/material.dart';

import '../../theme/arrels_colors.dart';
import '../../theme/arrels_text_styles.dart';
import '../../tokens/arrels_spacing.dart';

/// `components/forms/Radio.d.ts`.
class ArrelsRadio<T> extends StatelessWidget {
  const ArrelsRadio({
    super.key,
    this.label,
    this.help,
    required this.value,
    required this.groupValue,
    this.enabled = true,
    this.onChanged,
  });

  final Widget? label;
  final String? help;
  final T value;
  final T? groupValue;
  final bool enabled;
  final ValueChanged<T?>? onChanged;

  @override
  Widget build(BuildContext context) {
    final colors = context.arrelsColors;
    final control = SizedBox(
      width: ArrelsControlSize.sm,
      height: ArrelsControlSize.sm,
      child: Radio<T>(
        value: value,
        // ignore: deprecated_member_use
        groupValue: groupValue,
        // ignore: deprecated_member_use
        onChanged: enabled ? onChanged : null,
        activeColor: colors.actionPrimaryBackground,
        fillColor: WidgetStateProperty.resolveWith(
          (states) => states.contains(WidgetState.selected)
              ? colors.actionPrimaryBackground
              : colors.borderStrong,
        ),
      ),
    );

    if (label == null && help == null) return control;

    return InkWell(
      onTap: enabled ? () => onChanged?.call(value) : null,
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
                      color: enabled ? colors.contentPrimary : colors.contentDisabled,
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
