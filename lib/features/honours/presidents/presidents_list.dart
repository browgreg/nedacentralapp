import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../widgets/brass_plaque_tile.dart';
import 'presidents_controller.dart';

class PresidentsList extends StatelessWidget {
  const PresidentsList({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(PresidentsController());

    return Obx(() {
      if (controller.presidents.isEmpty) {
        return const Center(child: Text('No presidents recorded'));
      }

      return ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: controller.presidents.length,
        itemBuilder: (_, i) {
          final p = controller.presidents[i];

          return Padding(
            padding: const EdgeInsets.only(bottom: 12),
            child: BrassPlaqueTile(
              primary: p.name,
              secondary: p.term,
            ),
          );
        },
      );
    });
  }
}
