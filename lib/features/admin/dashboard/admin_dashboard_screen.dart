import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../widgets/admin_scaffold.dart';

class AdminDashboardScreen extends StatelessWidget {
  const AdminDashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AdminScaffold(
      title: 'Admin Dashboard',
      child: GridView.count(
        padding: const EdgeInsets.all(16),
        crossAxisCount: 2,
        mainAxisSpacing: 16,
        crossAxisSpacing: 16,
        children: [
          _AdminTile(
            title: 'Presidents',
            icon: Icons.account_balance,
            route: '/admin/presidents',
          ),
          _AdminTile(
            title: 'Life Members',
            icon: Icons.star,
            route: '/admin/life-members',
          ),
          _AdminTile(
            title: 'Team Champions',
            icon: Icons.groups,
            route: '/admin/team-champions',
          ),
          _AdminTile(
            title: 'Singles Champions',
            icon: Icons.person,
            route: '/admin/singles-champions',
          ),
          _AdminTile(
            title: 'Results',
            icon: Icons.scoreboard,
            route: '/admin/results',
          ),
        ],
      ),
    );
  }
}

class _AdminTile extends StatelessWidget {
  final String title;
  final IconData icon;
  final String route;

  const _AdminTile({
    required this.title,
    required this.icon,
    required this.route,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Get.toNamed(route),
      borderRadius: BorderRadius.circular(16),
      child: Card(
        elevation: 6,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(icon, size: 48),
              const SizedBox(height: 12),
              Text(
                title,
                style: Theme.of(context).textTheme.titleMedium,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
