import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../../core/theme/neda_theme.dart';
import '../../../core/widgets/empty_state_card.dart';
import '../../../services/api/fixtures_api.dart';
import '../model/fixture_model.dart';
import 'fixture_detail_sheet.dart';
import 'skeletons/landing_skeleton.dart';

class LandingUpcomingFixtures extends StatelessWidget {
  const LandingUpcomingFixtures({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<Map<int, List<Fixture>>>(
      future: FixturesApi.fetchUpcomingByDivision(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const LandingSkeleton();
        }

        if (!snapshot.hasData || snapshot.data!.isEmpty) {
          return const Padding(
            padding: EdgeInsets.all(16),
            child: EmptyStateCard(
              icon: Icons.calendar_today_outlined,
              title: 'No upcoming fixtures',
              message: 'Upcoming matches will appear here.',
            ),
          );
        }

        final divisions = snapshot.data!;

        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            children: divisions.entries.map((entry) {
              return _DivisionFixturesCard(
                division: entry.key,
                fixtures: entry.value,
              );
            }).toList(),
          ),
        );
      },
    );
  }
}

class _DivisionFixturesCard extends StatelessWidget {
  final int division;
  final List<Fixture> fixtures;

  const _DivisionFixturesCard({
    required this.division,
    required this.fixtures,
  });

  static const double _stripHeight = 140; // 👈 KEY FIX

  @override
  Widget build(BuildContext context) {
    final n = Theme.of(context).extension<NedaTheme>()!;

    return Container(
      margin: const EdgeInsets.only(bottom: 20),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: n.surfaceCard,
        borderRadius: BorderRadius.circular(18),
        boxShadow: n.shadowSoft,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min, // 👈 important
        children: [
          /// HEADER
          Row(
            children: [
              Expanded(
                child: Text(
                  'Division $division',
                  style: NedaText.headingSmall(context),
                ),
              ),
              Text(
                '${fixtures.length} matches',
                style: NedaText.muted(context),
              ),
            ],
          ),

          const SizedBox(height: 12),

          /// HORIZONTAL FIXTURES STRIP
          SizedBox(
            height: _stripHeight, // 👈 THIS removes overflow
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.only(right: 4),
              itemCount: fixtures.length,
              separatorBuilder: (_, __) => const SizedBox(width: 12),
              itemBuilder: (_, i) {
                return SizedBox(
                  width: 250, // card width
                  child: _FixtureTile(fixture: fixtures[i]),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class _FixtureTile extends StatelessWidget {
  final Fixture fixture;

  const _FixtureTile({required this.fixture});

  @override
  Widget build(BuildContext context) {
    final n = Theme.of(context).extension<NedaTheme>()!;

    return SizedBox(
      width: 280,
      child: Material(
        color: Colors.transparent,
        borderRadius: BorderRadius.circular(16),
        child: InkWell(
          borderRadius: BorderRadius.circular(16),
          onTap: () => showFixtureDetailSheet(context, fixture),
          child: Container(
            padding: const EdgeInsets.all(14),
            decoration: BoxDecoration(
              color: n.surfaceSubtle,
              borderRadius: BorderRadius.circular(16),
              border: Border.all(color: n.borderPrimary.withAlpha(90)),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min, // ✅ KEY FIX
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                /// HOME
                Text(
                  fixture.homeTeam,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: NedaText.body(context).copyWith(
                    fontWeight: FontWeight.w700,
                  ),
                ),

                /// AWAY
                Text(
                  'vs ${fixture.awayTeam}',
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: NedaText.muted(context),
                ),

                const SizedBox(height: 8),

                /// DATE
                Text(
                  DateFormat('EEE d MMM').format(fixture.date),
                  style: NedaText.muted(context),
                ),

                const SizedBox(height: 6),

                /// VENUE
                Row(
                  children: [
                    Icon(
                      Icons.place_outlined,
                      size: 14,
                      color: n.textMuted,
                    ),
                    const SizedBox(width: 4),
                    Expanded(
                      child: Text(
                        fixture.venueName,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: NedaText.muted(context),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
