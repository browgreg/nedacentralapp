import 'package:flutter/material.dart';

import '../../../core/theme/neda_theme.dart';

class BrassPlaqueTile extends StatelessWidget {
  final String primary;
  final String secondary;

  const BrassPlaqueTile({
    super.key,
    required this.primary,
    required this.secondary,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: const Color(0xFFB08D57), // brass tone
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withAlpha(120),
            blurRadius: 12,
            offset: const Offset(0, 6),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            primary.toUpperCase(),
            style: NedaText.headingSmall(context).copyWith(color: Colors.black),
          ),
          const SizedBox(height: 4),
          Text(
            secondary,
            style: NedaText.muted(context)
                .copyWith(color: Colors.black.withAlpha(180)),
          ),
        ],
      ),
    );
  }
}
