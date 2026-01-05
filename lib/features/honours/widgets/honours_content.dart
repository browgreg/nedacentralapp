import 'package:flutter/material.dart';

import '../../../core/theme/neda_theme.dart';
import '../../../core/widgets/woodgrain_background.dart';
import '../model/honour_category.dart';

class HonoursContent extends StatelessWidget {
  final HonourCategory category;

  const HonoursContent({
    super.key,
    required this.category,
  });

  @override
  Widget build(BuildContext context) {
    return AnimatedSwitcher(
      duration: const Duration(milliseconds: 300),
      switchInCurve: Curves.easeOutCubic,
      switchOutCurve: Curves.easeInCubic,

      /// ✅ Use a STABLE key (String / int), not the whole object
      child: Center(
        key: ValueKey(category.index), // 👈 IMPORTANT
        child: WoodgrainBackground(
          borderRadius: BorderRadius.circular(20),
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min, // 👈 avoids overflow issues
              children: [
                Text(
                  category.name, // 👈 don’t hardcode
                  style: NedaText.headingSmall(context).copyWith(
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 12),

                // honour content here
              ],
            ),
          ),
        ),
      ),
    );
  }
}
