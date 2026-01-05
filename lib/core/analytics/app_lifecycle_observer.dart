import 'package:flutter/widgets.dart';

import '../../features/landing/analytics/poster_analytics_queue.dart';

class AppLifecycleObserver extends WidgetsBindingObserver {
  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    switch (state) {
      case AppLifecycleState.paused:
      case AppLifecycleState.detached:
      case AppLifecycleState.inactive:
      case AppLifecycleState.hidden: // ✅ REQUIRED (Flutter 3.22+)
        PosterAnalyticsQueue.flush();
        break;

      case AppLifecycleState.resumed:
      // App visible & active again
        break;
    }
  }
}