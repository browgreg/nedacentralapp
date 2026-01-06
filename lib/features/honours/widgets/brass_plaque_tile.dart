import 'package:flutter/material.dart';

import '../../../core/theme/neda_theme.dart';
import '../model/honour_entry.dart';

class BrassPlaqueTile extends StatelessWidget {
  final HonourEntry entry;

  const BrassPlaqueTile({super.key, required this.entry});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
      decoration: brassTileBoxDecoration(),
      child: Row(
        children: [
          /// Name + role
          Expanded(
            child: Text(
              entry.primary.toUpperCase(),
              style: const TextStyle(
                fontSize: 22,
                color: Color(0xFF2A1B0A),
                fontWeight: FontWeight.bold,
                letterSpacing: 1.2,
              ),
            ),
          ),

          /// Years
          if (entry.period != null)
            Text(
              entry.period!,
              style: TextStyle(
                color: nedaBlack,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
        ],
      ),
    );
  }
}
