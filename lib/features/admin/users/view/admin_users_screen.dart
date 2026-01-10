import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../widgets/admin_scaffold.dart';
import '../controller/admin_users_controller.dart';
import '../widgets/reset_pin_dialog.dart';

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

        return ListView.builder(
          itemCount: controller.users.length,
          itemBuilder: (context, index) {
            final user = controller.users[index]; // ✅ user exists here

            return ListTile(
              title: Text('Rego ${user.rego}'),
              subtitle: Text(user.role.name),
              trailing: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  IconButton(
                    icon: const Icon(Icons.lock_reset),
                    tooltip: 'Reset PIN',
                    onPressed: () {
                      showDialog(
                        context: context,
                        builder: (_) => ResetPinDialog(
                          userId: user.id, // ✅ VALID
                          rego: user.rego, // ✅ VALID
                        ),
                      );
                    },
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
