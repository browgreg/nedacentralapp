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
  final yearCtrl = TextEditingController();
  int _division = 1;

  final championRegoCtrl = TextEditingController();
  final runnerUpRegoCtrl = TextEditingController();

  String? championName;
  String? runnerUpName;

  bool lookingUpChampion = false;
  bool lookingUpRunnerUp = false;

  late final AdminSinglesChampionsController controller;

  @override
  void initState() {
    super.initState();
    controller = Get.find<AdminSinglesChampionsController>();

    if (widget.existing != null) {
      yearCtrl.text = widget.existing!.year.toString();
      _division = widget.existing!.division;

      // ✅ correct fields
      championRegoCtrl.text = widget.existing!.winnerRego.toString();
      runnerUpRegoCtrl.text = widget.existing!.runnerRego.toString();

      // ✅ show names immediately
      championName = widget.existing!.championName;
      runnerUpName = widget.existing!.runnerUpName;
    }
  }

  @override
  void dispose() {
    yearCtrl.dispose();
    championRegoCtrl.dispose();
    runnerUpRegoCtrl.dispose();
    super.dispose();
  }

  Future<void> _lookupChampion() async {
    final rego = int.tryParse(championRegoCtrl.text.trim());
    if (rego == null) {
      Get.snackbar('Invalid', 'Champion rego must be numeric');
      return;
    }

    setState(() {
      lookingUpChampion = true;
      championName = null;
    });

    try {
      final name = await controller.lookupMemberName(rego);
      setState(() => championName = name);
    } catch (_) {
      Get.snackbar('Not found', 'No member found for champion rego');
    } finally {
      setState(() => lookingUpChampion = false);
    }
  }

  Future<void> _lookupRunnerUp() async {
    final rego = int.tryParse(runnerUpRegoCtrl.text.trim());
    if (rego == null) {
      Get.snackbar('Invalid', 'Runner-up rego must be numeric');
      return;
    }

    setState(() {
      lookingUpRunnerUp = true;
      runnerUpName = null;
    });

    try {
      final name = await controller.lookupMemberName(rego);
      setState(() => runnerUpName = name);
    } catch (_) {
      Get.snackbar('Not found', 'No member found for runner-up rego');
    } finally {
      setState(() => lookingUpRunnerUp = false);
    }
  }

  Future<void> _save() async {
    final year = int.tryParse(yearCtrl.text.trim());
    if (year == null) {
      Get.snackbar('Invalid', 'Year must be numeric');
      return;
    }

    final winnerRego = int.tryParse(championRegoCtrl.text.trim());
    final runnerRego = int.tryParse(runnerUpRegoCtrl.text.trim());

    if (winnerRego == null || runnerRego == null) {
      Get.snackbar('Invalid', 'Regos must be numeric');
      return;
    }

    if (winnerRego == runnerRego) {
      Get.snackbar('Invalid', 'Champion and runner-up cannot match');
      return;
    }

    if (championName == null || runnerUpName == null) {
      Get.snackbar('Resolve players', 'Lookup both regos first');
      return;
    }

    final entry = AdminSinglesChampionEntry(
      id: widget.existing?.id,
      year: year,
      division: _division,
      winnerRego: winnerRego,
      runnerRego: runnerRego,
      championName: '',
      runnerUpName: '',
    );

    if (widget.existing == null) {
      await controller.add(entry);
    } else {
      await controller.updateExisting(widget.existing!, entry);
    }

    Get.back();
  }

  Widget _regoAndNameRow({
    required String label,
    required TextEditingController regoCtrl,
    required bool loading,
    required VoidCallback onLookup,
    required String? name,
  }) {
    return Row(
      children: [
        Expanded(
          flex: 2,
          child: TextField(
            controller: regoCtrl,
            keyboardType: TextInputType.number,
            decoration: InputDecoration(
              labelText: label,
              suffixIcon: IconButton(
                icon: loading
                    ? const SizedBox(
                        width: 18,
                        height: 18,
                        child: CircularProgressIndicator(strokeWidth: 2),
                      )
                    : const Icon(Icons.search),
                onPressed: loading ? null : onLookup,
              ),
            ),
          ),
        ),
        const SizedBox(width: 12),
        Expanded(
          flex: 3,
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 14),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.black12),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Text(
              name ?? '—',
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(fontWeight: FontWeight.w700),
            ),
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(widget.existing == null
          ? 'Add Singles Champion'
          : 'Edit Singles Champion'),
      content: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(
              controller: yearCtrl,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(labelText: 'Year'),
            ),
            const SizedBox(height: 8),
            DropdownButtonFormField<int>(
              initialValue: _division,
              decoration: const InputDecoration(labelText: 'Division'),
              items: const [
                DropdownMenuItem(value: 1, child: Text('Division 1')),
                DropdownMenuItem(value: 2, child: Text('Division 2')),
                DropdownMenuItem(value: 3, child: Text('Division 3')),
                DropdownMenuItem(value: 4, child: Text('Division 4')),
              ],
              onChanged: (v) => setState(() => _division = v ?? _division),
            ),
            const SizedBox(height: 12),
            _regoAndNameRow(
              label: 'Champion rego',
              regoCtrl: championRegoCtrl,
              loading: lookingUpChampion,
              onLookup: _lookupChampion,
              name: championName,
            ),
            const SizedBox(height: 12),
            _regoAndNameRow(
              label: 'Runner-up rego',
              regoCtrl: runnerUpRegoCtrl,
              loading: lookingUpRunnerUp,
              onLookup: _lookupRunnerUp,
              name: runnerUpName,
            ),
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
