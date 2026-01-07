import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../widgets/brass_champions_plaque_tile.dart';
import 'teams_champions_controller.dart';

class TeamsChampionsList extends StatelessWidget {
  const TeamsChampionsList({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(TeamsChampionsController());

    return Obx(() {
      if (controller.isLoading.value) {
        return const Center(child: CircularProgressIndicator());
      }

      if (controller.champions.isEmpty) {
        return const Center(child: Text('No Teams champions recorded'));
      }

      return ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: controller.champions.length,
        itemBuilder: (_, i) {
          final e = controller.champions[i];

          return Padding(
            padding: const EdgeInsets.only(bottom: 12),
            child: BrassChampionsPlaqueTile(
              primary: 'Division ${e.division} — ${e.year}',
              secondary: 'Winner: ${e.champion}\nRunner-up: ${e.runnerUp}',
            ),
          );
        },
      );
    });
  }
}
