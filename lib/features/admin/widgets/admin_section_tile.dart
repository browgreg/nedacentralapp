import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AdminSectionTile extends StatelessWidget {
  final String label;
  final String route;

  const AdminSectionTile({
    super.key,
    required this.label,
    required this.route,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        label,
        style: const TextStyle(color: Colors.white),
      ),
      trailing: const Icon(Icons.chevron_right, color: Colors.white54),
      onTap: () => Get.toNamed(route),
    );
  }
}
