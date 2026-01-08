import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'admin_team_champions_controller.dart';
import 'admin_team_champions_entry.dart';

class AdminTeamChampionForm extends StatefulWidget {
  final AdminTeamChampionEntry? existing;

  const AdminTeamChampionForm({super.key, this.existing});

  @override
  State<AdminTeamChampionForm> createState() => _AdminTeamChampionFormState();
}

class _AdminTeamChampionFormState extends State<AdminTeamChampionForm> {
  final year = TextEditingController();
  final season = TextEditingController();
  final division = TextEditingController();
  final champion = TextEditingController();
  final runnerUp = TextEditingController();
  String _season = 'Winter'; // default
  late final AdminTeamChampionsController controller;
  int _division = 1;

  @override
  void initState() {
    super.initState();

    if (widget.existing != null) {
      year.text = widget.existing!.year.toString();
      _division = widget.existing!.division;
      champion.text = widget.existing!.champion;
      runnerUp.text = widget.existing!.runnerUp;
      _season = widget.existing!.season; // 👈 important
    }
  }

  void _save() async {
    final entry = AdminTeamChampionEntry(
      year: int.parse(year.text),
      season: _season,
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
      title: Text(
          widget.existing == null ? 'Add Team Champion' : 'Edit Team Champion'),
      content: SingleChildScrollView(
        child: Column(
          children: [
            TextField(
                controller: year,
                decoration: const InputDecoration(labelText: 'Year')),
            DropdownButtonFormField<String>(
              initialValue: _season,
              decoration: const InputDecoration(
                labelText: 'Season',
              ),
              items: const [
                DropdownMenuItem(
                  value: 'Summer',
                  child: Text('Summer'),
                ),
                DropdownMenuItem(
                  value: 'Winter',
                  child: Text('Winter'),
                ),
              ],
              onChanged: (value) {
                if (value != null) {
                  setState(() => _season = value);
                }
              },
            ),
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
                decoration: const InputDecoration(labelText: 'Champions')),
            TextField(
                controller: runnerUp,
                decoration: const InputDecoration(labelText: 'Runners-up')),
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
