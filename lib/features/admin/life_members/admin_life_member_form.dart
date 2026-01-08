import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'admin_life_members_controller.dart';

class AdminLifeMemberForm extends StatefulWidget {
  const AdminLifeMemberForm({super.key});

  @override
  State<AdminLifeMemberForm> createState() => _AdminLifeMemberFormState();
}

class _AdminLifeMemberFormState extends State<AdminLifeMemberForm> {
  final _regoCtrl = TextEditingController();
  final _yearCtrl = TextEditingController();

  bool isLookingUp = false;
  String? resolvedName;

  late final AdminLifeMembersController controller;

  @override
  void initState() {
    super.initState();
    controller = Get.find<AdminLifeMembersController>();
  }

  @override
  void dispose() {
    _regoCtrl.dispose();
    _yearCtrl.dispose();
    super.dispose();
  }

  Future<void> _lookup() async {
    setState(() {
      isLookingUp = true;
      resolvedName = null;
    });

    try {
      final name = await controller.lookupMemberName(int.parse(_regoCtrl.text));
      setState(() => resolvedName = name);
    } catch (_) {
      Get.snackbar('Not found', 'No member found for that rego');
    } finally {
      setState(() => isLookingUp = false);
    }
  }

  Future<void> _save() async {
    await controller.addLifeMember(
      rego: int.parse(_regoCtrl.text),
      inductionYear: int.parse(_yearCtrl.text),
    );
    Get.back();
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Add Life Member'),
      content: SingleChildScrollView(
        child: Column(
          children: [
            TextField(
              controller: _regoCtrl,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(labelText: 'Member Rego'),
            ),
            const SizedBox(height: 8),
            ElevatedButton(
              onPressed: isLookingUp ? null : _lookup,
              child: isLookingUp
                  ? const CircularProgressIndicator()
                  : const Text('Lookup Name'),
            ),
            if (resolvedName != null) ...[
              const SizedBox(height: 12),
              Text(
                resolvedName!,
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
            ],
            const SizedBox(height: 16),
            TextField(
              controller: _yearCtrl,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(labelText: 'Induction Year'),
            ),
          ],
        ),
      ),
      actions: [
        TextButton(onPressed: Get.back, child: const Text('Cancel')),
        ElevatedButton(
          onPressed: resolvedName == null ? null : _save,
          child: const Text('Save'),
        ),
      ],
    );
  }
}
