import '../../features/admin/results/model/result_entry.dart';
import '../http_client.dart';

class AdminResultsApi {
  static Future<List<ResultEntry>> list() async {
    final res = await HttpClient.get('/services/admin/results/list.php');
    return (res as List).map((e) => ResultEntry.fromJson(e)).toList();
  }

  static Future<void> unlock(int fixtureId) async {
    await HttpClient.post(
      '/services/admin/results/unlock.php',
      body: {'fixture_id': fixtureId},
    );
  }
}
