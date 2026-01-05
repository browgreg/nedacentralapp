import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../../core/theme/neda_theme.dart';
import '../../../core/widgets/empty_state_card.dart';
import '../../../services/api/fixtures_api.dart';
import '../../landing/model/fixture_model.dart';
import '../../landing/widgets/fixture_detail_sheet.dart';

class FullFixturesScreen extends StatelessWidget {
  const FullFixturesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final n = Theme.of(context).extension<NedaTheme>()!;

    return Scaffold(
      backgroundColor: n.surfaceSubtle,
      appBar: AppBar(
        title: const Text('Upcoming Fixtures'),
        backgroundColor: n.surfaceCard,
        elevation: 0,
      ),
      body: FutureBuilder<Map<int, List<Fixture>>>(
        future: FixturesApi.fetchUpcomingByDivision(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }

          if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Padding(
              padding: EdgeInsets.all(16),
              child: EmptyStateCard(
                icon: Icons.calendar_today_outlined,
                title: 'No upcoming fixtures',
                message: 'Fixtures will appear here when available.',
              ),
            );
          }

          final divisions = snapshot.data!;

          return ListView(
            padding: const EdgeInsets.fromLTRB(16, 16, 16, 32),
            children: divisions.entries.map((entry) {
              return _DivisionSection(
                division: entry.key,
                fixtures: entry.value,
              );
            }).toList(),
          );
        },
      ),
    );
  }
}

/// ─────────────────────────
/// DIVISION SECTION
/// ─────────────────────────
class _DivisionSection extends StatelessWidget {
  final int division;
  final List<Fixture> fixtures;

  const _DivisionSection({
    required this.division,
    required this.fixtures,
  });

  @override
  Widget build(BuildContext context) {
    final n = Theme.of(context).extension<NedaTheme>()!;

    return Padding(
      padding: const EdgeInsets.only(bottom: 28),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          /// DIVISION HEADER
          Row(
            children: [
              Text(
                'Division $division',
                style: NedaText.headingSmall(context),
              ),
              const Spacer(),
              Text(
                '${fixtures.length} matches',
                style: NedaText.muted(context),
              ),
            ],
          ),

          const SizedBox(height: 12),

          /// FIXTURES LIST
          Container(
            decoration: BoxDecoration(
              color: n.surfaceCard,
              borderRadius: BorderRadius.circular(18),
              boxShadow: n.shadowSoft,
            ),
            child: Column(
              children: fixtures.map((f) {
                final isLast = f == fixtures.last;

                return Column(
                  children: [
                    _FixtureRow(fixture: f),
                    if (!isLast)
                      Divider(
                        height: 1,
                        color: n.borderPrimary.withAlpha(70),
                      ),
                  ],
                );
              }).toList(),
            ),
          ),
        ],
      ),
    );
  }
}

/// ─────────────────────────
/// FIXTURE ROW (same feel as sheet)
/// ─────────────────────────
class _FixtureRow extends StatelessWidget {
  final Fixture fixture;

  const _FixtureRow({
    required this.fixture,
  });

  @override
  Widget build(BuildContext context) {
    final n = Theme.of(context).extension<NedaTheme>()!;

    return InkWell(
      borderRadius: BorderRadius.circular(18),
      onTap: () => showFixtureDetailSheet(context, fixture),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            /// DATE
            Column(
              children: [
                Text(
                  DateFormat('EEE').format(fixture.date).toUpperCase(),
                  style: NedaText.muted(context),
                ),
                const SizedBox(height: 2),
                Text(
                  DateFormat('d MMM').format(fixture.date),
                  style: NedaText.body(context)
                      .copyWith(fontWeight: FontWeight.w700),
                ),
              ],
            ),

            const SizedBox(width: 16),

            /// MATCH INFO
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '${fixture.homeTeam} vs ${fixture.awayTeam}',
                    style: NedaText.body(context)
                        .copyWith(fontWeight: FontWeight.w700),
                  ),
                  const SizedBox(height: 6),
                  Row(
                    children: [
                      Icon(
                        Icons.place_outlined,
                        size: 16,
                        color: n.textMuted,
                      ),
                      const SizedBox(width: 6),
                      Expanded(
                        child: Text(
                          fixture.venueName,
                          style: NedaText.muted(context),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),

            const SizedBox(width: 8),

            Icon(
              Icons.chevron_right,
              color: n.textMuted,
            ),
          ],
        ),
      ),
    );
  }
}
