import 'package:flutter/material.dart';

import '../../../core/theme/neda_theme.dart';

class ResultsScreen extends StatelessWidget {
  const ResultsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final n = Theme.of(context).extension<NedaTheme>()!;

    return Scaffold(
      backgroundColor: n.surfaceSubtle,
      appBar: AppBar(
        title: const Text('Honours & Statistics'),
        backgroundColor: n.surfaceCard,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.fromLTRB(16, 20, 16, 32),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            /// ─────────────────────────
            /// PAGE INTRO
            /// ─────────────────────────
            Text(
              'League Records & Achievements',
              style: NedaText.heading(context),
            ),
            const SizedBox(height: 6),
            Text(
              'Champions, titles, and standout performances across all divisions.',
              style: NedaText.muted(context),
            ),

            const SizedBox(height: 28),

            /// ─────────────────────────
            /// KEY STATS
            /// ─────────────────────────
            _StatsGrid(),

            const SizedBox(height: 36),

            /// ─────────────────────────
            /// HONOURS BOARD
            /// ─────────────────────────
            Text(
              'Honours Board',
              style: NedaText.headingSmall(context),
            ),
            const SizedBox(height: 12),

            _HonoursCard(
              title: 'Premiers',
              subtitle: 'Most titles overall',
              items: const [
                _HonourItem('Gaza Eagles', '8 titles'),
                _HonourItem('Flight Club', '6 titles'),
                _HonourItem('Paradise Hawks', '5 titles'),
              ],
            ),

            const SizedBox(height: 16),

            _HonoursCard(
              title: 'Recent Champions',
              subtitle: 'Last 3 seasons',
              items: const [
                _HonourItem('2024', 'Flight Club'),
                _HonourItem('2023', 'Gaza Eagles'),
                _HonourItem('2022', 'Misfits'),
              ],
            ),

            const SizedBox(height: 36),

            /// ─────────────────────────
            /// FUTURE PLACEHOLDER
            /// ─────────────────────────
            Center(
              child: Text(
                'More statistics and results coming soon',
                style: NedaText.muted(context),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

/// ─────────────────────────
/// STATS GRID
/// ─────────────────────────
class _StatsGrid extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final columns = width >= 1000
        ? 4
        : width >= 600
            ? 3
            : 2;

    return GridView.count(
      crossAxisCount: columns,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      mainAxisSpacing: 12,
      crossAxisSpacing: 12,
      childAspectRatio: 1.6,
      children: const [
        _StatTile(label: 'Seasons', value: '42'),
        _StatTile(label: 'Clubs', value: '18'),
        _StatTile(label: 'Matches Played', value: '12,480'),
        _StatTile(label: 'Titles Awarded', value: '64'),
      ],
    );
  }
}

/// ─────────────────────────
/// STAT TILE
/// ─────────────────────────
class _StatTile extends StatelessWidget {
  final String label;
  final String value;

  const _StatTile({
    required this.label,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    final n = Theme.of(context).extension<NedaTheme>()!;

    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: n.surfaceCard,
        borderRadius: BorderRadius.circular(16),
        boxShadow: n.shadowSoft,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(value, style: NedaText.heading(context)),
          const SizedBox(height: 6),
          Text(label, style: NedaText.muted(context)),
        ],
      ),
    );
  }
}

/// ─────────────────────────
/// HONOURS CARD
/// ─────────────────────────
class _HonoursCard extends StatelessWidget {
  final String title;
  final String subtitle;
  final List<_HonourItem> items;

  const _HonoursCard({
    required this.title,
    required this.subtitle,
    required this.items,
  });

  @override
  Widget build(BuildContext context) {
    final n = Theme.of(context).extension<NedaTheme>()!;

    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: n.surfaceCard,
        borderRadius: BorderRadius.circular(18),
        boxShadow: n.shadowSoft,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title, style: NedaText.headingSmall(context)),
          const SizedBox(height: 4),
          Text(subtitle, style: NedaText.muted(context)),
          const SizedBox(height: 14),
          ...items.map(
            (i) => Padding(
              padding: const EdgeInsets.symmetric(vertical: 6),
              child: Row(
                children: [
                  Expanded(
                    child: Text(
                      i.left,
                      style: NedaText.body(context)
                          .copyWith(fontWeight: FontWeight.w600),
                    ),
                  ),
                  Text(
                    i.right,
                    style: NedaText.muted(context),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

/// ─────────────────────────
/// HONOUR ITEM MODEL
/// ─────────────────────────
class _HonourItem {
  final String left;
  final String right;

  const _HonourItem(this.left, this.right);
}
