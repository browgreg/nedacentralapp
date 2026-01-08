import 'package:flutter/material.dart';

import '../../../../core/theme/neda_theme.dart';

class SectionHeader extends StatelessWidget {
  final String title;

  const SectionHeader({required this.title});

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: Theme.of(context)
          .textTheme
          .headlineSmall
          ?.copyWith(fontWeight: FontWeight.bold, color: nedaWhite),
    );
  }
}
