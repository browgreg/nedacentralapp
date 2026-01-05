import 'package:flutter/material.dart';
import '../theme/neda_theme.dart';

class EmptyStateCard extends StatelessWidget {
  final String title;
  final String message;
  final IconData icon;

  const EmptyStateCard({
    super.key,
    required this.title,
    required this.message,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    final n = Theme.of(context).extension<NedaTheme>()!;

    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: n.surfaceCard,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: n.borderPrimary),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, size: 42, color: n.textMuted),
          const SizedBox(height: 14),
          Text(
            title,
            style: Theme.of(context)
                .textTheme
                .titleMedium
                ?.copyWith(fontWeight: FontWeight.w700),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 8),
          Text(
            message,
            style: Theme.of(context)
                .textTheme
                .bodyMedium
                ?.copyWith(color: n.textMuted),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}