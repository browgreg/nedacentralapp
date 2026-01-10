import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controller/admin_results_controller.dart';

class AdminResultsScreen extends StatelessWidget {
  const AdminResultsScreen({super.key});

  Future<String?> _askOverrideReason() async {
    final ctrl = TextEditingController();

    return Get.dialog<String>(
      AlertDialog(
        title: const Text('Admin Override'),
        content: TextField(
          controller: ctrl,
          maxLines: 3,
          decoration: const InputDecoration(
            labelText: 'Reason for override',
          ),
        ),
        actions: [
          TextButton(
            onPressed: Get.back,
            child: const Text('Cancel'),
          ),
          ElevatedButton(
            onPressed: () {
              final text = ctrl.text.trim();
              if (text.isEmpty) return;
              Get.back(result: text);
            },
            child: const Text('Confirm'),
          ),
        ],
      ),
      barrierDismissible: false,
    );
  }

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(AdminResultsController());

    return Scaffold(
      appBar: AppBar(title: const Text('Results')),
      body: Obx(() {
        if (controller.isLoading.value) {
          return const Center(child: CircularProgressIndicator());
        }

        if (controller.results.isEmpty) {
          return const Center(child: Text('No results found'));
        }

        return ListView.builder(
          padding: const EdgeInsets.all(16),
          itemCount: controller.results.length,
          itemBuilder: (_, i) {
            final r = controller.results[i];

            return Card(
              child: ListTile(
                title: Text('Div ${r.division} • Round ${r.round}'),
                subtitle: Text(
                  '${r.homeTeam} ${r.homeScore}\n'
                  '${r.awayTeam} ${r.awayScore}',
                ),
                trailing: r.isLocked
                    ? IconButton(
                        icon: const Icon(Icons.lock_open),
                        tooltip: 'Unlock & Override',
                        onPressed: () async {
                          final reason = await _askOverrideReason();
                          if (reason == null) return;

                          await controller.unlock(
                            fixtureId: r.fixtureId,
                            reason: reason,
                          );

                          Get.snackbar(
                            'Unlocked',
                            'Fixture unlocked with reason recorded',
                          );
                        },
                      )
                    : const Icon(Icons.lock_open, color: Colors.green),
              ),
            );
          },
        );
      }),
    );
  }
}
