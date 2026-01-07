import '../../../services/http_client.dart';

class FiftyOneEightiesService {
  static Future<List<dynamic>> fetch() async {
    final res = await HttpClient.get('/services/api/fifty_one_eighties.php');

    if (res == null || res is! List) return [];
    return res;
  }
}
