import 'package:flutter/material.dart';

import '../../theme/arrels_colors.dart';
import '../../tokens/arrels_spacing.dart';
import '../core/arrels_icon.dart';
import 'arrels_field.dart';

/// Merges `components/forms/Input.d.ts` and `TextArea.d.ts`: a single-line
/// field when [maxLines] is 1 (the default), a multi-line one otherwise.
/// [maxLength] enables the [ArrelsField] counter automatically.
class ArrelsTextField extends StatelessWidget {
  const ArrelsTextField({
    super.key,
    this.controller,
    this.initialValue,
    this.label,
    this.placeholder,
    this.helper,
    this.error,
    this.required = false,
    this.enabled = true,
    this.readOnly = false,
    this.obscureText = false,
    this.iconStart,
    this.suffix,
    this.maxLines = 1,
    this.maxLength,
    this.keyboardType,
    this.onChanged,
    this.focusNode,
  });

  final TextEditingController? controller;

  /// Seeds the field once, like [TextFormField.initialValue]. Mutually
  /// exclusive with [controller].
  final String? initialValue;
  final String? label;
  final String? placeholder;
  final String? helper;
  final String? error;
  final bool required;
  final bool enabled;
  final bool readOnly;
  final bool obscureText;
  final IconData? iconStart;

  /// Static trailing text, e.g. a unit.
  final String? suffix;
  final int maxLines;
  final int? maxLength;
  final TextInputType? keyboardType;
  final ValueChanged<String>? onChanged;
  final FocusNode? focusNode;

  @override
  Widget build(BuildContext context) {
    final colors = context.arrelsColors;
    final length = controller?.text.length ?? 0;

    return ArrelsField(
      label: label,
      required: required,
      helper: helper,
      error: error,
      counter: maxLength != null ? '$length/$maxLength' : null,
      child: SizedBox(
        height: maxLines == 1 ? ArrelsControlSize.md : null,
        child: TextFormField(
          controller: controller,
          initialValue: initialValue,
          enabled: enabled,
          readOnly: readOnly,
          obscureText: obscureText,
          maxLines: obscureText ? 1 : maxLines,
          maxLength: maxLength,
          keyboardType: keyboardType,
          onChanged: onChanged,
          focusNode: focusNode,
          style: TextStyle(color: colors.contentPrimary),
          decoration: InputDecoration(
            hintText: placeholder,
            counterText: '',
            prefixIcon: iconStart != null
                ? Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: ArrelsSpacing.space3,
                    ),
                    child: ArrelsIcon(
                      iconStart!,
                      color: colors.contentSecondary,
                    ),
                  )
                : null,
            prefixIconConstraints: const BoxConstraints(
              minWidth: 0,
              minHeight: 0,
            ),
            suffixText: suffix,
            errorText: null,
          ),
        ),
      ),
    );
  }
}
