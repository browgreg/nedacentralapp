import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../auth_controller.dart';

class ChangePinScreen extends StatefulWidget {
  const ChangePinScreen({super.key});

  @override
  State<ChangePinScreen> createState() => _ChangePinScreenState();
}

class _ChangePinScreenState extends State<ChangePinScreen> {
  final pinCtrl = TextEditingController();
  final confirmCtrl = TextEditingController();

  void _submit() async {
    if (pinCtrl.text != confirmCtrl.text) {
      Get.snackbar('Error', 'PINs do not match');
      return;
    }

    if (pinCtrl.text.length < 4) {
      Get.snackbar('Error', 'PIN must be at least 4 digits');
      return;
    }

    await Get.find<AuthController>().changePin(pinCtrl.text);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Change PIN')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(
              controller: pinCtrl,
              obscureText: true,
              decoration: const InputDecoration(labelText: 'New PIN'),
            ),
            TextField(
              controller: confirmCtrl,
              obscureText: true,
              decoration: const InputDecoration(labelText: 'Confirm PIN'),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _submit,
              child: const Text('Save PIN'),
            ),
          ],
        ),
      ),
    );
  }
}
