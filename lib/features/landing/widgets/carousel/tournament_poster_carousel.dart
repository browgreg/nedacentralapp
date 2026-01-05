import 'dart:async';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

import '../../../../core/config/api_config.dart';
import '../../../../core/config/layout.dart';
import '../../../../core/theme/neda_theme.dart';
import '../../../../core/widgets/fade_in_network_image.dart';
import '../../../../core/widgets/featured_badge.dart';
import '../../../../core/widgets/glass_panel.dart';

import '../../analytics/poster_analytics.dart';
import '../../analytics/poster_dwell_tracker.dart';
import '../../model/poster.dart';
import '../../view/poster_detail_screen.dart';
import '../poster_metadata_row.dart';

class TournamentPosterCarousel extends StatefulWidget {
  final List<Poster> posters;
  final Duration interval;

  const TournamentPosterCarousel({
    super.key,
    required this.posters,
    this.interval = const Duration(seconds: 6),
  });

  @override
  State<TournamentPosterCarousel> createState() =>
      _TournamentPosterCarouselState();
}

class _TournamentPosterCarouselState
    extends State<TournamentPosterCarousel> {
  final PageController _controller = PageController();
  late final ValueNotifier<double> _page;
  Timer? _timer;

  int _index = 0;
  bool _userInteracting = false;

  bool get _canAutoScroll => widget.posters.length > 1;

  @override
  void initState() {
    super.initState();

    _page = ValueNotifier(0);

    _controller.addListener(() {
      _page.value = _controller.page ?? _index.toDouble();
    });

    if (_canAutoScroll) _startAutoScroll();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (widget.posters.isNotEmpty) {
        PosterAnalytics.impression(
          poster: widget.posters.first,
          screen: 'landing',
          source: 'tournament_carousel',
        );
        PosterDwellTracker.start(widget.posters.first);
      }
    });
  }

  // ─────────────────────────
  // Auto scroll control
  // ─────────────────────────

  void _startAutoScroll() {
    _timer?.cancel();

    _timer = Timer.periodic(widget.interval, (_) {
      if (_userInteracting) return;
      if (!_controller.hasClients) return;

      _index = (_index + 1) % widget.posters.length;

      _controller.animateToPage(
        _index,
        duration: const Duration(milliseconds: 450),
        curve: Curves.easeOutCubic,
      );
    });
  }

  void _pause() => _userInteracting = true;

  void _resume() {
    Future.delayed(const Duration(milliseconds: 1200), () {
      if (mounted) _userInteracting = false;
    });
  }

  @override
  void dispose() {
    PosterDwellTracker.end();
    _timer?.cancel();
    _controller.dispose();
    _page.dispose();
    super.dispose();
  }

  // ─────────────────────────
  // UI
  // ─────────────────────────

  @override
  Widget build(BuildContext context) {
    final n = Theme.of(context).extension<NedaTheme>()!;
    final height = AppLayout.heroHeightFor(context);

    if (widget.posters.isEmpty) return const SizedBox.shrink();

    return Center(
      child: ConstrainedBox(
        constraints: const BoxConstraints(
          maxWidth: AppLayout.maxContentWidth,
        ),
        child: SizedBox(
          height: height,
          child: Stack(
            children: [
              NotificationListener<UserScrollNotification>(
                onNotification: (n) {
                  if (n.direction != ScrollDirection.idle) {
                    _pause();
                  } else {
                    _resume();
                  }
                  return false;
                },
                child: PageView.builder(
                  controller: _controller,
                  itemCount: widget.posters.length,
                  onPageChanged: (i) {
                    _index = i;

                    PosterAnalytics.impression(
                      poster: widget.posters[i],
                      screen: 'landing',
                      source: 'tournament_carousel',
                    );

                    PosterDwellTracker.start(widget.posters[i]);
                  },
                  itemBuilder: (context, i) {
                    final poster = widget.posters[i];

                    return InkWell(
                      onTap: () {
                        PosterAnalytics.tap(
                          poster: poster,
                          screen: 'landing',
                          source: 'tournament_carousel',
                        );

                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) =>
                                PosterDetailScreen(poster: poster),
                          ),
                        );
                      },
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(24),
                        child: Stack(
                          fit: StackFit.expand,
                          children: [
                            // ─── IMAGE CARD (NOT FULL BLEED) ───
                            Align(
                              alignment: Alignment.topCenter,
                              child: Padding(
                                padding: const EdgeInsets.only(top: 24),
                                child: ConstrainedBox(
                                  constraints: const BoxConstraints(
                                    maxWidth: 720,
                                  ),
                                  child: AspectRatio(
                                    aspectRatio: 16 / 9,
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(20),
                                      child: ValueListenableBuilder<double>(
                                        valueListenable: _page,
                                        builder: (_, page, __) {
                                          final delta =
                                          (page - i).clamp(-1.0, 1.0);
                                          return Transform.translate(
                                            offset: Offset(delta * 40, 0),
                                            child: Hero(
                                              tag: 'poster_${poster.id}',
                                              flightShuttleBuilder: _heroFlightBuilder,
                                              child: FadeInNetworkImage(
                                                imageUrl:
                                                '${ApiConfig.posterBaseUrl}/${poster.imageName}',
                                                fit: BoxFit.cover,
                                                borderRadius: BorderRadius.circular(20),
                                              ),
                                            ),
                                          );
                                        },
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),

                            // ─── OVERLAY GRADIENT ───
                            const DecoratedBox(
                              decoration: BoxDecoration(
                                gradient: LinearGradient(
                                  begin: Alignment.topCenter,
                                  end: Alignment.bottomCenter,
                                  colors: [
                                    Color(0x00000000),
                                    Color(0x88000000),
                                    Color(0xDD000000),
                                  ],
                                ),
                              ),
                            ),

                            // ─── FEATURED BADGE ───
                            if (poster.isFeatured)
                              const Positioned(
                                top: 16,
                                left: 16,
                                child: FeaturedBadge(),
                              ),

                            // ─── GLASS TEXT PANEL ───
                            Positioned(
                              left: 24,
                              right: 24,
                              bottom: 24,
                              child: LayoutBuilder(
                                builder: (context, c) {
                                  final isWide = c.maxWidth >= 900;

                                  return Align(
                                    alignment: Alignment.bottomLeft,
                                    child: ConstrainedBox(
                                      constraints: BoxConstraints(
                                        maxWidth: isWide
                                            ? c.maxWidth * 0.4
                                            : c.maxWidth,
                                      ),
                                      child: GlassPanel(
                                        child: Column(
                                          crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                          mainAxisSize: MainAxisSize.min,
                                          children: [
                                            Text(
                                              poster.title,
                                              style:
                                              NedaText.heading(context)
                                                  .copyWith(
                                                  color: Colors.white),
                                            ),
                                            const SizedBox(height: 4),
                                            PosterMetadataRow(
                                                poster: poster),
                                            if (poster.subtitle?.isNotEmpty ==
                                                true) ...[
                                              const SizedBox(height: 8),
                                              Text(
                                                poster.subtitle!,
                                                style:
                                                NedaText.body(context)
                                                    .copyWith(
                                                    color:
                                                    Colors.white70),
                                              ),
                                            ],
                                          ],
                                        ),
                                      ),
                                    ),
                                  );
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),

              // ─── GOLD INDICATORS ───
              if (_canAutoScroll)
                Positioned(
                  bottom: 16,
                  right: 20,
                  child: ValueListenableBuilder<double>(
                    valueListenable: _page,
                    builder: (_, page, __) {
                      return Row(
                        children:
                        List.generate(widget.posters.length, (i) {
                          final d = (page - i).abs().clamp(0.0, 1.0);
                          return Container(
                            margin: const EdgeInsets.only(left: 6),
                            width: lerpDouble(18, 8, d)!,
                            height: 8,
                            decoration: BoxDecoration(
                              color: n.accentPrimary.withAlpha(
                                lerpDouble(255, 90, d)!.round(),
                              ),
                              borderRadius: BorderRadius.circular(6),
                              boxShadow: d < 0.1
                                  ? [
                                BoxShadow(
                                  color: n.accentPrimary.withAlpha(120),
                                  blurRadius: 10,
                                ),
                              ]
                                  : null,
                            ),
                          );
                        }),
                      );
                    },
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
Widget _heroFlightBuilder(
    BuildContext flightContext,
    Animation<double> animation,
    HeroFlightDirection direction,
    BuildContext fromContext,
    BuildContext toContext,
    ) {
  return FadeTransition(
    opacity: CurvedAnimation(
      parent: animation,
      curve: Curves.easeOutCubic,
    ),
    child: ScaleTransition(
      scale: Tween<double>(
        begin: 0.96,
        end: 1.0,
      ).animate(
        CurvedAnimation(
          parent: animation,
          curve: Curves.easeOutCubic,
        ),
      ),
      child: toContext.widget,
    ),
  );
}