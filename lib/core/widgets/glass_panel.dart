import 'dart:ui';
import 'package:flutter/material.dart';

class GlassPanel extends StatelessWidget {
  final Widget child;
  final EdgeInsets padding;

  const GlassPanel({
    super.key,
    required this.child,
    this.padding = const EdgeInsets.symmetric(
      horizontal: 16,
      vertical: 14,
    ),
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(16),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 14, sigmaY: 14),
        child: Container(

          padding: padding,
          decoration: BoxDecoration(
            color: Colors.black.withAlpha(110), // 👈 glass tint
            borderRadius: BorderRadius.circular(16),
            border: Border.all(
              color: Colors.white.withAlpha(40),
            ),
          ),
          child: child,
        ),
      ),
    );
  }
}