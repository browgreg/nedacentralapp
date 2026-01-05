import 'package:flutter/material.dart';

import '../../../core/theme/neda_theme.dart';

class LandingStatsBridge extends StatelessWidget {
  const LandingStatsBridge({super.key});

  @override
  Widget build(BuildContext context) {
    final n = Theme.of(context).extension<NedaTheme>()!;
    final isWide = MediaQuery.of(context).size.width > 900;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: InkWell(
        borderRadius: BorderRadius.circular(22),
        onTap: () {
          // TODO: Navigate to honours / stats hub
        },
        child: Container(
          height: isWide ? 140 : 120,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(22),
            boxShadow: n.shadowSoft,
          ),
          child: Stack(
            children: [
              /// BACKGROUND IMAGE
              ClipRRect(
                borderRadius: BorderRadius.circular(22),
                child: Image.asset(
                  'assets/images/honours_bg.jpg', // 👈 add this
                  width: double.infinity,
                  height: double.infinity,
                  fit: BoxFit.cover,
                  errorBuilder: (_, __, ___) => Container(
                    color: n.surfaceCard,
                  ),
                ),
              ),

              /// DARK GRADIENT OVERLAY
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(22),
                  gradient: LinearGradient(
                    begin: Alignment.bottomLeft,
                    end: Alignment.topRight,
                    colors: [
                      Colors.black.withOpacity(0.75),
                      nedaTeal.withOpacity(0.35),
                    ],
                  ),
                ),
              ),

              /// CONTENT
              Padding(
                padding: const EdgeInsets.all(20),
                child: Row(
                  children: [
                    /// ICON BADGE
                    Container(
                      width: 48,
                      height: 48,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.black.withOpacity(0.4),
                        border: Border.all(
                          color: nedaTeal.withOpacity(0.6),
                        ),
                      ),
                      child: Icon(
                        Icons.emoji_events_outlined,
                        color: nedaTeal,
                      ),
                    ),

                    const SizedBox(width: 16),

                    /// TEXT
                    Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Honours & Statistics',
                            style: NedaText.headingSmall(context)
                                .copyWith(color: Colors.white),
                          ),
                          const SizedBox(height: 6),
                          Text(
                            'Premiers, champions, records and season stats.',
                            style: NedaText.muted(context)
                                .copyWith(color: Colors.white70),
                          ),
                        ],
                      ),
                    ),

                    const Icon(
                      Icons.arrow_forward_ios_rounded,
                      size: 16,
                      color: Colors.white70,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
