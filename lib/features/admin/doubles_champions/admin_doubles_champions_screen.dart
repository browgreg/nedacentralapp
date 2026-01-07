import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/theme/neda_theme.dart';
import '../../honours/widgets/brass_plaque_tile.dart';
import 'admin_doubles_champions_controller.dart';

class AdminDoublesChampionsScreen extends StatelessWidget {
  const AdminDoublesChampionsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final n = Theme.of(context).extension<NedaTheme>()!;
    final controller = Get.put(AdminDoublesChampionsController());

    return Scaffold(
      appBar: AppBar(
        title: const Text('Doubles Champions'),
        backgroundColor: n.surfaceCard,
      ),
      body: Obx(() {
        if (controller.isLoading.value) {
          return const Center(child: CircularProgressIndicator());
        }

        if (controller.entries.isEmpty) {
          return const Center(child: Text('No records found'));
        }

        return ListView.builder(
          padding: const EdgeInsets.all(16),
          itemCount: controller.entries.length,
          itemBuilder: (_, i) {
            final e = controller.entries[i];

            return Padding(
              padding: const EdgeInsets.only(bottom: 14),
              child: BrassPlaqueTile(
                primary: 'Division ${e.division} — ${e.year}',
                secondary: 'Winners:\n'
                    '${e.championA} & ${e.championB}\n\n'
                    'Runners-up:\n'
                    '${e.runnerUpA} & ${e.runnerUpB}',
              ),
            );
          },
        );
      }),
    );
  }
}
