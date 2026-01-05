import 'package:flutter/material.dart';

import '../theme/neda_theme.dart';

class HonourBoardBackground extends StatelessWidget {
  final Widget child;
  final BorderRadius? borderRadius;

  const HonourBoardBackground({
    super.key,
    required this.child,
    this.borderRadius,
  });

  @override
  Widget build(BuildContext context) {
    final n = Theme.of(context).extension<NedaTheme>()!;

    return Container(
      decoration: BoxDecoration(
        borderRadius: borderRadius ?? BorderRadius.circular(20),

        /// 🟦 Base plaque colour (dark, neutral, premium)
        color: n.surfaceCard,

        /// ✨ Subtle elevation
        boxShadow: [
          BoxShadow(
            color: Colors.black.withAlpha(115),
            blurRadius: 30,
            offset: const Offset(0, 18),
          ),
        ],
      ),
      child: Stack(
        children: [
          /// 🌈 Subtle brand wash (teal)
          Positioned.fill(
            child: DecoratedBox(
              decoration: BoxDecoration(
                borderRadius: borderRadius ?? BorderRadius.circular(20),
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [
                    n.accentPrimary.withAlpha(26),
                    Colors.transparent,
                    Colors.black.withAlpha(64),
                  ],
                ),
              ),
            ),
          ),

          /// ✨ Gloss highlight (very restrained)
          Positioned.fill(
            child: DecoratedBox(
              decoration: BoxDecoration(
                borderRadius: borderRadius ?? BorderRadius.circular(20),
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Colors.white.withAlpha(15),
                    Colors.transparent,
                  ],
                ),
              ),
            ),
          ),

          child,
        ],
      ),
    );
  }
}
