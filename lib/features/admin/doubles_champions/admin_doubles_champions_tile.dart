import 'package:flutter/material.dart';

import 'admin_doubles_champions_entry.dart';

class AdminDoublesChampionsTile extends StatelessWidget {
  final AdminDoublesChampionEntry entry;

  const AdminDoublesChampionsTile({
    super.key,
    required this.entry,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Left column (meta)
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  entry.year.toString(),
                  style: Theme.of(context).textTheme.labelLarge,
                ),
                const SizedBox(height: 4),
                Text(
                  'Division ${entry.division}',
                  style: Theme.of(context).textTheme.labelMedium,
                ),
              ],
            ),

            const SizedBox(width: 24),

            // Champion info
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Winner: ${entry.champion1} &  ${entry.champion2}',
                    style: Theme.of(context)
                        .textTheme
                        .titleMedium
                        ?.copyWith(fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 6),
                  Text(
                    'Runners-up: ${entry.runnerUp1} & ${entry.runnerUp2}',
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                ],
              ),
            ),

            // Actions (future-safe)
            IconButton(
              icon: const Icon(Icons.edit),
              onPressed: () {
                // edit dialog later
              },
            ),
          ],
        ),
      ),
    );
  }
}
