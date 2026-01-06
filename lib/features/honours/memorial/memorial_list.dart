import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/theme/neda_theme.dart';
import 'memorial_controller.dart';

class MemorialList extends StatelessWidget {
  const MemorialList({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(MemorialController());

    return Obx(() {
      if (controller.memorials.isEmpty) {
        return const Center(
          child: Text('No memorial records'),
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
        itemCount: controller.memorials.length,
        itemBuilder: (_, i) {
          final m = controller.memorials[i];

          return Padding(
              padding: const EdgeInsets.only(bottom: 12),
              child: Container(
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
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Image.asset(
                        'lib/core/assets/peace_dove.png',
                        height: 80,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            m.name,
                            style: NedaText.headingSmall(context)
                                .copyWith(color: Colors.black),
                          ),
                          const SizedBox(height: 4),
                          Text(
                            'Rest In Peace',
                            style: NedaText.headingSmall(context)
                                .copyWith(color: Colors.black.withAlpha(180)),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ));
        },
      );
    });
  }
}
