import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/theme/neda_theme.dart';
import 'admin_team_champions_controller.dart';

class AdminTeamChampionsScreen extends StatelessWidget {
  const AdminTeamChampionsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final n = Theme.of(context).extension<NedaTheme>()!;
    final controller = Get.put(AdminTeamChampionsController());

    return Scaffold(
      appBar: AppBar(
        title: const Text('Admin · Team Champions'),
        backgroundColor: n.surfaceCard,
      ),
      body: Obx(() {
        if (controller.isLoading.value) {
          return const Center(child: CircularProgressIndicator());
        }

        if (controller.champions.isEmpty) {
          return const Center(child: Text('No champions recorded'));
        }

        return ListView.builder(
          padding: const EdgeInsets.all(16),
          itemCount: controller.champions.length,
          itemBuilder: (_, i) {
            final c = controller.champions[i];

            return Container(
              margin: const EdgeInsets.only(bottom: 14),
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.black,
                borderRadius: BorderRadius.circular(16),
                boxShadow: n.shadowSoft,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '${c.year} · ${c.season} · Division ${c.division}',
                    style: NedaText.muted(context).copyWith(
                      color: Colors.amber.shade300,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    '🏆 ${c.champion}',
                    style: NedaText.body(context).copyWith(
                      color: Colors.white,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    'Runner-up: ${c.runnerUp}',
                    style: NedaText.muted(context).copyWith(
                      color: Colors.grey.shade300,
                    ),
                  ),
                ],
              ),
            );
          },
        );
      }),
    );
  }
}
