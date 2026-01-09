import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:neda_central/features/player/scoring/view/scoring_entry_form.dart';

import '../controller/scoring_controller.dart';

class ScoringScreen extends StatelessWidget {
  const ScoringScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(ScoringController());

    return Scaffold(
      appBar: AppBar(title: const Text('Enter Score')),
      body: const Padding(
        padding: EdgeInsets.all(16),
        child: ScoringEntryForm(),
      ),
    );
  }
}
