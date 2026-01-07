import 'package:flutter/material.dart';

import '../../../core/theme/neda_theme.dart';
import '../../../core/utils/date_formatters.dart';
import '../../../core/utils/map_launcher.dart';
import '../model/poster.dart';

class PosterCtaRow extends StatelessWidget {
  final Poster poster;

  const PosterCtaRow({super.key, required this.poster});

  @override
  Widget build(BuildContext context) {
    final n = Theme.of(context).extension<NedaTheme>()!;
    final hasLocation = poster.content?.isNotEmpty == true;

    return Padding(
      padding: const EdgeInsets.only(top: 20),
      child: Row(
        children: [
          // ─── SHARE ───
          Expanded(
            child: OutlinedButton.icon(
              icon: const Icon(Icons.share_outlined),
              label: const Text('Share'),
              style: OutlinedButton.styleFrom(
                foregroundColor: n.accentPrimary,
                side: BorderSide(color: n.borderPrimary),
                padding: const EdgeInsets.symmetric(vertical: 14),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(14),
                ),
              ),
              onPressed:
                  hasLocation ? () => MapLauncher.open(poster.content!) : null,
            ),
          ),

          if (hasLocation) ...[
            const SizedBox(width: 12),

            // ─── DIRECTIONS ───
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
                  MapLauncher.open(poster.content!);
                },
              ),
            ),
          ],
        ],
      ),
    );
  }
}

class PosterMetaRow extends StatelessWidget {
  final Poster poster;

  const PosterMetaRow({super.key, required this.poster});

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 8,
      runSpacing: 8,
      children: [
        _MetaChip(
          icon: Icons.calendar_today_outlined,
          label: DateFormatters.posterRange(
            poster.startDate,
            poster.endDate,
          ),
        ),
        if (poster.location != null)
          _MetaChip(
            icon: Icons.location_on_outlined,
            label: poster.location!,
          ),
      ],
    );
  }
}

class _MetaChip extends StatelessWidget {
  final IconData icon;
  final String label;

  const _MetaChip({
    required this.icon,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    final n = Theme.of(context).extension<NedaTheme>()!;

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      decoration: BoxDecoration(
        color: n.surfaceSubtle,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: n.borderPrimary),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, size: 14, color: n.textMuted),
          const SizedBox(width: 6),
          Text(
            label,
            style: TextStyle(
              fontSize: 13,
              color: n.textMuted,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}
