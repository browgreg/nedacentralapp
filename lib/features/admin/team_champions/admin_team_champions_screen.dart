import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/theme/neda_theme.dart';
import '../widgets/admin_scaffold.dart';
import 'admin_team_champion_form.dart';
import 'admin_team_champions_controller.dart';

class AdminTeamChampionsScreen extends StatelessWidget {
  const AdminTeamChampionsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(AdminTeamChampionsController());
    final n = Theme.of(context).extension<NedaTheme>()!;

    return AdminScaffold(
      title: 'Team Champions',
      child: Obx(() {
        if (controller.isLoading.value) {
          return const Center(child: CircularProgressIndicator());
        }

        return LayoutBuilder(
          builder: (context, constraints) {
            final isWide = constraints.maxWidth > 900;

            return GridView.builder(
              padding: const EdgeInsets.all(16),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: isWide ? 2 : 1,
                mainAxisSpacing: 16,
                crossAxisSpacing: 16,
                childAspectRatio: 3.2,
              ),
              itemCount: controller.champions.length,
              itemBuilder: (_, i) {
                final e = controller.champions[i];

                return Card(
                  elevation: 6,
                  color: n.surfaceCard,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(14),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 20,
                      vertical: 14,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        /// INFO
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              '${e.year} ${e.season} — Division ${e.division}',
                              style: Theme.of(context).textTheme.titleMedium,
                            ),
                            const SizedBox(height: 6),
                            Text(
                              e.champion,
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyLarge
                                  ?.copyWith(fontWeight: FontWeight.bold),
                            ),
                            Text(
                              'Runner-up: ${e.runnerUp}',
                              style: Theme.of(context).textTheme.bodyMedium,
                            ),
                          ],
                        ),

                        /// ACTIONS
                        Row(
                          children: [
                            IconButton(
                              icon: const Icon(Icons.edit),
                              onPressed: () {
                                showDialog(
                                  context: context,
                                  builder: (_) =>
                                      AdminTeamChampionForm(existing: e),
                                );
                              },
                            ),
                            IconButton(
                              icon: const Icon(Icons.delete),
                              onPressed: () {
                                controller.remove(e);
                              },
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                );
              },
            );
          },
        );
      }),
    );
  }
}
