import 'package:flutter/material.dart';

import '../../theme/arrels_colors.dart';
import '../../theme/arrels_text_styles.dart';
import '../../tokens/arrels_spacing.dart';

/// `components/forms/Switch.d.ts`. Only for immediate, reversible actions —
/// per ACCESSIBILITY.md, destructive or non-reversible toggles must use a
/// confirm step ([ArrelsDialog]) instead.
class ArrelsSwitch extends StatelessWidget {
  const ArrelsSwitch({
    super.key,
    this.label,
    this.help,
    required this.value,
    this.enabled = true,
    this.onChanged,
  });

  final String? label;
  final String? help;
  final bool value;
  final bool enabled;
  final ValueChanged<bool>? onChanged;

  @override
  Widget build(BuildContext context) {
    final colors = context.arrelsColors;
    final control = Switch(
      value: value,
      onChanged: enabled ? onChanged : null,
      activeThumbColor: colors.contentInverse,
      activeTrackColor: colors.actionPrimaryBackground,
      inactiveThumbColor: colors.contentInverse,
      inactiveTrackColor: colors.borderStrong,
    );

    if (label == null && help == null) return control;

    return InkWell(
      onTap: enabled ? () => onChanged?.call(!value) : null,
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                if (label != null)
                  Text(
                    label!,
                    style: ArrelsTextStyles.body.copyWith(
                      color: enabled
                          ? colors.contentPrimary
                          : colors.contentDisabled,
                    ),
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
          const SizedBox(width: ArrelsSpacing.space2),
          control,
        ],
      ),
    );
  }
}
