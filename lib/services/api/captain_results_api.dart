import '../http_client.dart';

class CaptainResultsApi {
  static Future<void> save({
    required int fixtureId,
    required int home,
    required int away,
  }) async {
    await HttpClient.post(
      '/services/captain/results_save.php',
      body: {
        'fixture_id': fixtureId,
        'home_score': home,
        'away_score': away,
      },
    );
  }

  static Future<Map<String, dynamic>> fetch(int fixtureId) async {
    return await HttpClient.post(
      '/services/captain/results_fetch.php',
      body: {'fixture_id': fixtureId},
    );
  }
}
