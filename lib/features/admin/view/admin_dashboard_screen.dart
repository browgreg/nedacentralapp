import 'package:flutter/material.dart';

import '../../../core/theme/neda_theme.dart';
import '../widgets/admin_nav_tile.dart';

class AdminDashboardScreen extends StatelessWidget {
  const AdminDashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final n = Theme.of(context).extension<NedaTheme>()!;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Admin Dashboard'),
        backgroundColor: n.surfaceCard,
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: const [
          _Section(title: 'Governance'),
          AdminNavTile(label: 'Presidents'),
          AdminNavTile(label: 'Life Members'),
          AdminNavTile(label: 'In Memoriam'),
          SizedBox(height: 24),
          _Section(title: 'Championships'),
          AdminNavTile(label: 'Team Champions'),
          AdminNavTile(label: 'Singles Champions'),
          AdminNavTile(label: 'Doubles Champions'),
          SizedBox(height: 24),
          _Section(title: 'Performance Stats'),
          AdminNavTile(label: '180s (50–99)'),
          AdminNavTile(label: '180s (100+)'),
          AdminNavTile(label: '171s'),
          AdminNavTile(label: '170 Club'),
        ],
      ),
    );
  }
}

class _Section extends StatelessWidget {
  final String title;

  const _Section({required this.title});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Text(
        title,
        style: Theme.of(context).textTheme.titleMedium,
      ),
    );
  }
}
