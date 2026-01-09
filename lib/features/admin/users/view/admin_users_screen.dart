import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../dashboard/widgets/section_header.dart';
import '../../widgets/admin_scaffold.dart';
import '../controller/admin_users_controller.dart';
import '../widgets/admin_users_tile.dart';

class AdminUsersScreen extends StatelessWidget {
  const AdminUsersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(AdminUsersController());

    return AdminScaffold(
      title: 'Users',
      child: Obx(() {
        if (controller.isLoading.value) {
          return const Center(child: CircularProgressIndicator());
        }

        return ListView(
          padding: const EdgeInsets.all(16),
          children: [
            const SectionHeader(title: 'Registered Users'),
            const SizedBox(height: 12),
            ...controller.users.map(
              (u) => AdminUserTile(
                user: u,
                onRoleChanged: (r) => controller.updateRole(u.id, r),
                onActiveChanged: (v) => controller.toggleActive(u.id, v),
              ),
            ),
          ],
        );
      }),
    );
  }
}
