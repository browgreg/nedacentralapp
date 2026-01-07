import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../widgets/brass_individual_plaque_tile.dart';
import 'ten_one_seventy_ones_controller.dart';

class TenOneSeventyOnesList extends StatelessWidget {
  const TenOneSeventyOnesList({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(TenOneSeventyOnesController());

    return Obx(() {
      if (controller.isLoading.value) {
        return const Center(child: CircularProgressIndicator());
      }

      if (controller.stats.isEmpty) {
        return const Center(child: Text('No records found'));
      }

      return ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: controller.stats.length,
        itemBuilder: (_, i) {
          final e = controller.stats[i];

          return Padding(
            padding: const EdgeInsets.only(bottom: 12),
            child: BrassIndividualPlaqueTile(
              primary: e.name,
              secondary: '${e.total}',
            ),
          );
        },
      );
    });
  }
}
