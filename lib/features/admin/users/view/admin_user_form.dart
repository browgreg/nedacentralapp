import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';

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

  void _save() async {
    final rego = int.tryParse(regoCtrl.text);
    if (rego == null || pinCtrl.text.length < 4) {
      Get.snackbar('Error', 'Invalid rego or PIN');
      return;
    }

    await Get.find<AdminUsersController>().addUser(rego, role, pinCtrl.text);

    Get.back();
    Get.snackbar('Success', 'User created');
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Create User'),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          TextField(
            controller: regoCtrl,
            keyboardType: TextInputType.number,
            decoration: const InputDecoration(labelText: 'Rego'),
          ),
          TextField(
            controller: pinCtrl,
            obscureText: true,
            decoration: const InputDecoration(labelText: 'Initial PIN'),
          ),
          DropdownButtonFormField<UserRole>(
            initialValue: role,
            items: UserRole.values.map((r) {
              return DropdownMenuItem(
                value: r,
                child: Text(r.name),
              );
            }).toList(),
            onChanged: (r) => setState(() => role = r!),
            decoration: const InputDecoration(labelText: 'Role'),
          ),
        ],
      ),
      actions: [
        TextButton(onPressed: Get.back, child: const Text('Cancel')),
        ElevatedButton(onPressed: _save, child: const Text('Create')),
      ],
    );
  }
}
