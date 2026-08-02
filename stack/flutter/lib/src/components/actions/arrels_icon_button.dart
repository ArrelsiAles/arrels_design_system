import 'package:flutter/material.dart';

import '../../theme/arrels_colors.dart';
import '../../tokens/arrels_spacing.dart';
import '../core/arrels_icon.dart';

enum ArrelsIconButtonTone { neutral, tonal, outline }

enum ArrelsIconButtonSize { small, medium, large }

/// `components/actions/IconButton.d.ts`. [label] is the required accessible
/// name — there is no icon-only variant without one.
class ArrelsIconButton extends StatelessWidget {
  const ArrelsIconButton({
    super.key,
    required this.icon,
    required this.label,
    this.onPressed,
    this.tone = ArrelsIconButtonTone.neutral,
    this.size = ArrelsIconButtonSize.medium,
    this.selected = false,
  });

  final IconData icon;
  final String label;
  final VoidCallback? onPressed;
  final ArrelsIconButtonTone tone;
  final ArrelsIconButtonSize size;
  final bool selected;

  double get _target => switch (size) {
        ArrelsIconButtonSize.small => ArrelsControlSize.sm,
        ArrelsIconButtonSize.medium => ArrelsControlSize.md,
        ArrelsIconButtonSize.large => ArrelsControlSize.lg,
      };

  @override
  Widget build(BuildContext context) {
    final colors = context.arrelsColors;
    final disabled = onPressed == null;

    final Color background = switch (tone) {
      ArrelsIconButtonTone.neutral =>
        selected ? colors.surfaceSubtle : Colors.transparent,
      ArrelsIconButtonTone.tonal => selected
          ? colors.brandAccentSoft
          : colors.surfaceSubtle,
      ArrelsIconButtonTone.outline => Colors.transparent,
    };
    final Color foreground = disabled
        ? colors.contentDisabled
        : (selected && tone == ArrelsIconButtonTone.tonal
            ? colors.actionPrimaryBackground
            : colors.contentPrimary);
    final BorderSide border = tone == ArrelsIconButtonTone.outline
        ? BorderSide(color: colors.borderDefault)
        : BorderSide.none;

    return Tooltip(
      message: label,
      child: SizedBox(
        width: _target,
        height: _target,
        child: Material(
          color: background,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(ArrelsRadius.md),
            side: border,
          ),
          clipBehavior: Clip.antiAlias,
          child: InkWell(
            onTap: onPressed,
            child: Center(
              child: ArrelsIcon(
                icon,
                size: ArrelsIconSize.md,
                color: foreground,
                semanticLabel: label,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
