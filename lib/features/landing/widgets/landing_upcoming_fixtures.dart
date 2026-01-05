import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:neda_central/features/landing/widgets/skeletons/landing_skeleton.dart';

import '../../../core/theme/neda_theme.dart';
import '../../../core/widgets/empty_state_card.dart';
import '../../../services/api/fixtures_api.dart';
import '../model/fixture_model.dart';
import 'fixture_detail_sheet.dart';

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

  @override
  Widget build(BuildContext context) {
    final n = Theme.of(context).extension<NedaTheme>()!;

    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: n.surfaceCard,
        borderRadius: BorderRadius.circular(18),
        boxShadow: n.shadowSoft,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          /// DIVISION HEADER
          Row(
            children: [
              Expanded(
                child: Text(
                  'Division $division',
                  style: NedaText.headingSmall(context),
                ),
              ),
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                decoration: BoxDecoration(
                  color: n.surfaceSubtle,
                  borderRadius: BorderRadius.circular(999),
                  border: Border.all(color: n.borderPrimary.withAlpha(90)),
                ),
                child: Text(
                  '${fixtures.length} matches',
                  style: NedaText.muted(context),
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),

          /// FIXTURES
          ...List.generate(fixtures.length, (i) {
            final f = fixtures[i];
            return Padding(
              padding:
                  EdgeInsets.only(bottom: i == fixtures.length - 1 ? 0 : 10),
              child: _FixtureCard(fixture: f),
            );
          }),
        ],
      ),
    );
  }
}

class _FixtureCard extends StatelessWidget {
  final Fixture fixture;

  const _FixtureCard({
    required this.fixture,
  });

  @override
  Widget build(BuildContext context) {
    final n = Theme.of(context).extension<NedaTheme>()!;

    return Material(
      color: Colors.transparent,
      borderRadius: BorderRadius.circular(16),
      child: InkWell(
        borderRadius: BorderRadius.circular(16),
        onTap: () => showFixtureDetailSheet(context, fixture),
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
          decoration: BoxDecoration(
            color: n.surfaceSubtle,
            borderRadius: BorderRadius.circular(16),
            border: Border.all(color: n.borderPrimary.withAlpha(90)),
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              /// LEFT ACCENT
              Container(
                width: 4,
                height: 52,
                decoration: BoxDecoration(
                  color: n.accentPrimary,
                  borderRadius: BorderRadius.circular(2),
                  boxShadow: [
                    BoxShadow(
                      color: n.accentPrimary.withAlpha(90),
                      blurRadius: 10,
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 12),

              /// MAIN
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: Text(
                            '${fixture.homeTeam} vs ${fixture.awayTeam}',
                            style: NedaText.body(context).copyWith(
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ),
                        const SizedBox(width: 10),
                        _DatePill(date: fixture.date),
                      ],
                    ),
                    const SizedBox(height: 8),
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

              const SizedBox(width: 8),
              Icon(
                Icons.chevron_right,
                color: n.textMuted,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _DatePill extends StatelessWidget {
  final DateTime date;

  const _DatePill({required this.date});

  @override
  Widget build(BuildContext context) {
    final n = Theme.of(context).extension<NedaTheme>()!;

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
      decoration: BoxDecoration(
        color: n.surfaceCard,
        borderRadius: BorderRadius.circular(999),
        border: Border.all(color: n.borderPrimary.withAlpha(90)),
      ),
      child: Text(
        DateFormat('EEE d MMM').format(date),
        style: NedaText.muted(context).copyWith(
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}
