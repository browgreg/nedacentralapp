import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controller/captain_results_controller.dart';

class CaptainResultsScreen extends StatelessWidget {
  final int fixtureId;

  const CaptainResultsScreen({
    super.key,
    required this.fixtureId,
  });

  @override
  Widget build(BuildContext context) {
    final c = Get.put(CaptainResultsController())..load(fixtureId);

    return Scaffold(
      appBar: AppBar(title: const Text('Enter Results')),
      body: Obx(() {
        if (c.isLoading.value) {
          return const Center(child: CircularProgressIndicator());
        }

        return Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              TextField(
                keyboardType: TextInputType.number,
                enabled: !c.isLocked.value,
                decoration: const InputDecoration(labelText: 'Home Score'),
                controller: TextEditingController(
                  text: c.home.value?.toString() ?? '',
                ),
                onChanged: (v) => c.home.value = int.tryParse(v),
              ),
              const SizedBox(height: 12),
              TextField(
                keyboardType: TextInputType.number,
                enabled: !c.isLocked.value,
                decoration: const InputDecoration(labelText: 'Away Score'),
                controller: TextEditingController(
                  text: c.away.value?.toString() ?? '',
                ),
                onChanged: (v) => c.away.value = int.tryParse(v),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: c.isLocked.value ? null : c.save,
                child: c.isSaving.value
                    ? const SizedBox(
                        width: 18,
                        height: 18,
                        child: CircularProgressIndicator(strokeWidth: 2),
                      )
                    : const Text('Save'),
              ),
              if (c.isLocked.value) ...[
                const SizedBox(height: 12),
                const Text(
                  'Results are locked',
                  style: TextStyle(color: Colors.redAccent),
                ),
              ]
            ],
          ),
        );
      }),
    );
  }
}
