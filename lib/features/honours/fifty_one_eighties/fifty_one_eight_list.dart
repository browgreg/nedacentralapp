import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../widgets/brass_plaque_tile.dart';
import 'fifty_one_eight_controller.dart';

class FiftyOneEightList extends StatelessWidget {
  const FiftyOneEightList({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(FiftyOneEightController());

    return Obx(() {
      if (controller.entries.isEmpty) {
        return const Center(child: Text('No 50–99 career 180s recorded'));
      }

      return ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: controller.entries.length,
        itemBuilder: (_, i) {
          final e = controller.entries[i];

          return Padding(
            padding: const EdgeInsets.only(bottom: 12),
            child: BrassPlaqueTile(
              primary: e.name,
              secondary: '${e.career180} career 180s',
            ),
          );
        },
      );
    });
  }
}
