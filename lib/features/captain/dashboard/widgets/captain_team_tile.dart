import 'package:flutter/material.dart';

import '../../model/captain_team.dart';

class CaptainTeamTile extends StatelessWidget {
  final CaptainTeam team;
  final VoidCallback onTap;

  const CaptainTeamTile({
    super.key,
    required this.team,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        title: Text(team.name),
        subtitle: Text(team.venue),
        trailing: const Icon(Icons.chevron_right),
        onTap: onTap,
      ),
    );
  }
}
