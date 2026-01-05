import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../../core/config/api_config.dart';
import '../../../core/theme/neda_theme.dart';
import '../../../core/widgets/fade_in_network_image.dart';
import '../analytics/poster_dwell_tracker.dart';
import '../model/poster.dart';
import '../widgets/poster_cta_row.dart';
import '../widgets/poster_metadata_row.dart';

class PosterDetailScreen extends StatefulWidget {
  final Poster poster;

  const PosterDetailScreen({
    super.key,
    required this.poster,
  });

  @override
  State<PosterDetailScreen> createState() => _PosterDetailScreenState();
}

class _PosterDetailScreenState extends State<PosterDetailScreen>
    with SingleTickerProviderStateMixin {
  // ─────────────────────────
  // Swipe-to-dismiss
  // ─────────────────────────
  double _dragOffset = 0;
  bool _isDragging = false;

  static const double _dismissThreshold = 120;

  // ─────────────────────────
  // Stagger animation
  // ─────────────────────────
  late final AnimationController _anim;
  late final Animation<double> _titleAnim;
  late final Animation<double> _metaAnim;
  late final Animation<double> _bodyAnim;
  late final Animation<double> _ctaAnim;

  @override
  void initState() {
    super.initState();

    PosterDwellTracker.start(widget.poster);

    _anim = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 520),
    );

    _titleAnim = CurvedAnimation(
      parent: _anim,
      curve: const Interval(0.0, 0.35, curve: Curves.easeOutCubic),
    );

    _metaAnim = CurvedAnimation(
      parent: _anim,
      curve: const Interval(0.15, 0.55, curve: Curves.easeOutCubic),
    );

    _bodyAnim = CurvedAnimation(
      parent: _anim,
      curve: const Interval(0.35, 0.85, curve: Curves.easeOutCubic),
    );

    _ctaAnim = CurvedAnimation(
      parent: _anim,
      curve: const Interval(0.65, 1.0, curve: Curves.easeOutCubic),
    );

    _anim.forward();
  }

  @override
  void dispose() {
    PosterDwellTracker.end();
    _anim.dispose();
    super.dispose();
  }

  // ─────────────────────────
  // BUILD
  // ─────────────────────────
  @override
  Widget build(BuildContext context) {
    final n = Theme.of(context).extension<NedaTheme>()!;

    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Stack(
        children: [
          // 🔹 Dynamic background blur + dim
          _DragBlurOverlay(
            progress: (_dragOffset / 300).clamp(0.0, 1.0),
          ),

          // 🔹 Foreground content (draggable)
          GestureDetector(
            onVerticalDragStart: (_) => _isDragging = true,
            onVerticalDragUpdate: (d) {
              setState(() {
                _dragOffset = (_dragOffset + d.delta.dy).clamp(0, 300);
              });
            },
            onVerticalDragEnd: (d) {
              final velocity = d.primaryVelocity ?? 0;

              if (_dragOffset > _dismissThreshold || velocity > 900) {
                HapticFeedback.mediumImpact();
                Navigator.pop(context);
              } else {
                setState(() {
                  _dragOffset = 0;
                  _isDragging = false;
                });
              }
            },
            child: AnimatedContainer(
              duration: _isDragging
                  ? Duration.zero
                  : const Duration(milliseconds: 280),
              curve: Curves.easeOutCubic,
              child: Opacity(
                opacity: lerpDouble(1.0, 0.85, _dragOffset / 300)!,
                child: _buildContent(context, n),
              ),
            ),
          ),
        ],
      ),
    );
  }

  // ─────────────────────────
  // CONTENT (REAL PAGE)
  // ─────────────────────────
  Widget _buildContent(BuildContext context, NedaTheme n) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: n.surfaceCard,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(
            Icons.close,
            color: Colors.white,
          ),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text(widget.poster.title),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            /// HERO IMAGE
            Hero(
              tag: 'poster_${widget.poster.id}',
              flightShuttleBuilder: _heroFlightBuilder,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: AspectRatio(
                  aspectRatio: 16 / 9,
                  child: FadeInNetworkImage(
                    imageUrl:
                        '${ApiConfig.posterBaseUrl}/${widget.poster.imageName}',
                    fit: BoxFit.fitHeight,
                  ),
                ),
              ),
            ),

            const SizedBox(height: 20),

            /// TITLE
            _StaggerFadeSlide(
              animation: _titleAnim,
              child: Text(
                widget.poster.title,
                style: NedaText.heading(context),
              ),
            ),

            const SizedBox(height: 8),

            /// META
            _StaggerFadeSlide(
              animation: _metaAnim,
              beginY: 0.03,
              child: PosterMetadataRow(poster: widget.poster),
            ),

            /// SUBTITLE
            if (widget.poster.subtitle?.isNotEmpty == true) ...[
              const SizedBox(height: 8),
              _StaggerFadeSlide(
                animation: _bodyAnim,
                child: Text(
                  widget.poster.subtitle!,
                  style: NedaText.muted(context),
                ),
              ),
            ],

            /// BODY
            if (widget.poster.content?.isNotEmpty == true) ...[
              const SizedBox(height: 16),
              _StaggerFadeSlide(
                animation: _bodyAnim,
                beginY: 0.02,
                child: Text(
                  widget.poster.content!,
                  style: NedaText.body(context),
                ),
              ),
            ],

            /// CTA
            if (widget.poster.ctaUrl != null) ...[
              const SizedBox(height: 24),
              _StaggerFadeSlide(
                animation: _ctaAnim,
                beginY: 0.02,
                child: PosterCtaRow(poster: widget.poster),
              ),
            ],
          ],
        ),
      ),
    );
  }
}

/// ─────────────────────────
/// STAGGER HELPER
/// ─────────────────────────
class _StaggerFadeSlide extends StatelessWidget {
  final Animation<double> animation;
  final double beginY;
  final Widget child;

  const _StaggerFadeSlide({
    required this.animation,
    this.beginY = 0.04,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return FadeTransition(
      opacity: animation,
      child: SlideTransition(
        position: Tween<Offset>(
          begin: Offset(0, beginY),
          end: Offset.zero,
        ).animate(animation),
        child: child,
      ),
    );
  }
}

/// ─────────────────────────
/// HERO FLIGHT
/// ─────────────────────────
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
      scale: Tween<double>(begin: 0.96, end: 1.0).animate(
        CurvedAnimation(
          parent: animation,
          curve: Curves.easeOutCubic,
        ),
      ),
      child: toContext.widget,
    ),
  );
}

class _DragBlurOverlay extends StatelessWidget {
  final double progress;

  const _DragBlurOverlay({required this.progress});

  @override
  Widget build(BuildContext context) {
    final blur = lerpDouble(0, 18, progress)!;
    final dim = lerpDouble(0.25, 0.55, progress)!;

    return IgnorePointer(
      ignoring: true,
      child: BackdropFilter(
        filter: ImageFilter.blur(
          sigmaX: blur,
          sigmaY: blur,
        ),
        child: Container(
          color: Colors.black.withValues(alpha: dim),
        ),
      ),
    );
  }
}
