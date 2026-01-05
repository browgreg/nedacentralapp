import 'package:flutter/material.dart';

import '../theme/neda_theme.dart';

class WoodgrainBackground extends StatelessWidget {
  final Widget child;
  final BorderRadius? borderRadius;

  const WoodgrainBackground({
    super.key,
    required this.child,
    this.borderRadius,
  });

  @override
  Widget build(BuildContext context) {
    final n = Theme.of(context).extension<NedaTheme>()!;

    return Container(
      decoration: BoxDecoration(
        borderRadius: borderRadius,
        image: const DecorationImage(
          image: AssetImage('assets/backgrounds/14.jpg'),
          fit: BoxFit.cover,
        ),
      ),
      child: Stack(
        children: [
          /// DARK TINT (keeps text readable)
          Container(
            decoration: BoxDecoration(
              borderRadius: borderRadius,
              color: Colors.black.withOpacity(0.45),
            ),
          ),

          /// SHINE / GLOSS
          Container(
            decoration: BoxDecoration(
              borderRadius: borderRadius,
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  Colors.white.withOpacity(0.12),
                  Colors.transparent,
                  Colors.black.withOpacity(0.25),
                ],
              ),
            ),
          ),

          child,
        ],
      ),
    );
  }
}
