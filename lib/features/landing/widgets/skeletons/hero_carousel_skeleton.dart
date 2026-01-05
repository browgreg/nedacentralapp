import 'package:flutter/material.dart';
import '../../../../core/theme/neda_theme.dart';
import '../../../../core/widgets/shimmer_box.dart';

class HeroCarouselSkeleton extends StatelessWidget {
  const HeroCarouselSkeleton({super.key});

  @override
  Widget build(BuildContext context) {
    final n = Theme.of(context).extension<NedaTheme>()!;

    return Padding(
      padding: const EdgeInsets.all(16),
      child: AspectRatio(
        aspectRatio: 16 / 7,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(24),
          child: ShimmerBox(
            color: n.surfaceSubtle,
          ),
        ),
      ),
    );
  }
}