import 'package:flutter/material.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';

import '../../theme/arrels_colors.dart';
import '../../tokens/arrels_spacing.dart';
import '../core/arrels_icon.dart';
import 'arrels_field.dart';

class ArrelsSelectOption<T> {
  const ArrelsSelectOption({required this.value, required this.label});

  final T value;
  final String label;
}

/// `components/forms/Select.d.ts`.
class ArrelsSelect<T> extends StatelessWidget {
  const ArrelsSelect({
    super.key,
    required this.options,
    this.value,
    this.label,
    this.placeholder = 'Selecciona',
    this.helper,
    this.error,
    this.required = false,
    this.enabled = true,
    this.onChanged,
  });

  final List<ArrelsSelectOption<T>> options;
  final T? value;
  final String? label;
  final String placeholder;
  final String? helper;
  final String? error;
  final bool required;
  final bool enabled;
  final ValueChanged<T?>? onChanged;

  @override
  Widget build(BuildContext context) {
    final colors = context.arrelsColors;

    return ArrelsField(
      label: label,
      required: required,
      helper: helper,
      error: error,
      child: SizedBox(
        height: ArrelsControlSize.md,
        child: DropdownButtonFormField<T>(
          initialValue: value,
          isExpanded: true,
          onChanged: enabled ? onChanged : null,
          icon: ArrelsIcon(
            LucideIcons.chevronDown,
            size: ArrelsIconSize.sm,
            color: colors.contentSecondary,
          ),
          hint: Text(placeholder, style: TextStyle(color: colors.contentSecondary)),
          style: TextStyle(color: colors.contentPrimary),
          dropdownColor: colors.surfaceRaised,
          decoration: const InputDecoration(),
          items: [
            for (final option in options)
              DropdownMenuItem(value: option.value, child: Text(option.label)),
          ],
        ),
      ),
    );
  }
}
