import 'package:flutter/material.dart';

import '../../theme/arrels_colors.dart';
import '../../theme/arrels_text_styles.dart';
import '../../tokens/arrels_spacing.dart';
import '../core/arrels_icon.dart';

enum ArrelsButtonVariant { primary, secondary, ghost, destructive }

enum ArrelsButtonSize { small, medium, large }

/// `components/actions/Button.d.ts`: primary/secondary/ghost/destructive,
/// three sizes, optional leading/trailing icon, width-preserving loading
/// state.
class ArrelsButton extends StatelessWidget {
  const ArrelsButton({
    super.key,
    required this.label,
    this.onPressed,
    this.variant = ArrelsButtonVariant.primary,
    this.size = ArrelsButtonSize.medium,
    this.iconStart,
    this.iconEnd,
    this.loading = false,
    this.fullWidth = false,
  });

  final String label;
  final VoidCallback? onPressed;
  final ArrelsButtonVariant variant;
  final ArrelsButtonSize size;
  final IconData? iconStart;
  final IconData? iconEnd;
  final bool loading;
  final bool fullWidth;

  double get _height => switch (size) {
    ArrelsButtonSize.small => ArrelsControlSize.sm,
    ArrelsButtonSize.medium => ArrelsControlSize.md,
    ArrelsButtonSize.large => ArrelsControlSize.lg,
  };

  bool get _disabled => onPressed == null || loading;

  @override
  Widget build(BuildContext context) {
    final colors = context.arrelsColors;
    final (background, foreground, border) = switch (variant) {
      ArrelsButtonVariant.primary => (
        _disabled
            ? colors.actionPrimaryDisabled
            : colors.actionPrimaryBackground,
        colors.actionPrimaryForeground,
        null,
      ),
      ArrelsButtonVariant.secondary => (
        colors.actionSecondaryBackground,
        colors.actionSecondaryForeground,
        colors.actionSecondaryBorder,
      ),
      ArrelsButtonVariant.ghost => (
        Colors.transparent,
        colors.contentPrimary,
        null,
      ),
      ArrelsButtonVariant.destructive => (
        _disabled ? colors.actionPrimaryDisabled : colors.dangerForeground,
        colors.contentInverse,
        null,
      ),
    };

    final content = Row(
      mainAxisSize: fullWidth ? MainAxisSize.max : MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        if (loading) ...[
          SizedBox(
            width: ArrelsIconSize.sm,
            height: ArrelsIconSize.sm,
            child: CircularProgressIndicator(strokeWidth: 2, color: foreground),
          ),
          const SizedBox(width: ArrelsSpacing.space2),
        ] else if (iconStart != null) ...[
          ArrelsIcon(iconStart!, size: ArrelsIconSize.sm, color: foreground),
          const SizedBox(width: ArrelsSpacing.space2),
        ],
        Flexible(
          child: Text(
            label,
            style: ArrelsTextStyles.label.copyWith(color: foreground),
            overflow: TextOverflow.ellipsis,
          ),
        ),
        if (!loading && iconEnd != null) ...[
          const SizedBox(width: ArrelsSpacing.space2),
          ArrelsIcon(iconEnd!, size: ArrelsIconSize.sm, color: foreground),
        ],
      ],
    );

    return SizedBox(
      height: _height,
      width: fullWidth ? double.infinity : null,
      child: Material(
        color: background,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(ArrelsRadius.md),
          side: border != null
              ? BorderSide(color: border, width: ArrelsBorderWidth.regular)
              : BorderSide.none,
        ),
        clipBehavior: Clip.antiAlias,
        child: InkWell(
          onTap: _disabled ? null : onPressed,
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: ArrelsSpacing.space4,
            ),
            child: Center(child: content),
          ),
        ),
      ),
    );
  }
}
