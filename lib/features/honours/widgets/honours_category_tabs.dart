import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controller/honours_controller.dart';
import '../model/honour_category.dart';

class HonourCategoryTabs extends StatelessWidget {
  final HonoursController controller;

  const HonourCategoryTabs({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 52,
      child: ListView.separated(
        padding: const EdgeInsets.symmetric(horizontal: 12),
        scrollDirection: Axis.horizontal,
        itemCount: HonourCategory.values.length,
        separatorBuilder: (_, __) => const SizedBox(width: 8),
        itemBuilder: (_, i) {
          final category = HonourCategory.values[i];

          return Obx(() {
            final selected = controller.selectedCategory.value == category;

            return ChoiceChip(
              label: Text(category.title),
              selected: selected,
              onSelected: (_) => controller.selectedCategory.value = category,
            );
          });
        },
      ),
    );
  }
}
