import 'package:flutter/material.dart';

import '../../../core/theme/neda_theme.dart';
import '../model/poster.dart';

class PosterMetadataRow extends StatelessWidget {
  final Poster poster;

  const PosterMetadataRow({super.key, required this.poster});

  @override
  Widget build(BuildContext context) {
    final n = Theme.of(context).extension<NedaTheme>()!;
    final isTournament = poster.source == PosterSource.tournament;

    return Wrap(
      spacing: 12,
      runSpacing: 8,
      crossAxisAlignment: WrapCrossAlignment.center,
      children: [
        // Badge
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
          decoration: BoxDecoration(
            color:
                isTournament ? n.accentPrimary.withAlpha(40) : n.surfaceSubtle,
            borderRadius: BorderRadius.circular(20),
            border: Border.all(color: n.borderPrimary),
          ),
          child: Text(
            isTournament ? 'Tournament' : 'Club',
            style: NedaText.caption(context).copyWith(
              fontWeight: FontWeight.w700,
            ),
          ),
        ),

        // Date
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Icon(Icons.event, size: 16),
            const SizedBox(width: 6),
            Text(
              _dateLabel(poster),
              style: NedaText.muted(context),
            ),
          ],
        ),
      ],
    );
  }

  String _dateLabel(Poster p) {
    if (p.endDate == null || p.endDate == p.startDate) {
      return _fmt(p.startDate);
    }
    return '${_fmt(p.startDate)} – ${_fmt(p.endDate!)}';
  }

  String _fmt(DateTime d) => '${d.day}/${d.month}/${d.year}';
}
