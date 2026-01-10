import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../model/captain_player.dart';
import '../model/captain_team.dart';
import 'controller/captain_team_controller.dart';

class CaptainTeamScreen extends StatelessWidget {
  final CaptainTeam team;

  const CaptainTeamScreen({super.key, required this.team});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(CaptainTeamController())..init(team);

    return Scaffold(
      appBar: AppBar(
        title: Text(team.name),
      ),
      body: Obx(() {
        if (controller.isLoading.value) {
          return const Center(child: CircularProgressIndicator());
        }

        return ListView(
          padding: const EdgeInsets.all(16),
          children: [
            if (controller.isLocked.value)
              Container(
                padding: const EdgeInsets.all(12),
                margin: const EdgeInsets.only(bottom: 12),
                decoration: BoxDecoration(
                  color: Colors.red.withAlpha(38),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: const Text(
                  '🔒 Team selection is locked by admin',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
            Text(
              'Selected: ${controller.selected.length}/8'
              '${controller.reserveRego.value != null ? ' • Reserve chosen' : ''}',
              style: Theme.of(context).textTheme.titleMedium,
            ),
            const SizedBox(height: 12),
            ...team.squad.map((p) {
              return _PlayerTile(
                player: p,
                selected: controller.selected.contains(p.rego),
                isReserve: controller.reserveRego.value == p.rego,
                onTap: () => controller.togglePlayer(p),
                onLongPress: () => controller.setReserve(p),
                enabled: !controller.isLocked.value,
              );
            }),
            const SizedBox(height: 12),
            ElevatedButton(
              onPressed: controller.canSave
                  ? () async {
                      await controller.save();
                      Get.snackbar('Saved', 'Team selection saved');
                    }
                  : null,
              child: controller.isSaving.value
                  ? const SizedBox(
                      width: 18,
                      height: 18,
                      child: CircularProgressIndicator(strokeWidth: 2),
                    )
                  : const Text('Save Team'),
            ),
          ],
        );
      }),
    );
  }
}

class _PlayerTile extends StatelessWidget {
  final CaptainPlayer player;
  final bool selected;
  final bool isReserve;
  final bool enabled;
  final VoidCallback onTap;
  final VoidCallback onLongPress;

  const _PlayerTile({
    required this.player,
    required this.selected,
    required this.isReserve,
    required this.enabled,
    required this.onTap,
    required this.onLongPress,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        enabled: enabled,
        // ✅ FIX
        title: Text(player.name),
        subtitle: Text('Rego ${player.rego}'),
        trailing: isReserve
            ? const Icon(Icons.star, color: Colors.orange)
            : selected
                ? const Icon(Icons.check_circle, color: Colors.green)
                : null,
        onTap: enabled ? onTap : null,
        onLongPress: enabled ? onLongPress : null,
      ),
    );
  }
}
