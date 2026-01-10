import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../routes/app_routes.dart';
import '../auth_controller.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final regoCtrl = TextEditingController();
  final pinCtrl = TextEditingController();
  bool loading = false;

  final auth = Get.find<AuthController>();

  Future<void> _login() async {
    final rego = int.tryParse(regoCtrl.text.trim());
    final pin = pinCtrl.text.trim();

    if (rego == null || pin.isEmpty) {
      Get.snackbar('Error', 'Enter rego and PIN');
      return;
    }

    setState(() => loading = true);

    try {
      await auth.login(rego, pin);

      if (auth.session?.mustChangePin == true) {
        Get.offAllNamed(AppRoutes.changePin);
      } else {
        Get.offAllNamed(AppRoutes.admin);
      }
    } catch (e) {
      Get.snackbar('Login failed', 'Invalid credentials');
    } finally {
      setState(() => loading = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Login')),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(
              controller: regoCtrl,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(labelText: 'Rego'),
            ),
            const SizedBox(height: 12),
            TextField(
              controller: pinCtrl,
              obscureText: true,
              decoration: const InputDecoration(labelText: 'PIN'),
            ),
            const SizedBox(height: 24),
            ElevatedButton(
              onPressed: loading ? null : _login,
              child: loading
                  ? const CircularProgressIndicator()
                  : const Text('Login'),
            ),
          ],
        ),
      ),
    );
  }
}
