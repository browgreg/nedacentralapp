import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../../../core/theme/neda_theme.dart';
import '../../../core/widgets/empty_state_card.dart';
import '../../../core/widgets/error_state_card.dart';
import '../controller/landing_controller.dart';
import '../sections/club_stories_section.dart';
import '../widgets/carousel/tournament_poster_carousel.dart';
import '../widgets/landing_quick_actions.dart';
import '../widgets/landing_section_header.dart';
import '../widgets/landing_stats_bridge.dart';
import '../widgets/landing_upcoming_fixtures.dart';
import '../widgets/skeletons/landing_skeleton.dart';
import '../widgets/skeletons/tournament_carousel_skeleton.dart';

class LandingScreen extends StatefulWidget {
  const LandingScreen({super.key});

  @override
  State<LandingScreen> createState() => _LandingScreenState();
}

class _LandingScreenState extends State<LandingScreen> {
  late final LandingController c;
  final ScrollController _scrollController = ScrollController();

  double _scrollProgress = 0.0;

  @override
  void initState() {
    super.initState();
    c = Get.find<LandingController>();
    c.fetch(context);

    _scrollController.addListener(_onScroll);
  }

  void _onScroll() {
    final max = _scrollController.position.maxScrollExtent;
    final offset = _scrollController.offset;

    setState(() {
      _scrollProgress = (offset / max).clamp(0.0, 1.0);
    });
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final n = Theme.of(context).extension<NedaTheme>()!;

    return Scaffold(
      body: AnimatedContainer(
        duration: const Duration(milliseconds: 120),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.bottomCenter,
            end: Alignment.topCenter,
            stops: [
              0.0,
              0.4 + (_scrollProgress * 0.3),
              1.0,
            ],
            colors: [
              Colors.black,
              Colors.black.withAlpha(225),
              nedaTeal.withAlpha(249),
            ],
          ),
        ),
        child: SafeArea(
          child: RefreshIndicator(
            edgeOffset: 80,
            onRefresh: () async {
              HapticFeedback.lightImpact();
              await c.reload(context);
            },
            child: Obx(
              () => SingleChildScrollView(
                controller: _scrollController,
                physics: const AlwaysScrollableScrollPhysics(),
                child: _buildScrollableBody(),
              ),
            ),
          ),
        ),
      ),
    );
  }

  // ─────────────────────────
  // SINGLE SCROLL ROOT
  // ─────────────────────────
  Widget _buildScrollableBody() {
    return AnimatedSwitcher(
      duration: const Duration(milliseconds: 350),
      switchInCurve: Curves.easeOutCubic,
      switchOutCurve: Curves.easeInCubic,
      child: _buildBody(),
    );
  }

  // ─────────────────────────
  // BODY STATES
  // ─────────────────────────
  Widget _buildBody() {
    // ─── LOADING ───
    if (c.isLoading.value) {
      return Column(
        key: const ValueKey('loading'),
        children: [
          const SizedBox(height: 16),
          const TournamentCarouselSkeleton(),
          const SizedBox(height: 24),
          const LandingSkeleton(),
          const SizedBox(height: 24),
        ],
      );
    }

    // ─── ERROR ───
    if (c.error.value != null) {
      return Padding(
        key: const ValueKey('error'),
        padding: const EdgeInsets.all(20),
        child: ErrorStateCard(
          title: 'Unable to load content',
          message: c.error.value!,
          onRetry: () => c.fetch(context),
        ),
      );
    }

    // ─── CONTENT ───
    return Column(
      key: const ValueKey('content'),
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        const SizedBox(height: 12),

        // ─── HERO / TOURNAMENTS ───
        if (c.heroPosters.isNotEmpty)
          TournamentPosterCarousel(posters: c.heroPosters)
        else
          const Padding(
            padding: EdgeInsets.all(16),
            child: EmptyStateCard(
              icon: Icons.emoji_events_outlined,
              title: 'No tournaments announced',
              message: 'Upcoming events will appear here once published.',
            ),
          ),
        const LandingQuickActions(),

        const SizedBox(height: 24),
        const LandingSectionHeader(title: 'Upcoming Fixtures'),
        const SizedBox(height: 12),
        const LandingUpcomingFixtures(),
        const SizedBox(height: 24),
// ─── CLUB NEWS HEADER ───
        const LandingSectionHeader(title: 'Club News'),

        const SizedBox(height: 24),
        LandingStatsBridge(),
        // ─── CLUB STORIES ───
        if (c.clubStories.isNotEmpty)
          ClubStoriesSection(
            stories: c.clubStories,
            maxHeight: 500,
          )
        else
          const Padding(
            padding: EdgeInsets.all(16),
            child: EmptyStateCard(
              icon: Icons.article_outlined,
              title: 'No club news yet',
              message: 'Club announcements and updates will appear here.',
            ),
          ),

        const SizedBox(height: 32),
      ],
    );
  }
}
