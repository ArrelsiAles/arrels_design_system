import 'package:flutter/material.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';

import '../../theme/arrels_colors.dart';
import '../../theme/arrels_text_styles.dart';
import '../../tokens/arrels_spacing.dart';
import '../actions/arrels_icon_button.dart';
import '../core/arrels_icon.dart';

/// `components/forms/SearchField.d.ts`.
class ArrelsSearchField extends StatelessWidget {
  const ArrelsSearchField({
    super.key,
    this.controller,
    this.placeholder = 'Buscar',
    this.label = 'Buscar',
    this.onChanged,
    this.onClear,
    this.width = 280,
  });

  final TextEditingController? controller;
  final String placeholder;
  final String label;
  final ValueChanged<String>? onChanged;
  final VoidCallback? onClear;
  final double width;

  @override
  Widget build(BuildContext context) {
    final colors = context.arrelsColors;
    final hasText = controller?.text.isNotEmpty ?? false;

    return SizedBox(
      width: width,
      height: ArrelsControlSize.md,
      child: TextField(
        controller: controller,
        onChanged: onChanged,
        style: ArrelsTextStyles.body.copyWith(color: colors.contentPrimary),
        decoration: InputDecoration(
          hintText: placeholder,
          prefixIcon: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: ArrelsSpacing.space3,
            ),
            child: ArrelsIcon(
              LucideIcons.search,
              color: colors.contentSecondary,
              semanticLabel: label,
            ),
          ),
          prefixIconConstraints: const BoxConstraints(
            minWidth: 0,
            minHeight: 0,
          ),
          suffixIcon: hasText
              ? ArrelsIconButton(
                  icon: LucideIcons.x,
                  label: 'Netejar cerca',
                  size: ArrelsIconButtonSize.small,
                  onPressed: () {
                    controller?.clear();
                    onClear?.call();
                  },
                )
              : null,
        ),
      ),
    );
  }
}
