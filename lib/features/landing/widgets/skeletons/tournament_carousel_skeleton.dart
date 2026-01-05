import 'package:flutter/material.dart';

import '../../../../core/config/layout.dart';
import '../../../../core/widgets/glass_skeleton.dart';

class TournamentCarouselSkeleton extends StatelessWidget {
  const TournamentCarouselSkeleton({super.key});

  @override
  Widget build(BuildContext context) {
    final height = AppLayout.heroHeightFor(context);

    return Center(
      child: ConstrainedBox(
        constraints: const BoxConstraints(
          maxWidth: AppLayout.maxContentWidth,
        ),
        child: SizedBox(
          height: height,
          child: Stack(
            children: [
              // Poster card placeholder
              Align(
                alignment: Alignment.topCenter,
                child: Padding(
                  padding: const EdgeInsets.only(top: 24),
                  child: ConstrainedBox(
                    constraints: const BoxConstraints(maxWidth: 720),
                    child: AspectRatio(
                      aspectRatio: 16 / 9,
                      child: GlassSkeleton(height: 220),
                    ),
                  ),
                ),
              ),

              // Text glass placeholder
              Positioned(
                left: 24,
                right: 24,
                bottom: 24,
                child: LayoutBuilder(
                  builder: (context, c) {
                    final isWide = c.maxWidth >= 900;

                    return Align(
                      alignment: Alignment.bottomLeft,
                      child: ConstrainedBox(
                        constraints: BoxConstraints(
                          maxWidth:
                          isWide ? c.maxWidth * 0.4 : c.maxWidth,
                        ),
                        child: const GlassSkeleton(height: 110),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}