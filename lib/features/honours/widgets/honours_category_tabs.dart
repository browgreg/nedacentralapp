import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/theme/neda_theme.dart';
import '../controller/honours_controller.dart';
import '../model/honour_category.dart';

class HonourCategoryTabs extends StatelessWidget {
  final HonoursController controller;

  const HonourCategoryTabs({
    super.key,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 56,
      child: ListView.separated(
        padding: const EdgeInsets.symmetric(horizontal: 12),
        scrollDirection: Axis.horizontal,
        itemCount: HonourCategory.values.length,
        separatorBuilder: (_, __) => const SizedBox(width: 8),
        itemBuilder: (context, index) {
          final category = HonourCategory.values[index];

          return Obx(
            () {
              final isSelected = controller.selectedCategory.value == category;

              return _TabChip(
                label: category.title,
                selected: isSelected,
                onTap: () => controller.selectedCategory.value = category,
              );
            },
          );
        },
      ),
    );
  }
}

class _TabChip extends StatelessWidget {
  final String label;
  final bool selected;
  final VoidCallback onTap;

  const _TabChip({
    required this.label,
    required this.selected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final n = Theme.of(context).extension<NedaTheme>()!;

    return AnimatedContainer(
      duration: const Duration(milliseconds: 200),
      curve: Curves.easeOutCubic,
      child: Material(
        color: selected ? n.accentPrimary : n.surfaceSubtle,
        borderRadius: BorderRadius.circular(999),
        child: InkWell(
          borderRadius: BorderRadius.circular(999),
          onTap: onTap,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 10),
            child: Text(
              label,
              style: NedaText.body(context).copyWith(
                fontWeight: FontWeight.w600,
                color: selected ? Colors.black : n.textPrimary,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
