import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controller/scoring_controller.dart';
import '../model/scoring_game_type.dart';
import '../widgets/darts_score_pad.dart';

class ScoringEntryForm extends StatefulWidget {
  const ScoringEntryForm({super.key});

  @override
  State<ScoringEntryForm> createState() => _ScoringEntryFormState();
}

class _ScoringEntryFormState extends State<ScoringEntryForm> {
  final controller = Get.find<ScoringController>();

  ScoringGameType gameType = ScoringGameType.practice501;
  int legsWon = 0;
  int legsLost = 0;
  int? checkout;
  int oneEighties = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        DropdownButtonFormField<ScoringGameType>(
          value: gameType,
          decoration: const InputDecoration(labelText: 'Game Type'),
          items: ScoringGameType.values
              .map(
                (t) => DropdownMenuItem(
                  value: t,
                  child: Text(t.name.toUpperCase()),
                ),
              )
              .toList(),
          onChanged: (v) => setState(() => gameType = v!),
        ),
        const SizedBox(height: 16),
        Row(
          children: [
            _counter('Legs Won', legsWon, (v) => setState(() => legsWon = v)),
            const SizedBox(width: 16),
            _counter(
                'Legs Lost', legsLost, (v) => setState(() => legsLost = v)),
          ],
        ),
        const SizedBox(height: 16),
        DartScorePad(
          label: 'Highest Checkout',
          onScoreSelected: (v) => setState(() => checkout = v),
        ),
        const SizedBox(height: 16),
        _counter(
          '180s',
          oneEighties,
          (v) => setState(() => oneEighties = v),
        ),
        const Spacer(),
        SizedBox(
          width: double.infinity,
          child: ElevatedButton(
            onPressed: () {
              controller.submitScore(
                type: gameType,
                legsWon: legsWon,
                legsLost: legsLost,
                checkout: checkout,
                oneEighties: oneEighties,
              );
              Get.back();
            },
            child: const Text('Submit Score'),
          ),
        ),
      ],
    );
  }

  Widget _counter(String label, int value, ValueChanged<int> onChanged) {
    return Expanded(
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Column(
            children: [
              Text(label, style: const TextStyle(fontWeight: FontWeight.bold)),
              const SizedBox(height: 8),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IconButton(
                    onPressed: value > 0 ? () => onChanged(value - 1) : null,
                    icon: const Icon(Icons.remove),
                  ),
                  Text('$value', style: const TextStyle(fontSize: 18)),
                  IconButton(
                    onPressed: () => onChanged(value + 1),
                    icon: const Icon(Icons.add),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
