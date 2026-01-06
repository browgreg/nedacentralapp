import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../widgets/brass_plaque_tile.dart';
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

      return ListView(
        padding: const EdgeInsets.all(16),
        children: grouped.entries.map((entry) {
          final division = entry.key;
          final records = entry.value;

          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              /// Division header
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 12),
                child: Text(
                  'Division $division',
                  style: Theme.of(context).textTheme.titleMedium,
                ),
              ),

              /// Plaques
              ...records.map((e) {
                return Padding(
                  padding: const EdgeInsets.only(bottom: 12),
                  child: BrassPlaqueTile(
                    primary: '${e.year} Champion',
                    secondary: '🏆 ${e.champion}\n🥈 ${e.runnerUp}',
                  ),
                );
              }),
            ],
          );
        }).toList(),
      );
    });
  }
}
