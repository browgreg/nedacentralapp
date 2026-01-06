import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controller/honours_controller.dart';
import '../model/honour_category.dart';
import 'brass_plaque_tile.dart';

class HonoursContent extends StatelessWidget {
  final HonourCategory category;

  const HonoursContent({super.key, required this.category});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<HonoursController>();

    return Obx(() {
      final entries = controller.data[category]!;

      if (entries.isEmpty) {
        return Center(
          child: Text('No ${category.title} records yet'),
        );
      }

      return ListView.separated(
        padding: const EdgeInsets.all(20),
        itemCount: entries.length,
        separatorBuilder: (_, __) => const SizedBox(height: 14),
        itemBuilder: (_, i) {
          return BrassPlaqueTile(entry: entries[i]);
        },
      );
    });
  }
}
