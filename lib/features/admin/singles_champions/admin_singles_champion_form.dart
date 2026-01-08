import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'admin_singles_champions_controller.dart';
import 'admin_singles_champions_entry.dart';

class AdminSinglesChampionForm extends StatefulWidget {
  final AdminSinglesChampionEntry? existing;

  const AdminSinglesChampionForm({super.key, this.existing});

  @override
  State<AdminSinglesChampionForm> createState() =>
      _AdminSinglesChampionFormState();
}

class _AdminSinglesChampionFormState extends State<AdminSinglesChampionForm> {
  final year = TextEditingController();
  final division = TextEditingController();
  final champion = TextEditingController();
  final runnerUp = TextEditingController();
  late final AdminSinglesChampionsController controller;
  int _division = 1;

  @override
  void initState() {
    super.initState();

    if (widget.existing != null) {
      year.text = widget.existing!.year.toString();
      _division = widget.existing!.division;
      champion.text = widget.existing!.champion;
      runnerUp.text = widget.existing!.runnerUp;
    }
  }

  void _save() async {
    final entry = AdminSinglesChampionEntry(
      year: int.parse(year.text),
      division: _division,
      champion: champion.text,
      runnerUp: runnerUp.text,
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
      title: Text(widget.existing == null
          ? 'Add Singles Champion'
          : 'Edit Singles Champion'),
      content: SingleChildScrollView(
        child: Column(
          children: [
            TextField(
                controller: year,
                decoration: const InputDecoration(labelText: 'Year')),
            DropdownButtonFormField<int>(
              initialValue: _division,
              decoration: const InputDecoration(
                labelText: 'Division',
              ),
              items: const [
                DropdownMenuItem(value: 1, child: Text('Division 1')),
                DropdownMenuItem(value: 2, child: Text('Division 2')),
                DropdownMenuItem(value: 3, child: Text('Division 3')),
                DropdownMenuItem(value: 4, child: Text('Division 4')),
              ],
              onChanged: (value) {
                if (value != null) {
                  setState(() => _division = value);
                }
              },
            ),
            TextField(
                controller: champion,
                decoration: const InputDecoration(labelText: 'Champion')),
            TextField(
                controller: runnerUp,
                decoration: const InputDecoration(labelText: 'Runner-up')),
          ],
        ),
      ),
      actions: [
        TextButton(onPressed: Get.back, child: const Text('Cancel')),
        ElevatedButton(onPressed: _save, child: const Text('Save')),
      ],
    );
  }
}
