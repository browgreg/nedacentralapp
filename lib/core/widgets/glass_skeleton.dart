import 'dart:ui';

import 'package:flutter/material.dart';

class GlassSkeleton extends StatelessWidget {
  final double height;
  final double borderRadius;

  const GlassSkeleton({
    super.key,
    required this.height,
    this.borderRadius = 20,
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(borderRadius),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 12, sigmaY: 12),
        child: Container(
          height: height,
          decoration: BoxDecoration(
            color: Colors.white.withAlpha(40),
            borderRadius: BorderRadius.circular(borderRadius),
            border: Border.all(
              color: Colors.white.withAlpha(60),
            ),
          ),
        ),
      ),
    );
  }
}
