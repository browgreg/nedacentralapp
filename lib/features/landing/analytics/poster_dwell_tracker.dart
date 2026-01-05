import 'dart:async';

import '../../../toSort/poster_event.dart';
import '../model/poster.dart';
import 'poster_analytics_queue.dart';

class PosterDwellTracker {
  static Timer? _timer;
  static Poster? _poster;
  static DateTime? _start;

  /// Call when poster becomes visible
  static void start(Poster poster) {
    end(); // safety: close previous session

    _poster = poster;
    _start = DateTime.now();

    _timer = Timer(const Duration(seconds: 3), () {
      _flush();
    });
  }

  /// Call when poster is no longer visible
  static void end() {
    _timer?.cancel();
    _timer = null;
    _poster = null;
    _start = null;
  }

  static void _flush() {
    if (_poster == null || _start == null) return;

    PosterAnalyticsQueue.track(
      PosterEvent(
        posterId: _poster!.id,
        type: 'dwell',
        ts: DateTime.now(), source: '', screen: '',
      ),
    );

    end();
  }
}