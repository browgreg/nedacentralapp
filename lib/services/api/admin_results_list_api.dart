import '../../features/admin/results/model/result_entry.dart';
import '../http_client.dart';

class AdminResultsListApi {
  static Future<List<ResultEntry>> fetch() async {
    final res = await HttpClient.get(
      '/services/admin/results_list.php',
    );

    return (res as List).map((e) => ResultEntry.fromJson(e)).toList();
  }
}
