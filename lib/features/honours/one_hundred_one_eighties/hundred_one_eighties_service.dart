import '../../../services/http_client.dart';

class HundredOneEightiesService {
  static Future<List<dynamic>> fetch() async {
    final res =
        await HttpClient.get('/services/api/one_hundred_one_eighties.php');

    if (res == null || res is! List) return [];
    return res;
  }
}
