import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'controller/player_dashboard_controller.dart';
import 'widgets/player_tile.dart';

class PlayerDashboardScreen extends StatelessWidget {
  const PlayerDashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(PlayerDashboardController());

    return Scaffold(
      appBar: AppBar(title: const Text('Players')),
      body: Obx(() {
        if (controller.isLoading.value) {
          return const Center(child: CircularProgressIndicator());
        }

        return ListView.builder(
          padding: const EdgeInsets.all(16),
          itemCount: controller.players.length,
          itemBuilder: (_, i) {
            final p = controller.players[i];

            return PlayerTile(
              name: p.name,
              rego: p.rego,
              isCaptain: p.isCaptain,
              isInactive: !p.isActive,
            );
          },
        );
      }),
    );
  }
}
