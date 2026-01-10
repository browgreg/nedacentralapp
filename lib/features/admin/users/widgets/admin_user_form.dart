import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../auth/user_role.dart';
import '../controller/admin_users_controller.dart';

class AdminUserForm extends StatefulWidget {
  const AdminUserForm({super.key});

  @override
  State<AdminUserForm> createState() => _AdminUserFormState();
}

class _AdminUserFormState extends State<AdminUserForm> {
  final regoCtrl = TextEditingController();
  final pinCtrl = TextEditingController();

  UserRole role = UserRole.PLAYER;

  late final AdminUsersController controller;

  @override
  void initState() {
    super.initState();
    controller = Get.find<AdminUsersController>();
  }

  Future<void> _save() async {
    final rego = int.tryParse(regoCtrl.text.trim());

    if (rego == null) {
      Get.snackbar('Invalid', 'Rego must be a number');
      return;
    }

    if (pinCtrl.text.length < 4) {
      Get.snackbar('Invalid', 'PIN must be at least 4 digits');
      return;
    }

    await controller.addUser(
      rego,
      role,
      pinCtrl.text.trim(),
    );

    Get.back();
  }

  @override
  void dispose() {
    regoCtrl.dispose();
    pinCtrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Add User'),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          TextField(
            controller: regoCtrl,
            keyboardType: TextInputType.number,
            decoration: const InputDecoration(labelText: 'Rego'),
          ),
          const SizedBox(height: 12),
          DropdownButtonFormField<UserRole>(
            value: role,
            items: UserRole.values
                .map(
                  (r) => DropdownMenuItem(
                    value: r,
                    child: Text(r.name),
                  ),
                )
                .toList(),
            onChanged: (r) => setState(() => role = r!),
            decoration: const InputDecoration(labelText: 'Role'),
          ),
          const SizedBox(height: 12),
          TextField(
            controller: pinCtrl,
            obscureText: true,
            decoration: const InputDecoration(
              labelText: 'Temporary PIN',
            ),
          ),
        ],
      ),
      actions: [
        TextButton(
          onPressed: Get.back,
          child: const Text('Cancel'),
        ),
        ElevatedButton(
          onPressed: _save,
          child: const Text('Create User'),
        ),
      ],
    );
  }
}
