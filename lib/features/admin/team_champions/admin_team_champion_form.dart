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
  late final TextEditingController year;
  late final TextEditingController season;
  late final TextEditingController division;
  late final TextEditingController champion;
  late final TextEditingController runnerUp;

  @override
  void initState() {
    super.initState();
    final e = widget.existing;

    year = TextEditingController(text: e?.year.toString() ?? '');
    season = TextEditingController(text: e?.season ?? '');
    division = TextEditingController(text: e?.division.toString() ?? '');
    champion = TextEditingController(text: e?.champion ?? '');
    runnerUp = TextEditingController(text: e?.runnerUp ?? '');
  }

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<AdminTeamChampionsController>();

    return AlertDialog(
      title: Text(
          widget.existing == null ? 'Add Team Champion' : 'Edit Team Champion'),
      content: SingleChildScrollView(
        child: Column(
          children: [
            TextField(
                controller: year,
                decoration: const InputDecoration(labelText: 'Year')),
            TextField(
                controller: season,
                decoration: const InputDecoration(labelText: 'Season')),
            TextField(
                controller: division,
                decoration: const InputDecoration(labelText: 'Division')),
            TextField(
                controller: champion,
                decoration: const InputDecoration(labelText: 'Champion')),
            TextField(
                controller: runnerUp,
                decoration: const InputDecoration(labelText: 'Runner Up')),
          ],
        ),
      ),
      actions: [
        TextButton(onPressed: Get.back, child: const Text('Cancel')),
        ElevatedButton(
          onPressed: () {
            final entry = AdminTeamChampionEntry(
              year: int.parse(year.text),
              season: season.text,
              division: int.parse(division.text),
              champion: champion.text,
              runnerUp: runnerUp.text,
            );

            if (widget.existing == null) {
              controller.add(entry);
            } else {
              final index = controller.champions.indexOf(widget.existing!);
              controller.updateEntry(index, entry);
            }
            Get.back();
          },
          child: const Text('Save'),
        ),
      ],
    );
  }
}
