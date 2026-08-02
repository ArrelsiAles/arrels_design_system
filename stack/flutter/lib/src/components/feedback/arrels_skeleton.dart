import 'package:flutter/material.dart';

import '../../theme/arrels_colors.dart';
import '../../tokens/arrels_motion.dart';
import '../../tokens/arrels_spacing.dart';

/// `components/feedback/Skeleton.d.ts`. Pulses between [ArrelsColors.surfaceSubtle]
/// and [ArrelsColors.surfaceDefault] using the brand's "complex" motion duration.
class ArrelsSkeleton extends StatefulWidget {
  const ArrelsSkeleton({
    super.key,
    this.width,
    this.height = 16,
    this.radius = ArrelsRadius.sm,
  });

  final double? width;
  final double height;
  final double radius;

  @override
  State<ArrelsSkeleton> createState() => _ArrelsSkeletonState();
}

class _ArrelsSkeletonState extends State<ArrelsSkeleton>
    with SingleTickerProviderStateMixin {
  late final _controller = AnimationController(
    vsync: this,
    duration: ArrelsMotion.complex * 2,
  )..repeat(reverse: true);

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final colors = context.arrelsColors;
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, _) {
        return Container(
          width: widget.width,
          height: widget.height,
          decoration: BoxDecoration(
            color: Color.lerp(
              colors.surfaceSubtle,
              colors.surfaceDefault,
              _controller.value,
            ),
            borderRadius: BorderRadius.circular(widget.radius),
          ),
        );
      },
    );
  }
}
