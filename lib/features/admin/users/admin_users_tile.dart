import 'package:flutter/material.dart';

import 'admin_users_entry.dart';

class AdminUserTile extends StatelessWidget {
  final AdminUserEntry user;
  final ValueChanged<UserRole> onRoleChanged;
  final VoidCallback onToggle;

  const AdminUserTile({
    super.key,
    required this.user,
    required this.onRoleChanged,
    required this.onToggle,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        title: Text('${user.displayName ?? 'Unknown'}  (Rego ${user.rego})'),
        subtitle: DropdownButton<UserRole>(
          value: user.role,
          items: UserRole.values
              .map(
                (r) => DropdownMenuItem(
                  value: r,
                  child: Text(r.name.toUpperCase()),
                ),
              )
              .toList(),
          onChanged: (r) {
            if (r != null) onRoleChanged(r);
          },
        ),
        trailing: Switch(
          value: user.isActive,
          onChanged: (_) => onToggle(),
        ),
      ),
    );
  }
}
