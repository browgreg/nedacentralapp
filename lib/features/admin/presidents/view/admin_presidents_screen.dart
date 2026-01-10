import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../widgets/admin_scaffold.dart';
import '../controller/admin_presidents_controller.dart';
import '../widgets/admin_presidents_form.dart';
import '../widgets/admin_presidents_tile.dart';

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

        return Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            /// ➕ ADD BUTTON (TOP)
            Padding(
              padding: const EdgeInsets.fromLTRB(16, 16, 16, 8),
              child: ElevatedButton.icon(
                icon: const Icon(Icons.add),
                label: const Text('Add President'),
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (_) => const AdminPresidentForm(),
                  );
                },
              ),
            ),

            /// LIST
            Expanded(
              child: controller.presidents.isEmpty
                  ? const Center(
                      child: Text('No presidents recorded'),
                    )
                  : ListView.builder(
                      padding: const EdgeInsets.fromLTRB(16, 8, 16, 16),
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
                          onDelete: () async {
                            await controller.remove(p);
                          },
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
