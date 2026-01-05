import 'package:flutter/material.dart';

import '../../../core/theme/neda_theme.dart';

class LandingUpcomingEvents extends StatelessWidget {
  const LandingUpcomingEvents({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _EventCard(
            title: 'Whyalla Open',
            subtitle: '18–19 April 2026',
          ),
          const SizedBox(height: 10),
          _EventCard(
            title: 'NEDA League – Round 4',
            subtitle: 'Wednesday Night',
          ),
        ],
      ),
    );
  }
}

class _EventCard extends StatelessWidget {
  final String title;
  final String subtitle;

  const _EventCard({required this.title, required this.subtitle});

  @override
  Widget build(BuildContext context) {
    final n = Theme.of(context).extension<NedaTheme>()!;

    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: n.surfaceCard,
        borderRadius: BorderRadius.circular(16),
        boxShadow: n.shadowSoft,
      ),
      child: Row(
        children: [
          const Icon(Icons.calendar_today_outlined),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title, style: NedaText.body(context)),
                Text(subtitle, style: NedaText.muted(context)),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
