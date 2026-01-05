import 'package:flutter/material.dart';
import 'package:neda_central/features/results/view/full_results_screen.dart';

import '../../../core/theme/neda_theme.dart';
import '../../fixtures/view/fixtures_screen.dart';
import '../../honours/view/honours_statistics_screen.dart';

class LandingQuickActions extends StatelessWidget {
  const LandingQuickActions({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Row(
        children: [
          _ActionCard(
            icon: Icons.event_outlined,
            label: 'Fixtures',
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => const FullFixturesScreen(),
                ),
              );
            },
          ),
          _ActionCard(
            icon: Icons.tv,
            label: 'Results',
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => const ResultsScreen(),
                ),
              );
            },
          ),
          _ActionCard(
            icon: Icons.emoji_events_outlined,
            label: 'Honours',
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => const HonourBoardScreen()),
              );
            },
          ),
        ],
      ),
    );
  }
}

class _ActionCard extends StatelessWidget {
  final IconData icon;
  final String label;
  final VoidCallback onTap;

  const _ActionCard({
    required this.icon,
    required this.label,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final n = Theme.of(context).extension<NedaTheme>()!;

    return Expanded(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 6),
        child: InkWell(
          borderRadius: BorderRadius.circular(14),
          onTap: onTap,
          child: Container(
            padding: const EdgeInsets.symmetric(vertical: 14),
            decoration: BoxDecoration(
              color: n.surfaceCard,
              borderRadius: BorderRadius.circular(14),
              boxShadow: n.shadowSoft,
            ),
            child: Column(
              children: [
                Icon(icon, color: n.accentPrimary),
                const SizedBox(height: 6),
                Text(label, style: NedaText.body(context)),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
