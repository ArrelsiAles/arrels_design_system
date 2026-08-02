import 'package:flutter/material.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';

import '../../theme/arrels_colors.dart';
import '../../theme/arrels_text_styles.dart';
import '../core/arrels_icon.dart';

enum ArrelsAvatarSize { small, medium, large }

/// `components/content/Avatar.d.ts`. Never the sole means of identifying a
/// person — pair with a visible name nearby (ACCESSIBILITY.md).
class ArrelsAvatar extends StatelessWidget {
  const ArrelsAvatar({
    super.key,
    this.name,
    this.imageUrl,
    this.size = ArrelsAvatarSize.medium,
    this.icon,
  });

  /// Used to derive initials and as the accessible label.
  final String? name;
  final String? imageUrl;
  final ArrelsAvatarSize size;

  /// Icon fallback instead of initials, when there's no [name] either.
  final IconData? icon;

  double get _diameter => switch (size) {
    ArrelsAvatarSize.small => 32,
    ArrelsAvatarSize.medium => 40,
    ArrelsAvatarSize.large => 56,
  };

  String get _initials {
    final parts = (name ?? '')
        .trim()
        .split(RegExp(r'\s+'))
        .where((p) => p.isNotEmpty);
    final letters = parts.take(2).map((p) => p[0].toUpperCase());
    return letters.join();
  }

  @override
  Widget build(BuildContext context) {
    final colors = context.arrelsColors;

    return Semantics(
      label: name,
      image: imageUrl != null,
      child: ClipOval(
        child: Container(
          width: _diameter,
          height: _diameter,
          color: colors.brandAccentSoft,
          child: imageUrl != null
              ? Image.network(
                  imageUrl!,
                  fit: BoxFit.cover,
                  errorBuilder: (_, _, _) => _fallback(colors),
                )
              : _fallback(colors),
        ),
      ),
    );
  }

  Widget _fallback(ArrelsColors colors) {
    if (name != null && name!.trim().isNotEmpty) {
      return Center(
        child: Text(
          _initials,
          style: ArrelsTextStyles.label.copyWith(
            color: colors.brandOnAccentLarge,
          ),
        ),
      );
    }
    return Center(
      child: ArrelsIcon(
        icon ?? LucideIcons.user,
        color: colors.brandOnAccentLarge,
      ),
    );
  }
}
