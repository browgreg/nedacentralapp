import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'admin_users_controller.dart';
import 'admin_users_entry.dart';

class AdminUserForm extends StatefulWidget {
  const AdminUserForm({super.key});

  @override
  State<AdminUserForm> createState() => _AdminUserFormState();
}

class _AdminUserFormState extends State<AdminUserForm> {
  final regoCtrl = TextEditingController();
  UserRole role = UserRole.player;

  late final AdminUsersController controller;

  @override
  void initState() {
    super.initState();
    controller = Get.find<AdminUsersController>();
  }

  void _save() async {
    final rego = int.tryParse(regoCtrl.text);
    if (rego == null) {
      Get.snackbar('Invalid', 'Rego must be a number');
      return;
    }

    await controller.add(rego, role);
    Get.back();
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
            decoration: const InputDecoration(labelText: 'Rego number'),
          ),
          DropdownButtonFormField<UserRole>(
            value: role,
            items: UserRole.values
                .map(
                  (r) => DropdownMenuItem(
                    value: r,
                    child: Text(r.name.toUpperCase()),
                  ),
                )
                .toList(),
            onChanged: (r) => setState(() => role = r!),
            decoration: const InputDecoration(labelText: 'Role'),
          ),
        ],
      ),
      actions: [
        TextButton(onPressed: Get.back, child: const Text('Cancel')),
        ElevatedButton(onPressed: _save, child: const Text('Save')),
      ],
    );
  }
}
