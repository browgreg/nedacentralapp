import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:neda_central/features/admin/dashboard/widgets/admin_tile.dart';
import 'package:neda_central/features/admin/dashboard/widgets/section_header.dart';

import '../../../auth/auth_controller.dart';
import '../../../auth/user_role.dart';
import '../../../routes/app_routes.dart';
import '../widgets/admin_scaffold.dart';

class AdminDashboardScreen extends StatelessWidget {
  const AdminDashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final auth = Get.find<AuthController>();

    bool can(List<UserRole> roles) =>
        auth.role != null && roles.contains(auth.role);

    return AdminScaffold(
      title: 'I.T. / Executive Dashboard',
      child: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          // ─────────────────────────
          // COMMITTEE
          // ─────────────────────────
          if (can([
            UserRole.SUPER_ADMIN,
            UserRole.ADMIN,
            UserRole.COMMITTEE,
          ])) ...[
            const SectionHeader(title: 'Committee'),
            const SizedBox(height: 12),
            Wrap(
              spacing: 16,
              runSpacing: 16,
              children: const [
                AdminTile(
                  title: 'President',
                  icon: Icons.account_balance,
                  route: '/admin/committee/president',
                ),
                AdminTile(
                  title: 'Secretary',
                  icon: Icons.edit_document,
                  route: '/admin/committee/secretary',
                ),
                AdminTile(
                  title: 'Treasurer',
                  icon: Icons.attach_money,
                  route: '/admin/committee/treasurer',
                ),
                AdminTile(
                  title: 'General Committee',
                  icon: Icons.groups,
                  route: '/admin/committee/general',
                ),
                AdminTile(
                  title: 'Committee',
                  icon: Icons.groups,
                  route: AppRoutes.adminCommittee,
                ),
              ],
            ),
            const SizedBox(height: 32),
          ],

          // ─────────────────────────
          // LEAGUE
          // ─────────────────────────
          if (can([
            UserRole.SUPER_ADMIN,
            UserRole.ADMIN,
            UserRole.CAPTAIN,
          ])) ...[
            const SectionHeader(title: 'League'),
            const SizedBox(height: 12),
            Wrap(
              spacing: 16,
              runSpacing: 16,
              children: [
                const AdminTile(
                  title: 'Team Builder',
                  icon: Icons.build,
                  route: '/admin/leagues/teams',
                ),
                AdminTile(
                  title: 'Fixtures',
                  icon: Icons.calendar_month,
                  route: AppRoutes.fixtures,
                ),
                AdminTile(
                  title: 'Results',
                  icon: Icons.scoreboard,
                  route: AppRoutes.results,
                ),
              ],
            ),
            const SizedBox(height: 32),
          ],

          // ─────────────────────────
          // MAIN WEBSITE
          // ─────────────────────────
          if (can([
            UserRole.SUPER_ADMIN,
            UserRole.ADMIN,
          ])) ...[
            const SectionHeader(title: 'Main Website'),
            const SizedBox(height: 12),
            Wrap(
              spacing: 16,
              runSpacing: 16,
              children: [
                AdminTile(
                  title: 'Team Champions',
                  icon: Icons.groups,
                  route: AppRoutes.adminTeamsChampions,
                ),
                AdminTile(
                  title: 'Singles Champions',
                  icon: Icons.person,
                  route: AppRoutes.adminSinglesChampions,
                ),
                AdminTile(
                  title: 'Doubles Champions',
                  icon: Icons.people,
                  route: AppRoutes.adminDoublesChampions,
                ),
                AdminTile(
                  title: 'Presidents',
                  icon: Icons.account_balance,
                  route: AppRoutes.adminPresidents,
                ),
                AdminTile(
                  title: 'Life Members',
                  icon: Icons.star,
                  route: AppRoutes.adminLifeMembers,
                ),
              ],
            ),
          ],
        ],
      ),
    );
  }
}
