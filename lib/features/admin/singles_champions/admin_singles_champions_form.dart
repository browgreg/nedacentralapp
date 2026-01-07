import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'admin_singles_champions_controller.dart';
import 'singles_champion_entry.dart';

class AdminSinglesChampionForm extends StatefulWidget {
  final AdminSinglesChampionEntry? existing;

  const AdminSinglesChampionForm({
    super.key,
    this.existing,
  });

  @override
  State<AdminSinglesChampionForm> createState() =>
      _AdminSinglesChampionFormState();
}

class _AdminSinglesChampionFormState extends State<AdminSinglesChampionForm> {
  final _year = TextEditingController();
  final _division = TextEditingController();
  final _champion = TextEditingController();
  final _runnerUp = TextEditingController();

  late final AdminSinglesChampionsController controller;

  @override
  void initState() {
    super.initState();
    controller = Get.find<AdminSinglesChampionsController>();

    final e = widget.existing;
    if (e != null) {
      _year.text = e.year.toString();
      _division.text = e.division.toString();
      _champion.text = e.champion;
      _runnerUp.text = e.runnerUp;
    }
  }

  @override
  void dispose() {
    _year.dispose();
    _division.dispose();
    _champion.dispose();
    _runnerUp.dispose();
    super.dispose();
  }

  Future<void> _save() async {
    final entry = AdminSinglesChampionEntry(
      id: widget.existing?.id,
      year: int.parse(_year.text),
      division: int.parse(_division.text),
      champion: _champion.text,
      runnerUp: _runnerUp.text,
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
        widget.existing == null
            ? 'Add Singles Champion'
            : 'Edit Singles Champion',
      ),
      content: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(
              controller: _year,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(labelText: 'Year'),
            ),
            TextField(
              controller: _division,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(labelText: 'Division'),
            ),
            TextField(
              controller: _champion,
              decoration: const InputDecoration(labelText: 'Champion'),
            ),
            TextField(
              controller: _runnerUp,
              decoration: const InputDecoration(labelText: 'Runner-up'),
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
