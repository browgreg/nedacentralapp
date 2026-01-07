import '../../../services/http_client.dart';

class DoublesChampionsService {
  static Future<List<dynamic>> fetch() async {
    final res = await HttpClient.get('/services/api/doubles_champions.php');

    if (res == null || res is! List) return [];
    return res;
  }
}
