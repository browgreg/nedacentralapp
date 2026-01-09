import 'package:flutter/material.dart';

import '../../../../auth/user_role.dart';
import '../model/admin_users_entry.dart';

class AdminUserTile extends StatelessWidget {
  final AdminUserEntry user;
  final ValueChanged<UserRole> onRoleChanged;
  final ValueChanged<bool> onActiveChanged;

  const AdminUserTile({
    super.key,
    required this.user,
    required this.onRoleChanged,
    required this.onActiveChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        title: Text('${user.displayName ?? 'User'} (${user.rego})'),
        subtitle: DropdownButton<UserRole>(
          value: user.role,
          onChanged: (r) => r != null ? onRoleChanged(r) : null,
          items: UserRole.values
              .map(
                (r) => DropdownMenuItem(
                  value: r,
                  child: Text(r.name),
                ),
              )
              .toList(),
        ),
        trailing: Switch(
          value: user.isActive,
          onChanged: onActiveChanged,
        ),
      ),
    );
  }
}
