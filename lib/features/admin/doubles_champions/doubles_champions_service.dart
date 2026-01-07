import '../../../services/http_client.dart';
import 'doubles_champion_entry.dart';

class DoublesChampionsService {
  static Future<List<DoublesChampionEntry>> fetch() async {
    final res = await HttpClient.get(
      '/services/api/doubles_champions.php',
    );

    if (res == null || res is! List) return [];

    return res
        .map((e) => DoublesChampionEntry.fromJson(
              Map<String, dynamic>.from(e),
            ))
        .toList();
  }
}
