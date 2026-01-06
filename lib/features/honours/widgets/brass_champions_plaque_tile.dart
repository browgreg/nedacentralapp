import 'package:flutter/material.dart';

import '../../../core/theme/neda_theme.dart';

class BrassChampionsPlaqueTile extends StatelessWidget {
  final String primary;
  final String secondary;

  const BrassChampionsPlaqueTile({
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
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 30,
          ),
          Text(
            primary,
            style: NedaText.heading(context)
                .copyWith(color: Colors.black, fontSize: 22),
            textAlign: TextAlign.left,
          ),
          Spacer(),
          Text(
            secondary,
            style: NedaText.heading(context)
                .copyWith(color: Colors.black, fontSize: 20),
            textAlign: TextAlign.right,
          ),
          SizedBox(
            width: 30,
          ),
        ],
      ),
    );
  }
}
