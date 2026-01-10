import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controller/admin_users_controller.dart';

class ResetPinDialog extends StatefulWidget {
  final int userId;
  final int rego;

  const ResetPinDialog({
    super.key,
    required this.userId,
    required this.rego,
  });

  @override
  State<ResetPinDialog> createState() => _ResetPinDialogState();
}

class _ResetPinDialogState extends State<ResetPinDialog> {
  final pinCtrl = TextEditingController();
  late final AdminUsersController controller;

  @override
  void initState() {
    super.initState();
    controller = Get.find<AdminUsersController>();
  }

  Future<void> _save() async {
    if (pinCtrl.text.length < 4) {
      Get.snackbar('Invalid PIN', 'PIN must be at least 4 digits');
      return;
    }

    await controller.resetPin(
      widget.userId,
      pinCtrl.text.trim(),
    );

    Get.back();
    Get.snackbar('PIN Reset', 'PIN updated for rego ${widget.rego}');
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Reset PIN'),
      content: TextField(
        controller: pinCtrl,
        keyboardType: TextInputType.number,
        obscureText: true,
        decoration: const InputDecoration(
          labelText: 'New PIN',
        ),
      ),
      actions: [
        TextButton(onPressed: Get.back, child: const Text('Cancel')),
        ElevatedButton(onPressed: _save, child: const Text('Reset')),
      ],
    );
  }
}
