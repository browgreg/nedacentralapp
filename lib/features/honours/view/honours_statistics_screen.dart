import 'package:flutter/material.dart';

import '../../../core/theme/neda_theme.dart';
import '../model/honour_category.dart';
import '../widgets/honours_content.dart';
import '../widgets/honours_header.dart';

class HonourBoardScreen extends StatefulWidget {
  const HonourBoardScreen({super.key});

  @override
  State<HonourBoardScreen> createState() => _HonourBoardScreenState();
}

class _HonourBoardScreenState extends State<HonourBoardScreen> {
  HonourCategory _selected = HonourCategory.presidents;

  @override
  Widget build(BuildContext context) {
    final n = Theme.of(context).extension<NedaTheme>()!;

    return Scaffold(
      backgroundColor: n.surfaceSubtle,
      appBar: AppBar(
        title: const Text('Honours & Statistics'),
        backgroundColor: Colors.black.withAlpha(128),
        elevation: 0,
      ),
      body: Column(
        children: [
          HonoursHeader(
            selected: _selected,
            onChanged: (c) => setState(() => _selected = c),
          ),
          Expanded(
            child: HonoursContent(category: _selected),
          ),
        ],
      ),
    );
  }
}
