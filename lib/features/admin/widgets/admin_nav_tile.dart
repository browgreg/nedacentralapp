import 'package:flutter/material.dart';

class AdminNavTile extends StatelessWidget {
  final String label;
  final VoidCallback? onTap;

  const AdminNavTile({
    super.key,
    required this.label,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(bottom: 10),
      child: ListTile(
        title: Text(label),
        trailing: const Icon(Icons.chevron_right),
        onTap: onTap,
      ),
    );
  }
}
