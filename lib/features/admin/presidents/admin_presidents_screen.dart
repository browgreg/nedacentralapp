import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../widgets/admin_scaffold.dart';
import 'admin_presidents_controller.dart';

class AdminPresidentsScreen extends StatelessWidget {
  const AdminPresidentsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(AdminPresidentsController());

    return AdminScaffold(
      title: 'Presidents',
      child: Obx(() {
        if (controller.isLoading.value) {
          return const Center(child: CircularProgressIndicator());
        }

        if (controller.presidents.isEmpty) {
          return const Center(
            child: Text('No presidents found'),
          );
        }

        return ListView.builder(
          padding: const EdgeInsets.all(16),
          itemCount: controller.presidents.length,
          itemBuilder: (_, i) {
            final p = controller.presidents[i];

            final term = p.endYear == 0
                ? '${p.startYear} – Present'
                : '${p.startYear} – ${p.endYear}';

            return Card(
              margin: const EdgeInsets.only(bottom: 12),
              child: ListTile(
                title: Text(p.name),
                subtitle: Text(term),
                trailing: const Icon(Icons.lock_outline), // read-only for now
              ),
            );
          },
        );
      }),
    );
  }
}
