import 'package:flutter/material.dart';

import '../model/honour_entry.dart';

class HonourEntryTile extends StatelessWidget {
  final HonourEntry entry;

  const HonourEntryTile({super.key, required this.entry});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        title: Text(entry.primary),
        subtitle: Text(entry.secondary),
        trailing: entry.period != null ? Text(entry.period!) : null,
      ),
    );
  }
}
