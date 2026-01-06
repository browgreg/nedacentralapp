import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../widgets/brass_individual_plaque_tile.dart';
import 'club_one_seventy_controller.dart';

class ClubOneSeventyList extends StatelessWidget {
  const ClubOneSeventyList({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ClubOneSeventyController());

    return Obx(() {
      if (controller.isLoading.value) {
        return const Center(child: CircularProgressIndicator());
      }

      if (controller.entries.isEmpty) {
        return const Center(child: Text('No Club 170 finishes recorded'));
      }

      return ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: controller.entries.length,
        itemBuilder: (_, i) {
          final e = controller.entries[i];

          return Padding(
            padding: const EdgeInsets.only(bottom: 12),
            child: BrassIndividualPlaqueTile(
              primary: e.name,
              secondary: e.count > 1
                  ? '${e.count} × 170 finishes\n${e.years}'
                  : '170 finish • ${e.years}',
            ),
          );
        },
      );
    });
  }
}
