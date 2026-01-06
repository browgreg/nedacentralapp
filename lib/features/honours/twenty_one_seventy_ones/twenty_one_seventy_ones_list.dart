import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:neda_central/features/honours/widgets/brass_individual_plaque_tile.dart';

import 'twenty_one_seventy_ones_controller.dart';

class TwentyOneSeventyOnesList extends StatelessWidget {
  const TwentyOneSeventyOnesList({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(TwentyOneSeventyOnesController());

    return Obx(() {
      if (controller.isLoading.value) {
        return const Center(child: CircularProgressIndicator());
      }

      if (controller.entries.isEmpty) {
        return const Center(child: Text('No 171 finishes recorded'));
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
              secondary: '${e.career171}',
            ),
          );
        },
      );
    });
  }
}
