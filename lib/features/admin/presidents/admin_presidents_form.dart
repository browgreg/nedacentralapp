import 'package:flutter/material.dart';

import 'admin_presidents_entry.dart';

class AdminPresidentForm extends StatelessWidget {
  final AdminPresidentEntry? existing;

  const AdminPresidentForm({super.key, this.existing});

  @override
  Widget build(BuildContext context) {
    final nameCtrl = TextEditingController(text: existing?.name ?? '');
    final startCtrl =
        TextEditingController(text: existing?.startYear.toString() ?? '');
    final endCtrl =
        TextEditingController(text: existing?.endYear.toString() ?? '');

    return AlertDialog(
      title: Text(existing == null ? 'Add President' : 'Edit President'),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          TextField(
              controller: nameCtrl,
              decoration: const InputDecoration(labelText: 'Name')),
          TextField(
              controller: startCtrl,
              decoration: const InputDecoration(labelText: 'Start Year')),
          TextField(
              controller: endCtrl,
              decoration:
                  const InputDecoration(labelText: 'End Year (0 = Present)')),
        ],
      ),
      actions: [
        TextButton(
            onPressed: Navigator.of(context).pop, child: const Text('Cancel')),
        ElevatedButton(
          onPressed: () {
            // TODO: hook into API
            Navigator.of(context).pop();
          },
          child: const Text('Save'),
        ),
      ],
    );
  }
}
