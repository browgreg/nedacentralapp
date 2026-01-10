import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controller/admin_presidents_controller.dart';
import '../model/admin_presidents_entry.dart';

class AdminPresidentForm extends StatefulWidget {
  final AdminPresidentEntry? existing;

  const AdminPresidentForm({
    super.key,
    this.existing,
  });

  @override
  State<AdminPresidentForm> createState() => _AdminPresidentFormState();
}

class _AdminPresidentFormState extends State<AdminPresidentForm> {
  final _regoCtrl = TextEditingController();
  final _startCtrl = TextEditingController();
  final _endCtrl = TextEditingController();

  String? resolvedName;
  bool isLookingUp = false;

  late final AdminPresidentsController controller;

  @override
  void initState() {
    super.initState();
    controller = Get.find<AdminPresidentsController>();

    if (widget.existing != null) {
      _regoCtrl.text = widget.existing!.rego.toString();
      _startCtrl.text = widget.existing!.startYear.toString();
      _endCtrl.text = widget.existing!.endYear.toString();
      resolvedName = widget.existing!.name;
    }
  }

  @override
  void dispose() {
    _regoCtrl.dispose();
    _startCtrl.dispose();
    _endCtrl.dispose();
    super.dispose();
  }

  // ─────────────────────────
  // LOOKUP MEMBER BY REGO
  // ─────────────────────────
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

  // ─────────────────────────
  // SAVE
  // ─────────────────────────
  Future<void> _save() async {
    if (resolvedName == null) {
      Get.snackbar('Missing', 'Please lookup and confirm a member first');
      return;
    }

    final entry = AdminPresidentEntry(
      id: widget.existing?.id,
      rego: int.parse(_regoCtrl.text),
      name: resolvedName!,
      startYear: int.parse(_startCtrl.text),
      endYear: int.parse(_endCtrl.text),
    );

    if (widget.existing == null) {
      await controller.add(entry);
    } else {
      await controller.updateExisting(widget.existing!, entry);
    }

    Get.back();
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(
        widget.existing == null ? 'Add President' : 'Edit President',
      ),
      content: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            /// REGO INPUT
            TextField(
              controller: _regoCtrl,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: 'Member Rego Number',
              ),
            ),
            const SizedBox(height: 8),

            /// LOOKUP BUTTON
            Align(
              alignment: Alignment.centerRight,
              child: ElevatedButton.icon(
                onPressed: isLookingUp ? null : _lookup,
                icon: const Icon(Icons.search),
                label: const Text('Lookup'),
              ),
            ),

            /// NAME RESULT
            if (resolvedName != null) ...[
              const SizedBox(height: 12),
              Container(
                padding: const EdgeInsets.all(12),
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.green.withAlpha(26),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Text(
                  resolvedName!,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],

            const SizedBox(height: 16),

            /// YEARS
            TextField(
              controller: _startCtrl,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(labelText: 'Start Year'),
            ),
            TextField(
              controller: _endCtrl,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(labelText: 'End Year'),
            ),
          ],
        ),
      ),
      actions: [
        TextButton(
          onPressed: Get.back,
          child: const Text('Cancel'),
        ),
        ElevatedButton(
          onPressed: _save,
          child: const Text('Save'),
        ),
      ],
    );
  }
}
