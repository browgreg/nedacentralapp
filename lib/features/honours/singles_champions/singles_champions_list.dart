import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../widgets/brass_champions_plaque_tile.dart';
import 'singles_champions_controller.dart';

class SinglesChampionsList extends StatelessWidget {
  const SinglesChampionsList({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(SinglesChampionsController());

    return Obx(() {
      if (controller.entries.isEmpty) {
        return const Center(
          child: Text('No singles champions recorded'),
        );
      }

      final grouped = controller.groupedByDivision;

      return ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: controller.entries.length,
        itemBuilder: (_, i) {
          final e = controller.entries[i];

          return Padding(
            padding: const EdgeInsets.only(bottom: 14),
            child: BrassChampionsPlaqueTile(
              primary: '${e.year}\nDivision ${e.division}',
              secondary: '🏆 ${e.champion}\n🥈 ${e.runnerUp}',
            ),
          );
        },
      );
    });
  }
}
