import 'package:flutter/material.dart';
import '../theme/neda_theme.dart';

class FeaturedBadge extends StatelessWidget {
  final String label;

  const FeaturedBadge({
    super.key,
    this.label = 'FEATURED',
  });

  @override
  Widget build(BuildContext context) {
    final n = Theme.of(context).extension<NedaTheme>()!;

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
      decoration: BoxDecoration(
        color: n.accentPrimary,
        borderRadius: BorderRadius.circular(10),
        boxShadow: n.shadowSoft,
      ),
      child: Text(
        label,
        style: const TextStyle(
          fontSize: 11,
          fontWeight: FontWeight.w800,
          letterSpacing: 0.8,
          color: Colors.black,
        ),
      ),
    );
  }
}