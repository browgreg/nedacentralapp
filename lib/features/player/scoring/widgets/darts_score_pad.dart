import 'package:flutter/material.dart';

class DartScorePad extends StatelessWidget {
  final String label;
  final ValueChanged<int> onScoreSelected;

  const DartScorePad({
    super.key,
    required this.label,
    required this.onScoreSelected,
  });

  static const scores = [
    170,
    167,
    164,
    161,
    160,
    158,
    157,
    156,
    155,
    154,
    153,
    152,
    151,
    150,
    149,
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: const TextStyle(fontWeight: FontWeight.bold)),
        const SizedBox(height: 8),
        Wrap(
          spacing: 8,
          runSpacing: 8,
          children: scores
              .map(
                (s) => OutlinedButton(
                  onPressed: () => onScoreSelected(s),
                  child: Text('$s'),
                ),
              )
              .toList(),
        ),
      ],
    );
  }
}
