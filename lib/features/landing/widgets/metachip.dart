import 'package:flutter/material.dart';

import '../../../core/theme/neda_theme.dart';

class MetaChip extends StatelessWidget {
  final IconData icon;
  final String label;

  const MetaChip({
    super.key,
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
