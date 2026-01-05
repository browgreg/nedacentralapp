import 'package:flutter/material.dart';

import '../../../core/theme/neda_theme.dart';

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
            onTap: () {},
          ),
          _ActionCard(
            icon: Icons.emoji_events_outlined,
            label: 'Register',
            onTap: () {},
          ),
          _ActionCard(
            icon: Icons.place_outlined,
            label: 'Venues',
            onTap: () {},
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
