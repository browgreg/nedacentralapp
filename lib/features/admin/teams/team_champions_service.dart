import '../../../services/http_client.dart';
import 'team_champion_entry.dart';

class TeamChampionsService {
  static Future<List<TeamChampionEntry>> fetch() async {
    final res = await HttpClient.get(
      '/services/api/team_champions.php',
    );

    if (res == null || res is! List) return [];

    return res
        .map((e) => TeamChampionEntry.fromJson(
              Map<String, dynamic>.from(e),
            ))
        .toList();
  }
}
