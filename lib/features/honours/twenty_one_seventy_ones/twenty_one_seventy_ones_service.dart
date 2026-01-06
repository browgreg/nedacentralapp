import '../../../services/http_client.dart';
import 'twenty_one_seventy_one_entry.dart';

class TwentyOneSeventyOnesService {
  static Future<List<TwentyOneSeventyOneEntry>> fetch() async {
    final res =
        await HttpClient.get('/services/api/twenty_one_seventy_ones.php');

    if (res == null || res is! List) return [];

    return res
        .map((e) => TwentyOneSeventyOneEntry.fromJson(
              Map<String, dynamic>.from(e),
            ))
        .toList();
  }
}
