import 'package:flutter/material.dart';

import '../../../core/widgets/honour_board_background.dart';
import '../model/honour_entry.dart';
import 'honours_entry_row.dart';

class HonourBoard extends StatelessWidget {
  final List<HonourEntry> entries;

  const HonourBoard({super.key, required this.entries});

  @override
  Widget build(BuildContext context) {
    return HonourBoardBackground(
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: entries.map((e) => HonourEntryRow(entry: e)).toList(),
        ),
      ),
    );
  }
}
