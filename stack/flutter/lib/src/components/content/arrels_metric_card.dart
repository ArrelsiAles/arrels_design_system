import 'package:flutter/material.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';

import '../../theme/arrels_colors.dart';
import '../../theme/arrels_text_styles.dart';
import '../../tokens/arrels_spacing.dart';
import '../core/arrels_icon.dart';
import 'arrels_card.dart';

enum ArrelsTrendDirection { up, down, flat }

/// `components/content/MetricCard.d.ts`. Omit [trend]/[period] rather than
/// inventing a comparison that doesn't exist yet — see DESIGN_SYSTEM.md's
/// "never invent data" rule.
class ArrelsMetricCard extends StatelessWidget {
  const ArrelsMetricCard({
    super.key,
    this.label,
    this.value,
    this.unit,
    this.trend,
    this.trendDirection = ArrelsTrendDirection.flat,
    this.period,
    this.quality,
  });

  final String? label;
  final String? value;
  final String? unit;

  /// e.g. "+4,2%".
  final String? trend;
  final ArrelsTrendDirection trendDirection;

  /// The period the value covers, e.g. "vs. setmana anterior".
  final String? period;

  /// Data-quality note shown in warning tone.
  final String? quality;

  @override
  Widget build(BuildContext context) {
    final colors = context.arrelsColors;
    final trendColor = switch (trendDirection) {
      ArrelsTrendDirection.up => colors.successForeground,
      ArrelsTrendDirection.down => colors.dangerForeground,
      ArrelsTrendDirection.flat => colors.contentSecondary,
    };
    final trendIcon = switch (trendDirection) {
      ArrelsTrendDirection.up => LucideIcons.trendingUp,
      ArrelsTrendDirection.down => LucideIcons.trendingDown,
      ArrelsTrendDirection.flat => LucideIcons.minus,
    };

    return ArrelsCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          if (label != null)
            Text(
              label!,
              style: ArrelsTextStyles.bodySmall.copyWith(
                color: colors.contentSecondary,
              ),
            ),
          const SizedBox(height: ArrelsSpacing.space2),
          Row(
            crossAxisAlignment: CrossAxisAlignment.baseline,
            textBaseline: TextBaseline.alphabetic,
            children: [
              Text(
                value ?? '—',
                style: ArrelsTextStyles.h2.copyWith(color: colors.contentPrimary),
              ),
              if (unit != null) ...[
                const SizedBox(width: ArrelsSpacing.space1),
                Text(
                  unit!,
                  style: ArrelsTextStyles.body.copyWith(
                    color: colors.contentSecondary,
                  ),
                ),
              ],
            ],
          ),
          if (trend != null) ...[
            const SizedBox(height: ArrelsSpacing.space2),
            Row(
              children: [
                ArrelsIcon(trendIcon, size: ArrelsIconSize.sm, color: trendColor),
                const SizedBox(width: ArrelsSpacing.space1),
                Text(
                  trend!,
                  style: ArrelsTextStyles.data.copyWith(color: trendColor),
                ),
                if (period != null) ...[
                  const SizedBox(width: ArrelsSpacing.space1),
                  Text(
                    period!,
                    style: ArrelsTextStyles.caption.copyWith(
                      color: colors.contentSecondary,
                    ),
                  ),
                ],
              ],
            ),
          ],
          if (quality != null)
            Padding(
              padding: const EdgeInsets.only(top: ArrelsSpacing.space2),
              child: Text(
                quality!,
                style: ArrelsTextStyles.caption.copyWith(
                  color: colors.warningForeground,
                ),
              ),
            ),
        ],
      ),
    );
  }
}
