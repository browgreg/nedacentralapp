import '../../toSort/poster_event.dart';
import '../http_client.dart';

class PosterAnalyticsApi {
  static Future<void> send(List<PosterEvent> events) async {
    if (events.isEmpty) return;

    await HttpClient.post(
      '/analytics/posters_track.php',
      body: {
        'events': events.map((e) => e.toJson()).toList(),
      },
    );
  }
}