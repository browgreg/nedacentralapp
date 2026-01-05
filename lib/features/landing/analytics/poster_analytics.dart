import 'package:flutter/foundation.dart';


import '../../../toSort/poster_event.dart';
import 'poster_analytics_queue.dart';
import '../model/poster.dart';

class PosterAnalytics {
  /// Poster impression (visible on screen)
  static void impression({
    required Poster poster,
    required String screen,
    required String source,
  }) {
    _track(
      poster: poster,
      type: 'impression',
      screen: screen,
      source: source,
    );
  }

  /// Poster tap / open
  static void tap({
    required Poster poster,
    required String screen,
    required String source,
  }) {
    _track(
      poster: poster,
      type: 'tap',
      screen: screen,
      source: source,
    );
  }

  // ─────────────────────────
  // Internal helper
  // ─────────────────────────
  static void _track({
    required Poster poster,
    required String type,
    required String screen,
    required String source,
  }) {
    try {
      PosterAnalyticsQueue.track(
        PosterEvent(
          posterId: poster.id,
          type: type,
          screen: screen,
          source: source,
          ts: DateTime.now(),
        ),
      );
    } catch (e, s) {
      debugPrint('PosterAnalytics error: $e');
      debugPrintStack(stackTrace: s);
    }
  }
}























