import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/admin_dashboard_controller.dart';
import '../widgets/admin_action_tile.dart';
import '../widgets/admin_scaffold.dart';
import '../widgets/admin_section_card.dart';

class AdminDashboardScreen extends StatelessWidget {
  const AdminDashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(AdminDashboardController());

    return AdminScaffold(
      title: 'Admin Dashboard',
      child: ListView(
        padding: const EdgeInsets.all(20),
        children: const [
          AdminSectionCard(
            title: 'Club Officials',
            items: [
              AdminActionTile(
                label: 'Presidents',
                route: '/admin/presidents',
              ),
              AdminActionTile(
                label: 'Life Members',
                route: '/admin/life-members',
              ),
              AdminActionTile(
                label: 'In Memoriam',
                route: '/admin/memorial',
              ),
            ],
          ),
          SizedBox(height: 24),
          AdminSectionCard(
            title: 'Championships',
            items: [
              AdminActionTile(
                label: 'Team Champions',
                route: '/admin/team-champions',
              ),
              AdminActionTile(
                label: 'Singles Champions',
                route: '/admin/singles',
              ),
              AdminActionTile(
                label: 'Doubles Champions',
                route: '/admin/doubles',
              ),
            ],
          ),
          SizedBox(height: 24),
          AdminSectionCard(
            title: 'Statistics',
            items: [
              AdminActionTile(
                label: '180s (100+)',
                route: '/admin/180s-100',
              ),
              AdminActionTile(
                label: '180s (50+)',
                route: '/admin/180s-50',
              ),
              AdminActionTile(
                label: '171s',
                route: '/admin/171s',
              ),
              AdminActionTile(
                label: '170 Club',
                route: '/admin/170-club',
              ),
            ],
          ),
        ],
      ),
    );
  }
}
