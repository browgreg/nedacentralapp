import '../../../services/http_client.dart';

class TeamsChampionsService {
  static Future<List<dynamic>> fetch() async {
    final res = await HttpClient.get('/services/api/team_champions.php');

    if (res == null || res is! List) return [];
    return res;
  }
}
