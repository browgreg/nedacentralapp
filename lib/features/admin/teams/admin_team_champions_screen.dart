import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/theme/neda_theme.dart';
import '../../honours/widgets/brass_plaque_tile.dart';
import 'admin_team_champions_controller.dart';

class AdminTeamChampionsScreen extends StatelessWidget {
  const AdminTeamChampionsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final n = Theme.of(context).extension<NedaTheme>()!;
    final controller = Get.put(AdminTeamChampionsController());

    return Scaffold(
      appBar: AppBar(
        title: const Text('Team Champions'),
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
                primary: 'Division ${e.division} — ${e.season} ${e.year}',
                secondary: 'Champions:\n${e.champion}\n\n'
                    'Runners-up:\n${e.runnerUp}',
              ),
            );
          },
        );
      }),
    );
  }
}
