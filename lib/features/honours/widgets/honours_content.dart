import 'package:flutter/material.dart';

import '../../../core/theme/neda_theme.dart';
import '../model/honour_entry.dart';

class HonoursContent extends StatelessWidget {
  final List<HonourEntry> entries;

  const HonoursContent({
    super.key,
    required this.entries,
  });

  @override
  Widget build(BuildContext context) {
    final n = Theme.of(context).extension<NedaTheme>()!;

    if (entries.isEmpty) {
      return Center(
        child: Text(
          'No records yet',
          style: NedaText.muted(context),
        ),
      );
    }

    return ListView.builder(
      padding: const EdgeInsets.all(16),
      itemCount: entries.length,
      itemBuilder: (_, i) {
        final e = entries[i];

        return Container(
          margin: const EdgeInsets.only(bottom: 12),
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: n.surfaceCard,
            borderRadius: BorderRadius.circular(16),
          ),
          child: Row(
            children: [
              Expanded(
                child: Text(
                  e.primary,
                  style: NedaText.body(context)
                      .copyWith(fontWeight: FontWeight.w600),
                ),
              ),
              Text(
                e.period ?? '',
                style: NedaText.muted(context),
              ),
            ],
          ),
        );
      },
    );
  }
}
