import 'package:flutter/material.dart';

import '../model/committee_role.dart';

class CommitteeRoleTile extends StatelessWidget {
  final CommitteeRole role;
  final String? member;
  final VoidCallback onTap;

  const CommitteeRoleTile({
    super.key,
    required this.role,
    required this.member,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        title: Text(role.label),
        subtitle: Text(member ?? 'Unassigned'),
        trailing: const Icon(Icons.edit),
        onTap: onTap,
      ),
    );
  }
}
