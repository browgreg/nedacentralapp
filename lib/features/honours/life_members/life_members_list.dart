import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/theme/neda_theme.dart';
import 'life_members_controller.dart';

class LifeMembersList extends StatelessWidget {
  const LifeMembersList({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(LifeMembersController());

    return Obx(() {
      if (controller.lifeMembers.isEmpty) {
        return const Center(
          child: Text('No life members recorded'),
        );
      }

      return GridView.builder(
        padding: const EdgeInsets.all(16),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2, // ✅ 2 per row
          mainAxisSpacing: 16,
          crossAxisSpacing: 16,
          childAspectRatio: 2.8, // 👈 plaque shape (wide & elegant)
        ),
        itemCount: controller.lifeMembers.length,
        itemBuilder: (_, i) {
          final m = controller.lifeMembers[i];

          return Container(
              padding: const EdgeInsets.all(14),
              decoration: BoxDecoration(
                color: const Color(0xFFB08D57), // brass tone
                borderRadius: BorderRadius.circular(12),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withAlpha(120),
                    blurRadius: 12,
                    offset: const Offset(0, 6),
                  ),
                ],
              ),
              child: Padding(
                padding: const EdgeInsets.only(bottom: 12),
                child: Row(
                  children: [
                    Opacity(
                      opacity: 0.47,
                      child: Image.asset(
                        'lib/core/assets/logo.png',
                        height: 100,
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          m.name.toUpperCase(),
                          style: NedaText.headingSmall(context)
                              .copyWith(color: Colors.black),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          'Inducted ${m.year}',
                          style: NedaText.headingSmall(context)
                              .copyWith(color: Colors.black.withAlpha(180)),
                        ),
                      ],
                    ),
                  ],
                ),
              ));
        },
      );
    });
  }
}
