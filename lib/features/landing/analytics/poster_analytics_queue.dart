import 'dart:async';

import '../../../toSort/poster_event.dart';
import '../../../services/api/poster_analytics_api.dart';

class PosterAnalyticsQueue {
  static final List<PosterEvent> _buffer = [];
  static Timer? _flushTimer;

  static void track(PosterEvent event) {
    _buffer.add(event);

    _flushTimer ??= Timer(
      const Duration(seconds: 3),
      flush,
    );
  }

  /// ✅ ADD THIS
  static Future<void> flush() async {
    if (_buffer.isEmpty) return;

    final batch = List<PosterEvent>.from(_buffer);
    _buffer.clear();
    _flushTimer?.cancel();
    _flushTimer = null;

    try {
      await PosterAnalyticsApi.send(batch);
    } catch (_) {
      // swallow for now
    }
  }
}