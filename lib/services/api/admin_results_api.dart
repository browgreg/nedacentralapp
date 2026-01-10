import '../http_client.dart';

class AdminResultsApi {
  static Future<void> unlock(int fixtureId) async {
    await HttpClient.post(
      '/services/admin/results_unlock.php',
      body: {'fixture_id': fixtureId},
    );
  }

  static Future<void> save({
    required int fixtureId,
    required int home,
    required int away,
    required String overrideReason,
  }) async {
    await HttpClient.post(
      '/services/captain/results_save.php',
      body: {
        'fixture_id': fixtureId,
        'reason': overrideReason,
      },
    );
  }
}
