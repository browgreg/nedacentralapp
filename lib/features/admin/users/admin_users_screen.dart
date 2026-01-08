import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../widgets/admin_scaffold.dart';
import 'admin_users_controller.dart';
import 'admin_users_form.dart';
import 'admin_users_tile.dart';

class AdminUsersScreen extends StatelessWidget {
  const AdminUsersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(AdminUsersController());

    return AdminScaffold(
      title: 'User Access',
      child: Obx(() {
        if (controller.isLoading.value) {
          return const Center(child: CircularProgressIndicator());
        }

        return Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(16),
              child: Align(
                alignment: Alignment.centerLeft,
                child: ElevatedButton.icon(
                  icon: const Icon(Icons.add),
                  label: const Text('Add User'),
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (_) => const AdminUserForm(),
                    );
                  },
                ),
              ),
            ),
            Expanded(
              child: ListView(
                padding: const EdgeInsets.all(16),
                children: controller.users
                    .map(
                      (u) => AdminUserTile(
                        user: u,
                        onRoleChanged: (r) => controller.updateRole(u, r),
                        onToggle: () => controller.toggle(u),
                      ),
                    )
                    .toList(),
              ),
            ),
          ],
        );
      }),
    );
  }
}
