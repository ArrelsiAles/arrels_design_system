import 'package:flutter/material.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';

import '../../theme/arrels_colors.dart';
import '../../theme/arrels_text_styles.dart';
import '../../tokens/arrels_spacing.dart';
import '../actions/arrels_button.dart';
import '../core/arrels_icon.dart';

/// `components/feedback/OfflineState.d.ts`. Uses `state.warning` tokens per
/// `tokens/components.tokens.json` (`domain.offlineBackground/Foreground`).
class ArrelsOfflineState extends StatelessWidget {
  const ArrelsOfflineState({
    super.key,
    this.lastSync,
    this.pending,
    this.available = const [],
    this.onRetry,
  });

  /// Human-readable last sync, e.g. "hoy 09:41".
  final String? lastSync;

  /// Items queued on the device.
  final int? pending;

  /// What the person can still do offline.
  final List<String> available;
  final VoidCallback? onRetry;

  @override
  Widget build(BuildContext context) {
    final colors = context.arrelsColors;

    return Container(
      padding: const EdgeInsets.all(ArrelsSpacing.space4),
      decoration: BoxDecoration(
        color: colors.warningBackground,
        borderRadius: BorderRadius.circular(ArrelsRadius.md),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            children: [
              ArrelsIcon(LucideIcons.wifiOff, color: colors.warningForeground),
              const SizedBox(width: ArrelsSpacing.space2),
              Text(
                'Sense connexió',
                style: ArrelsTextStyles.label.copyWith(
                  color: colors.warningForeground,
                ),
              ),
            ],
          ),
          if (lastSync != null)
            Padding(
              padding: const EdgeInsets.only(top: ArrelsSpacing.space2),
              child: Text(
                'Última sincronització: $lastSync',
                style: ArrelsTextStyles.bodySmall.copyWith(
                  color: colors.contentPrimary,
                ),
              ),
            ),
          if (pending != null && pending! > 0)
            Padding(
              padding: const EdgeInsets.only(top: ArrelsSpacing.space1),
              child: Text(
                '$pending elements pendents de sincronitzar',
                style: ArrelsTextStyles.bodySmall.copyWith(
                  color: colors.contentPrimary,
                ),
              ),
            ),
          if (available.isNotEmpty)
            Padding(
              padding: const EdgeInsets.only(top: ArrelsSpacing.space2),
              child: Text(
                'Disponible sense connexió: ${available.join(', ')}',
                style: ArrelsTextStyles.caption.copyWith(
                  color: colors.contentSecondary,
                ),
              ),
            ),
          if (onRetry != null)
            Padding(
              padding: const EdgeInsets.only(top: ArrelsSpacing.space3),
              child: ArrelsButton(
                label: 'Reintentar',
                variant: ArrelsButtonVariant.secondary,
                size: ArrelsButtonSize.small,
                onPressed: onRetry,
              ),
            ),
        ],
      ),
    );
  }
}
