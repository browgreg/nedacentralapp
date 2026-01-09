import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../team_management/captain_team_screen.dart';
import 'controller/captain_dashboard_controller.dart';
import 'widgets/captain_team_tile.dart';

class CaptainDashboardScreen extends StatelessWidget {
  const CaptainDashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(CaptainDashboardController());

    return Scaffold(
      appBar: AppBar(title: const Text('Captain Hub')),
      body: Obx(() {
        if (controller.isLoading.value) {
          return const Center(child: CircularProgressIndicator());
        }

        return ListView(
          padding: const EdgeInsets.all(16),
          children: controller.teams.map((team) {
            return CaptainTeamTile(
              team: team,
              onTap: () {
                Get.to(() => CaptainTeamScreen(team: team));
              },
            );
          }).toList(),
        );
      }),
    );
  }
}
