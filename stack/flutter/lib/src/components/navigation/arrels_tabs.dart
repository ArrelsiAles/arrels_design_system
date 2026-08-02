import 'package:flutter/material.dart';

import '../../theme/arrels_colors.dart';
import '../../theme/arrels_text_styles.dart';
import '../../tokens/arrels_spacing.dart';

class ArrelsTabItem {
  const ArrelsTabItem({required this.id, required this.label, this.count});

  final String id;
  final String label;
  final int? count;
}

/// `components/navigation/Tabs.d.ts`.
class ArrelsTabs extends StatelessWidget {
  const ArrelsTabs({
    super.key,
    required this.items,
    this.activeId,
    this.onSelect,
  });

  final List<ArrelsTabItem> items;
  final String? activeId;
  final ValueChanged<String>? onSelect;

  @override
  Widget build(BuildContext context) {
    final colors = context.arrelsColors;

    return SizedBox(
      height: ArrelsControlSize.md,
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: [
            for (final item in items)
              _Tab(
                item: item,
                active: item.id == activeId,
                colors: colors,
                onTap: () => onSelect?.call(item.id),
              ),
          ],
        ),
      ),
    );
  }
}

class _Tab extends StatelessWidget {
  const _Tab({
    required this.item,
    required this.active,
    required this.colors,
    required this.onTap,
  });

  final ArrelsTabItem item;
  final bool active;
  final ArrelsColors colors;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.only(right: ArrelsSpacing.space4),
        padding: const EdgeInsets.symmetric(vertical: ArrelsSpacing.space2),
        decoration: BoxDecoration(
          border: Border(
            bottom: BorderSide(
              color: active ? colors.actionPrimaryBackground : Colors.transparent,
              width: 2,
            ),
          ),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              item.label,
              style: ArrelsTextStyles.label.copyWith(
                color: active ? colors.contentPrimary : colors.contentSecondary,
              ),
            ),
            if (item.count != null) ...[
              const SizedBox(width: ArrelsSpacing.space1),
              Text(
                '(${item.count})',
                style: ArrelsTextStyles.caption.copyWith(
                  color: colors.contentSecondary,
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }
}
