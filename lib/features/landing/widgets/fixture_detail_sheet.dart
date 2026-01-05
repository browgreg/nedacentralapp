// lib/features/landing/widgets/fixture_detail_sheet.dart

import 'package:flutter/material.dart';

import '../../../core/theme/neda_theme.dart';
import '../../../core/utils/map_launcher.dart';
import '../../../core/utils/url_launcher_util.dart';
import '../model/fixture_model.dart';

void showFixtureDetailSheet(
  BuildContext context,
  Fixture fixture,
) {
  final n = Theme.of(context).extension<NedaTheme>()!;

  showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    backgroundColor: Colors.transparent,
    builder: (_) {
      return DraggableScrollableSheet(
        initialChildSize: 0.45,
        minChildSize: 0.3,
        maxChildSize: 0.85,
        builder: (context, scrollController) {
          return Container(
            decoration: BoxDecoration(
              color: n.surfaceCard,
              borderRadius: const BorderRadius.vertical(
                top: Radius.circular(24),
              ),
            ),
            child: SingleChildScrollView(
              controller: scrollController,
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  /// Drag handle
                  Center(
                    child: Container(
                      width: 48,
                      height: 5,
                      margin: const EdgeInsets.only(bottom: 16),
                      decoration: BoxDecoration(
                        color: n.borderPrimary,
                        borderRadius: BorderRadius.circular(3),
                      ),
                    ),
                  ),

                  /// Division / Round
                  Text(
                    'Division ${fixture.division} • Round ${fixture.round}',
                    style: NedaText.muted(context),
                  ),

                  const SizedBox(height: 12),

                  /// Teams
                  Text(fixture.homeTeam, style: NedaText.heading(context)),
                  const SizedBox(height: 4),
                  Text('vs', style: NedaText.muted(context)),
                  const SizedBox(height: 4),
                  Text(fixture.awayTeam, style: NedaText.heading(context)),

                  const SizedBox(height: 20),

                  /// VENUE CARD
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: n.surfaceSubtle,
                      borderRadius: BorderRadius.circular(16),
                      border: Border.all(
                        color: n.borderPrimary.withAlpha(80),
                      ),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        /// Venue name
                        Row(
                          children: [
                            const Icon(Icons.location_on_outlined, size: 20),
                            const SizedBox(width: 8),
                            Expanded(
                              child: Text(
                                fixture.venueName,
                                style: NedaText.body(context)
                                    .copyWith(fontWeight: FontWeight.w600),
                              ),
                            ),
                          ],
                        ),

                        const SizedBox(height: 8),

                        /// Address
                        Text(
                          fixture.venueAddress,
                          style: NedaText.muted(context),
                        ),

                        /// Venue notes (optional)
                        if (fixture.venueNotes != null) ...[
                          const SizedBox(height: 10),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Icon(
                                Icons.info_outline,
                                size: 18,
                                color: n.textMuted,
                              ),
                              const SizedBox(width: 8),
                              Expanded(
                                child: Text(
                                  fixture.venueNotes!,
                                  style: NedaText.body(context),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ],
                    ),
                  ),

                  const SizedBox(height: 24),

                  /// CTA BUTTONS
                  Row(
                    children: [
                      Expanded(
                        child: OutlinedButton.icon(
                          icon: const Icon(Icons.phone_outlined),
                          label: const Text('Call venue'),
                          style: OutlinedButton.styleFrom(
                            padding: const EdgeInsets.symmetric(vertical: 14),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(14),
                            ),
                          ),
                          onPressed: () {
                            openExternalUrl(
                                context, 'tel:${fixture.venuePhone}');
                          },
                        ),
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: ElevatedButton.icon(
                          icon: const Icon(Icons.directions_outlined),
                          label: const Text('Directions'),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: n.accentPrimary,
                            foregroundColor: Colors.black,
                            padding: const EdgeInsets.symmetric(vertical: 14),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(14),
                            ),
                          ),
                          onPressed: () {
                            MapLauncher.open(fixture.venueAddress);
                          },
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          );
        },
      );
    },
  );
}
