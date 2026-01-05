import 'package:flutter/material.dart';

import '../../../core/theme/neda_theme.dart';

class LandingSectionHeader extends StatelessWidget {
  final String title;
  final Widget? trailing;

  const LandingSectionHeader({
    super.key,
    required this.title,
    this.trailing,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20), // ✅ MATCH
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: NedaText.heading(context),
          ),
          if (trailing != null) trailing!,
        ],
      ),
    );
  }
}
