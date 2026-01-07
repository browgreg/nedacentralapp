import '../../../services/http_client.dart';
import 'result_entry.dart';

class ResultsService {
  static Future<List<ResultEntry>> fetch() async {
    final res = await HttpClient.get('/services/api/results.php');

    if (res == null || res is! List) return [];

    return res
        .map((e) => ResultEntry.fromJson(
              Map<String, dynamic>.from(e),
            ))
        .toList();
  }
}
