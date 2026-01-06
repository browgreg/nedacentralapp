import 'package:flutter/material.dart';

import '../../../core/theme/neda_theme.dart';
import '../model/honour_entry.dart';

class HonourEntryRow extends StatelessWidget {
  final HonourEntry entry;

  const HonourEntryRow({super.key, required this.entry});

  @override
  Widget build(BuildContext context) {
    final n = Theme.of(context).extension<NedaTheme>()!;

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  entry.primary,
                  style: NedaText.body(context)
                      .copyWith(fontWeight: FontWeight.w600),
                ),
                Text(
                  entry.secondary,
                  style: NedaText.muted(context),
                ),
              ],
            ),
          ),
          if (entry.period != null)
            Text(
              entry.period!,
              style: NedaText.muted(context),
            ),
        ],
      ),
    );
  }
}
