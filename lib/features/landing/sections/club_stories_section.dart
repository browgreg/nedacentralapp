import 'package:flutter/material.dart';
import '../../../core/config/layout.dart';
import '../../../core/theme/neda_theme.dart';
import '../model/poster.dart';
import '../view/poster_detail_screen.dart';

class ClubStoriesSection extends StatefulWidget {
  final List<Poster> stories;

  /// Max height for the whole component
  final double maxHeight;

  const ClubStoriesSection({
    super.key,
    required this.stories,
    required this.maxHeight,
  });

  @override
  State<ClubStoriesSection> createState() => _ClubStoriesSectionState();
}

class _ClubStoriesSectionState extends State<ClubStoriesSection> {
  int _selectedIndex = 0;

  List<Poster> get _topStories {
    final list = widget.stories.toList();

    // Newest first (then priority)
    list.sort((a, b) {
      final d = b.startDate.compareTo(a.startDate);
      if (d != 0) return d;
      return b.priority.compareTo(a.priority);
    });

    // Max 5
    return list.take(5).toList();
  }

  @override
  Widget build(BuildContext context) {
    final stories = _topStories;
    if (stories.isEmpty) return const SizedBox.shrink();

    if (_selectedIndex >= stories.length) _selectedIndex = 0;

    final poster = stories[_selectedIndex];
    final height = widget.maxHeight > 0
        ? widget.maxHeight
        : AppLayout.heroHeightFor(context);

    return Padding(
      padding: NedaSpace.allLg(),
      child: ConstrainedBox(
        constraints: BoxConstraints(maxHeight: height),
        child: Material(
          color: Colors.transparent,
          child: Container(
            decoration: NedaSurface.card(context),
            clipBehavior: Clip.antiAlias,
            child: LayoutBuilder(
              builder: (context, c) {
                final isWide = c.maxWidth >= 760;

                return isWide
                    ? Row(
                  children: [
                    _TabsRail(
                      stories: stories,
                      selectedIndex: _selectedIndex,
                      onSelect: (i) => setState(() => _selectedIndex = i),
                    ),
                    const VerticalDivider(width: 1),
                    Expanded(
                      child: _StoryContent(poster: poster),
                    ),
                  ],
                )
                    : Column(
                  children: [
                    _TabsTop(
                      stories: stories,
                      selectedIndex: _selectedIndex,
                      onSelect: (i) => setState(() => _selectedIndex = i),
                    ),
                    const Divider(height: 1),
                    Expanded(
                      child: _StoryContent(poster: poster),
                    ),
                  ],
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}

/// ─────────────────────────
/// Left rail tabs (wide layouts)
/// ─────────────────────────
class _TabsRail extends StatelessWidget {
  final List<Poster> stories;
  final int selectedIndex;
  final ValueChanged<int> onSelect;

  const _TabsRail({
    required this.stories,
    required this.selectedIndex,
    required this.onSelect,
  });

  @override
  Widget build(BuildContext context) {
    final n = Theme.of(context).extension<NedaTheme>()!;

    return SizedBox(
      width: 240,
      child: Padding(
        padding: const EdgeInsets.all(14),
        child: ListView.separated(
          itemCount: stories.length,
          separatorBuilder: (_, __) => const SizedBox(height: 8),
          itemBuilder: (context, i) {
            final isActive = i == selectedIndex;
            final poster = stories[i];

            return InkWell(
              onTap: () => onSelect(i),
              borderRadius: BorderRadius.circular(12),
              child: Container(
                padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 12),
                decoration: BoxDecoration(
                  color: isActive
                      ? Theme.of(context).colorScheme.primary.withAlpha(28)
                      : Colors.transparent,
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(
                    color: isActive
                        ? Theme.of(context).colorScheme.primary.withAlpha(80)
                        : n.borderPrimary.withAlpha(80),
                  ),
                ),
                child: Text(
                  poster.title,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: NedaText.body(context).copyWith(
                    fontWeight: isActive ? FontWeight.w700 : FontWeight.w500,
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

/// ─────────────────────────
/// Top tabs (narrow layouts)
/// ─────────────────────────
class _TabsTop extends StatelessWidget {
  final List<Poster> stories;
  final int selectedIndex;
  final ValueChanged<int> onSelect;

  const _TabsTop({
    required this.stories,
    required this.selectedIndex,
    required this.onSelect,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 72,
      child: ListView.separated(
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
        scrollDirection: Axis.horizontal,
        itemCount: stories.length,
        separatorBuilder: (_, __) => const SizedBox(width: 10),
        itemBuilder: (context, i) {
          final isActive = i == selectedIndex;
          final poster = stories[i];

          return InkWell(
            onTap: () => onSelect(i),
            borderRadius: BorderRadius.circular(12),
            child: Container(
              width: 220,
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
              decoration: BoxDecoration(
                color: isActive
                    ? Theme.of(context).colorScheme.primary.withAlpha(28)
                    : Colors.transparent,
                borderRadius: BorderRadius.circular(12),
                border: Border.all(
                  color: isActive
                      ? Theme.of(context).colorScheme.primary.withAlpha(80)
                      : Theme.of(context)
                      .extension<NedaTheme>()!
                      .borderPrimary
                      .withAlpha(80),
                ),
              ),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  poster.title,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: NedaText.body(context).copyWith(
                    fontWeight: isActive ? FontWeight.w700 : FontWeight.w500,
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

/// ─────────────────────────
/// Story content (scrollable)
/// ─────────────────────────
class _StoryContent extends StatelessWidget {
  final Poster poster;

  const _StoryContent({required this.poster});

  @override
  Widget build(BuildContext context) {
    final n = Theme.of(context).extension<NedaTheme>()!;

    return SingleChildScrollView(
      padding: const EdgeInsets.all(18),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Image (kept reasonable height to avoid overflow)
          ClipRRect(
            borderRadius: BorderRadius.circular(16),
            child: AspectRatio(
              aspectRatio: 16 / 9,
              child: GestureDetector( onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => PosterDetailScreen(poster: poster),
                  ),
                );
              },
                child: Image.network(
                  'https://neda.club/BackEnd/posters/${poster.imageName}',
                  fit: BoxFit.cover,
                  errorBuilder: (_, __, ___) => Container(color: n.surfaceSubtle),
                ),
              ),
            ),
          ),
          const SizedBox(height: 14),

          Text(poster.title, style: NedaText.headingSmall(context)),

          if (poster.subtitle?.isNotEmpty == true) ...[
            const SizedBox(height: 6),
            Text(poster.subtitle!, style: NedaText.muted(context)),
          ],

          if (poster.content?.isNotEmpty == true) ...[
            const SizedBox(height: 12),
            Text(poster.content!, style: NedaText.body(context)),
          ],
        ],
      ),
    );
  }
}