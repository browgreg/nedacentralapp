import '../../../services/http_client.dart';

class TenOneSeventyOnesService {
  static Future<List<dynamic>> fetch() async {
    final res = await HttpClient.get('/services/api/ten_one_seventy_ones.php');

    if (res == null || res is! List) return [];
    return res;
  }
}
