import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';

import '../../../../../services/api/admin_team_api.dart';
import '../../../../captain/model/captain_team.dart';
import '../../../widgets/admin_scaffold.dart';

class AdminTeamScreen extends StatelessWidget {
  final CaptainTeam team;

  const AdminTeamScreen({super.key, required this.team});

  @override
  Widget build(BuildContext context) {
    return AdminScaffold(
      title: 'Manage Team – ${team.name}',
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Venue: ${team.venue}'),
          const SizedBox(height: 24),

          // 🔒 STEP 6 — LOCK BUTTON
          ElevatedButton(
            onPressed: () async {
              await AdminTeamApi.lock(team.id);
              Get.snackbar('Locked', 'Team has been locked');
            },
            child: const Text('Lock Team'),
          ),
        ],
      ),
    );
  }
}
