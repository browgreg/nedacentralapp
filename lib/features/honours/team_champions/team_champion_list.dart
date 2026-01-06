import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../widgets/brass_champions_plaque_tile.dart';
import 'team_champions_controller.dart';

class TeamChampionsList extends StatelessWidget {
  const TeamChampionsList({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(TeamChampionsController());

    return Obx(() {
      if (controller.isLoading.value) {
        return const Center(child: CircularProgressIndicator());
      }

      if (controller.champions.isEmpty) {
        return const Center(child: Text('No team champions recorded'));
      }

      return ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: controller.champions.length,
        itemBuilder: (_, i) {
          final e = controller.champions[i];

          return Padding(
            padding: const EdgeInsets.only(bottom: 14),
            child: BrassChampionsPlaqueTile(
              primary: '${e.season} ${e.year}  \nDivision ${e.division}',
              secondary: '🏆 ${e.champion}\n🥈 ${e.runnerUp}',
            ),
          );
        },
      );
    });
  }
}
