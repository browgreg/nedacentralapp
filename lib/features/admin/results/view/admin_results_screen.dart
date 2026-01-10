import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../core/theme/neda_theme.dart';
import '../../../honours/widgets/brass_plaque_tile.dart';
import '../controller/admin_results_controller.dart';

class AdminResultsScreen extends StatelessWidget {
  const AdminResultsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final n = Theme.of(context).extension<NedaTheme>()!;
    final controller = Get.put(AdminResultsController());

    return Scaffold(
      appBar: AppBar(
        title: const Text('Results'),
        backgroundColor: n.surfaceCard,
      ),
      body: Obx(() {
        if (controller.isLoading.value) {
          return const Center(child: CircularProgressIndicator());
        }

        if (controller.results.isEmpty) {
          return const Center(child: Text('No results recorded'));
        }

        return ListView.builder(
          padding: const EdgeInsets.all(16),
          itemCount: controller.results.length,
          itemBuilder: (_, i) {
            final r = controller.results[i];

            return Padding(
              padding: const EdgeInsets.only(bottom: 14),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  if (controller.canUnlock && r.isLocked) ...[
                    ElevatedButton.icon(
                      icon: const Icon(Icons.lock_open),
                      label: const Text('Unlock Fixture'),
                      onPressed: () async {
                        await controller.unlockFixture(r.fixtureId);
                        Get.snackbar('Unlocked', 'Fixture unlocked');
                      },
                    ),
                    const SizedBox(height: 10),
                  ],
                  BrassPlaqueTile(
                    primary: 'Div ${r.division} • Round ${r.round}',
                    secondary: '${r.homeTeam}  ${r.homeScore}\n'
                        '${r.awayTeam}  ${r.awayScore}\n\n'
                        'Played ${r.date}'
                        '${r.isLocked ? '\n\n🔒 Locked' : ''}',
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
