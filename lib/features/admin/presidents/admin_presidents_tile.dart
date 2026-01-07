import 'package:flutter/material.dart';

import '../../../core/theme/neda_theme.dart';
import 'admin_presidents_entry.dart';

class AdminPresidentTile extends StatelessWidget {
  final AdminPresidentEntry entry;
  final VoidCallback onEdit;

  const AdminPresidentTile({
    super.key,
    required this.entry,
    required this.onEdit,
  });

  @override
  Widget build(BuildContext context) {
    final n = Theme.of(context).extension<NedaTheme>()!;

    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: n.surfaceCard,
        borderRadius: BorderRadius.circular(14),
        boxShadow: n.shadowSoft,
        border: Border.all(
          color: n.accentPrimary.withAlpha(80),
        ),
      ),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  entry.name,
                  style: NedaText.headingSmall(context),
                ),
                const SizedBox(height: 4),
                Text(
                  entry.period,
                  style: NedaText.muted(context),
                ),
              ],
            ),
          ),
          IconButton(
            icon: const Icon(Icons.edit),
            onPressed: onEdit,
          ),
        ],
      ),
    );
  }
}
