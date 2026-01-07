import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/theme/neda_theme.dart';
import 'presidents_controller.dart';

class PresidentsList extends StatelessWidget {
  const PresidentsList({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(PresidentsController());
    final n = Theme.of(context).extension<NedaTheme>()!;

    return Obx(() {
      if (controller.isLoading.value) {
        return const Center(child: CircularProgressIndicator());
      }

      if (controller.presidents.isEmpty) {
        return const Center(child: Text('No presidents recorded'));
      }

      return ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: controller.presidents.length,
        itemBuilder: (_, i) {
          final p = controller.presidents[i];

          return Container(
            margin: const EdgeInsets.only(bottom: 12),
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: n.surfaceCard,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(p.name, style: NedaText.headingSmall(context)),
                const SizedBox(height: 4),
                Text(p.term, style: NedaText.muted(context)),
              ],
            ),
          );
        },
      );
    });
  }
}
