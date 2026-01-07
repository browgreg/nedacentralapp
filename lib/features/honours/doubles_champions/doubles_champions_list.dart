import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../widgets/brass_champions_plaque_tile.dart';
import 'doubles_champions_controller.dart';

class DoublesChampionsList extends StatelessWidget {
  const DoublesChampionsList({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(DoublesChampionsController());

    return Obx(() {
      if (controller.isLoading.value) {
        return const Center(child: CircularProgressIndicator());
      }

      if (controller.champions.isEmpty) {
        return const Center(child: Text('No doubles champions recorded'));
      }

      return ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: controller.champions.length,
        itemBuilder: (_, i) {
          final e = controller.champions[i];

          return Padding(
            padding: const EdgeInsets.only(bottom: 16),
            child: BrassChampionsPlaqueTile(
              primary: 'Div ${e.division} • ${e.year}',
              secondary: '${e.championA} & ${e.championB}\n'
                  'Runner-up: ${e.runnerUpA} & ${e.runnerUpB}',
            ),
          );
        },
      );
    });
  }
}
