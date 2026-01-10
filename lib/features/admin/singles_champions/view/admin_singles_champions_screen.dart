import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../widgets/admin_scaffold.dart';
import '../controller/admin_singles_champions_controller.dart';
import '../widgets/admin_singles_champions_form.dart';

class AdminSinglesChampionsScreen extends StatelessWidget {
  const AdminSinglesChampionsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(AdminSinglesChampionsController());
    return AdminScaffold(
      title: 'Singles Champions',
      child: Obx(() {
        if (controller.isLoading.value) {
          return const Center(child: CircularProgressIndicator());
        }

        return Column(
          children: [
            // ─────────────────────────
            // ADD BUTTON
            // ─────────────────────────
            Padding(
              padding: const EdgeInsets.fromLTRB(16, 16, 16, 8),
              child: SizedBox(
                width: double.infinity,
                child: ElevatedButton.icon(
                  icon: const Icon(Icons.add),
                  label: const Text('Add singles Champion'),
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (_) => const AdminSinglesChampionForm(),
                    );
                  },
                ),
              ),
            ),

            // ─────────────────────────
            // LIST
            // ─────────────────────────
            Expanded(
              child: ListView.separated(
                padding: const EdgeInsets.fromLTRB(16, 8, 16, 16),
                itemCount: controller.champions.length,
                separatorBuilder: (_, __) => const SizedBox(height: 8),
                itemBuilder: (_, i) {
                  final e = controller.champions[i];

                  return Card(
                    elevation: 2,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 14,
                        vertical: 10, // 👈 MUCH smaller
                      ),
                      child: Row(
                        children: [
                          // ─────────────────────────
                          // INFO
                          // ─────────────────────────
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  '${e.year}  — Div ${e.division}',
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyMedium
                                      ?.copyWith(fontWeight: FontWeight.bold),
                                ),
                                const SizedBox(height: 2),
                                Text(
                                  'Winner: ${e.championName}',
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyMedium
                                      ?.copyWith(fontWeight: FontWeight.bold),
                                ),
                                Text(
                                  'Runner-up: ${e.runnerUpName}',
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyMedium
                                      ?.copyWith(fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                          ),

                          // ─────────────────────────
                          // ACTIONS
                          // ─────────────────────────
                          IconButton(
                            icon: const Icon(Icons.edit, size: 20),
                            onPressed: () {
                              showDialog(
                                context: context,
                                builder: (_) =>
                                    AdminSinglesChampionForm(existing: e),
                              );
                            },
                          ),
                          IconButton(
                            icon: const Icon(Icons.delete, size: 20),
                            onPressed: () => controller.remove(e),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        );
      }),
    );
  }
}
