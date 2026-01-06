import 'package:flutter/material.dart';

import '../../../core/theme/neda_theme.dart';
import '../model/honour_entry.dart';

class HonourTile extends StatelessWidget {
  final HonourEntry entry;

  const HonourTile({super.key, required this.entry});

  @override
  Widget build(BuildContext context) {
    final n = Theme.of(context).extension<NedaTheme>()!;

    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.black,
        borderRadius: BorderRadius.circular(14),
        border: Border.all(
          color: n.accentPrimary.withAlpha(160),
        ),
      ),
      child: Row(
        children: [
          Expanded(
            child: Text(
              entry.title,
              style: NedaText.headingSmall(context)
                  .copyWith(color: n.accentPrimary),
            ),
          ),
          Text(
            entry.period,
            style: NedaText.muted(context),
          ),
        ],
      ),
    );
  }
}
