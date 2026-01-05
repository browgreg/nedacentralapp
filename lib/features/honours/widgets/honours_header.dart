import 'package:flutter/material.dart';

import '../../../core/theme/neda_theme.dart';
import '../model/honour_category.dart';

class HonoursHeader extends StatelessWidget {
  final HonourCategory selected;
  final ValueChanged<HonourCategory> onChanged;

  const HonoursHeader({
    super.key,
    required this.selected,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    final n = Theme.of(context).extension<NedaTheme>()!;

    return Container(
      height: 56,
      decoration: BoxDecoration(
        color: Colors.black,
        border: Border(
          bottom: BorderSide(
            color: n.borderPrimary.withAlpha(90),
          ),
        ),
      ),
      child: ListView.separated(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        scrollDirection: Axis.horizontal,
        itemCount: HonourCategory.values.length,
        separatorBuilder: (_, __) => const SizedBox(width: 18),
        itemBuilder: (context, i) {
          final category = HonourCategory.values[i];
          final isActive = category == selected;

          return GestureDetector(
            onTap: () => onChanged(category),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  category.label,
                  style: NedaText.body(context).copyWith(
                    color: isActive
                        ? n.accentPrimary
                        : Colors.white.withAlpha(170),
                    fontWeight: isActive ? FontWeight.w700 : FontWeight.w500,
                  ),
                ),
                const SizedBox(height: 8),
                AnimatedContainer(
                  duration: const Duration(milliseconds: 250),
                  height: 3,
                  width: isActive ? 32 : 0,
                  decoration: BoxDecoration(
                    color: n.accentPrimary,
                    borderRadius: BorderRadius.circular(2),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
