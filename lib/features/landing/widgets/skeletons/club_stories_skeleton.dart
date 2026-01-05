import 'package:flutter/material.dart';
import '../../../../core/theme/neda_theme.dart';
import '../../../../core/widgets/shimmer_box.dart';

class ClubStoriesSkeleton extends StatelessWidget {
  const ClubStoriesSkeleton({super.key});

  @override
  Widget build(BuildContext context) {
    final n = Theme.of(context).extension<NedaTheme>()!;

    return Padding(
      padding: const EdgeInsets.all(16),
      child: Container(
        height: 500, // 👈 MUST match maxHeight
        decoration: BoxDecoration(
          color: n.surfaceCard,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Row(
          children: [
            // Tabs rail
            Container(
              width: 240,
              color: n.surfaceSubtle,
            ),

            const VerticalDivider(width: 1),

            // Content
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(18),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ShimmerBox(height: 180),
                    const SizedBox(height: 14),
                    ShimmerBox(height: 22, width: 220),
                    const SizedBox(height: 10),
                    ShimmerBox(height: 16, width: 300),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}