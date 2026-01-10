import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controller/admin_one_seventy_club_controller.dart';
import '../model/admin_one_seventy_club_entry.dart';

class AdminOneSeventyClubForm extends StatefulWidget {
  final AdminOneSeventyClubEntry? existing;

  const AdminOneSeventyClubForm({super.key, this.existing});

  @override
  State<AdminOneSeventyClubForm> createState() =>
      _AdminOneSeventyClubFormState();
}

class _AdminOneSeventyClubFormState extends State<AdminOneSeventyClubForm> {
  final year = TextEditingController();
  final division = TextEditingController();
  final champion1 = TextEditingController();
  final runnerUp1 = TextEditingController();
  final champion2 = TextEditingController();
  final runnerUp2 = TextEditingController();
  late final AdminOneSeventyClubsController controller;
  int _division = 1;

  @override
  void initState() {
    super.initState();

    if (widget.existing != null) {
      year.text = widget.existing!.year.toString();
      _division = widget.existing!.division;
      champion1.text = widget.existing!.champion1;
      runnerUp1.text = widget.existing!.runnerUp1;
      champion2.text = widget.existing!.champion2;
      runnerUp2.text = widget.existing!.runnerUp2;
    }
  }

  void _save() async {
    final entry = AdminOneSeventyClubEntry(
      year: int.parse(year.text),
      division: _division,
      champion1: champion1.text,
      runnerUp1: runnerUp1.text,
      champion2: champion2.text,
      runnerUp2: runnerUp2.text,
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
          ? 'Add Doubles Champion'
          : 'Edit Doubles Champion'),
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
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text('Champions'),
            ),
            TextField(
                controller: champion1,
                decoration: const InputDecoration(labelText: 'Player 1')),
            TextField(
                controller: champion2,
                decoration: const InputDecoration(labelText: 'Player 2')),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text('Runners Up'),
            ),
            TextField(
                controller: runnerUp1,
                decoration: const InputDecoration(labelText: 'Player 1')),
            TextField(
                controller: runnerUp2,
                decoration: const InputDecoration(labelText: 'Player 2')),
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
