import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../controller/committee_controller.dart';
import '../model/committee_member.dart';
import '../model/committee_role.dart';

class CommitteeAssignMemberDialog extends StatefulWidget {
  final CommitteeRole role;
  final CommitteeMember? existing;

  const CommitteeAssignMemberDialog({
    super.key,
    required this.role,
    this.existing,
  });

  @override
  State<CommitteeAssignMemberDialog> createState() =>
      _CommitteeAssignMemberDialogState();
}

class _CommitteeAssignMemberDialogState
    extends State<CommitteeAssignMemberDialog> {
  final regoCtrl = TextEditingController();
  final nameCtrl = TextEditingController(); // ✅ display-only

  bool isLookingUp = false;

  late final CommitteeController controller;

  @override
  void initState() {
    super.initState();
    controller = Get.find<CommitteeController>();

    if (widget.existing != null) {
      regoCtrl.text = widget.existing!.rego.toString();
      nameCtrl.text = widget.existing!.name;
    }
  }

  @override
  void dispose() {
    regoCtrl.dispose();
    nameCtrl.dispose();
    super.dispose();
  }

  Future<void> _lookup() async {
    final raw = regoCtrl.text.trim();
    final rego = int.tryParse(raw);

    if (rego == null) {
      Get.snackbar('Invalid', 'Rego must be a number');
      return;
    }

    if (mounted) {
      setState(() => isLookingUp = true);
      nameCtrl.text = '';
    }

    try {
      final name = await controller.lookupMemberName(rego);
      if (!mounted) return;
      nameCtrl.text = name;
    } catch (_) {
      if (!mounted) return;
      nameCtrl.text = '';
      Get.snackbar('Not found', 'No member found for that rego');
    } finally {
      if (mounted) setState(() => isLookingUp = false);
    }
  }

  void _save() {
    final rego = int.tryParse(regoCtrl.text.trim());
    if (rego == null) {
      Get.snackbar('Missing', 'Rego must be a number');
      return;
    }

    final resolvedName = nameCtrl.text.trim();
    if (resolvedName.isEmpty) {
      Get.snackbar('Resolve member', 'Please lookup the rego first');
      return;
    }

    controller.assignMember(
      widget.role,
      CommitteeMember(rego: rego, name: resolvedName),
    );

    Get.back();
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('Assign ${widget.role.label}'),
      content: SizedBox(
        width: 520, // ✅ gives the dialog a nicer desktop/tablet layout
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // ✅ single row: rego (left) + name (right) + lookup
            Row(
              children: [
                Expanded(
                  flex: 2,
                  child: TextField(
                    controller: regoCtrl,
                    keyboardType: TextInputType.number,
                    inputFormatters: [
                      FilteringTextInputFormatter.digitsOnly,
                    ],
                    decoration: const InputDecoration(
                      labelText: 'Rego',
                    ),
                    onSubmitted: (_) => _lookup(),
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  flex: 4,
                  child: TextField(
                    controller: nameCtrl,
                    readOnly: true,
                    decoration: const InputDecoration(
                      labelText: 'Name',
                      hintText: 'Lookup required',
                    ),
                  ),
                ),
                const SizedBox(width: 8),
                IconButton(
                  tooltip: 'Lookup',
                  onPressed: isLookingUp ? null : _lookup,
                  icon: isLookingUp
                      ? const SizedBox(
                          width: 18,
                          height: 18,
                          child: CircularProgressIndicator(strokeWidth: 2),
                        )
                      : const Icon(Icons.search),
                ),
              ],
            ),
          ],
        ),
      ),
      actions: [
        TextButton(onPressed: Get.back, child: const Text('Cancel')),
        if (widget.existing != null)
          TextButton(
            onPressed: () {
              controller.clearRole(widget.role);
              Get.back();
            },
            child: const Text('Clear'),
          ),
        ElevatedButton(onPressed: _save, child: const Text('Save')),
      ],
    );
  }
}
