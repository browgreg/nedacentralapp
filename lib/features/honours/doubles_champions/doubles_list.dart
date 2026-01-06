import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../widgets/brass_plaque_tile.dart';
import 'doubles_controller.dart';

class DoublesChampionsList extends StatelessWidget {
  const DoublesChampionsList({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(DoublesChampionsController());

    return Obx(() {
      if (controller.entries.isEmpty) {
        return const Center(
          child: Text('No doubles champions recorded'),
        );
      }

      return ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: controller.entries.length,
        itemBuilder: (_, i) {
          final e = controller.entries[i];

          return Padding(
            padding: const EdgeInsets.only(bottom: 14),
            child: BrassPlaqueTile(
              primary: '${e.year} • Division ${e.division}',
              secondary: '🏆 ${e.championA} & ${e.championB}\n'
                  '🥈 ${e.runnerUpA} & ${e.runnerUpB}',
            ),
          );
        },
      );
    });
  }
}
