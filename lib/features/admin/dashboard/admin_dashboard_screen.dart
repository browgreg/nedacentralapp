import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:neda_central/core/theme/neda_theme.dart';

import '../widgets/admin_scaffold.dart';

class AdminDashboardScreen extends StatelessWidget {
  const AdminDashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AdminScaffold(
      title: 'Admin Dashboard',
      child: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // ─────────────────────────
            // COMMITTEE
            // ─────────────────────────
            const _SectionHeader(title: 'Committee'),

            const SizedBox(height: 12),

            GridView.count(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              crossAxisCount: 6,
              mainAxisSpacing: 16,
              crossAxisSpacing: 16,
              children: const [
                _AdminTile(
                  title: 'President',
                  icon: FontAwesomeIcons.one,
                  route: '/admin/presidents',
                ),
                _AdminTile(
                  title: 'Vice President',
                  icon: FontAwesomeIcons.two,
                  route: '/admin/life_members',
                ),
                _AdminTile(
                  title: 'Secretary',
                  icon: FontAwesomeIcons.info,
                  route: '/admin/secretary',
                ),
                _AdminTile(
                  title: 'Treasurer',
                  icon: Icons.attach_money,
                  route: '/admin/treasurer',
                ),
                _AdminTile(
                  title: 'Match Secretary',
                  icon: FontAwesomeIcons.gavel,
                  route: '/admin/presidents',
                ),
                _AdminTile(
                  title: 'General Committee',
                  icon: Icons.group,
                  route: '/admin/life_members',
                ),
              ],
            ),

            const SizedBox(height: 32),

            // ─────────────────────────
            // HONOURS
            // ─────────────────────────
            const _SectionHeader(title: 'Honours'),

            const SizedBox(height: 12),

            GridView.count(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              crossAxisCount: 6,
              mainAxisSpacing: 16,
              crossAxisSpacing: 16,
              children: const [
                _AdminTile(
                  title: 'Team Champions',
                  icon: Icons.groups,
                  route: '/admin/teams_champions',
                ),
                _AdminTile(
                  title: 'Singles Champions',
                  icon: Icons.person,
                  route: '/admin/singles_champions',
                ),
                _AdminTile(
                  title: 'Doubles Champions',
                  icon: Icons.people,
                  route: '/admin/doubles_champions',
                ),
                _AdminTile(
                  title: 'Presidents',
                  icon: FontAwesomeIcons.sitemap,
                  route: '/admin/presidents',
                ),
                _AdminTile(
                  title: 'Life Members',
                  icon: FontAwesomeIcons.userPlus,
                  route: '/admin/life_members',
                ),
                _AdminTile(
                  title: '170 Club',
                  icon: FontAwesomeIcons.bullseye,
                  route: '/admin/presidents',
                ),
                _AdminTile(
                  title: 'In Memoriam',
                  icon: FontAwesomeIcons.handHoldingHeart,
                  route: '/admin/memorial',
                ),
              ],
            ),

            const SizedBox(height: 32),

            // ─────────────────────────
            // COMPETITION
            // ─────────────────────────
            const _SectionHeader(title: 'League'),

            const SizedBox(height: 12),

            GridView.count(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              crossAxisCount: 6,
              mainAxisSpacing: 16,
              crossAxisSpacing: 16,
              children: [
                _AdminTile(
                  title: 'Team\nBuilder',
                  icon: Icons.scoreboard,
                  route: '/admin/results',
                ),
                _AdminTile(
                  title: 'Venue\nBuilder',
                  icon: Icons.scoreboard,
                  route: '/admin/results',
                ),
                _AdminTile(
                  title: 'Edit\nResults',
                  icon: Icons.scoreboard,
                  route: '/admin/results',
                ),
                _AdminTile(
                  title: 'Create\nFixtures',
                  icon: Icons.calendar_month,
                  route: '/fixtures',
                ),
              ],
            ),
            const SizedBox(height: 32),

            // ─────────────────────────
            // COMPETITION
            // ─────────────────────────
            const _SectionHeader(title: 'Competition'),

            const SizedBox(height: 12),

            GridView.count(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              crossAxisCount: 6,
              mainAxisSpacing: 16,
              crossAxisSpacing: 16,
              children: [
                _AdminTile(
                  title: 'Bracket\nBuilder',
                  icon: Icons.list,
                  route: '/fixtures',
                ),
                _AdminTile(
                  title: 'Publish\nResults',
                  icon: FontAwesomeIcons.trophy,
                  route: '/admin/results',
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class _SectionHeader extends StatelessWidget {
  final String title;

  const _SectionHeader({required this.title});

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: Theme.of(context)
          .textTheme
          .headlineSmall
          ?.copyWith(fontWeight: FontWeight.bold, color: nedaWhite),
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
              FaIcon(
                icon,
                size: 42,
              ),
              const SizedBox(height: 12),
              Text(
                title,
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.titleMedium,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
