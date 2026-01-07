import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/theme/neda_theme.dart';
import 'admin_presidents_controller.dart';
import 'admin_presidents_form.dart';
import 'admin_presidents_tile.dart';

class AdminPresidentsScreen extends StatelessWidget {
  const AdminPresidentsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(AdminPresidentsController());
    final n = Theme.of(context).extension<NedaTheme>()!;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Manage Presidents'),
        actions: [
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: () {
              showDialog(
                context: context,
                builder: (_) => const AdminPresidentForm(),
              );
            },
          ),
        ],
      ),
      backgroundColor: n.surfaceSubtle,
      body: Obx(() {
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
            return AdminPresidentTile(
              entry: p,
              onEdit: () {
                showDialog(
                  context: context,
                  builder: (_) => AdminPresidentForm(existing: p),
                );
              },
            );
          },
        );
      }),
    );
  }
}
