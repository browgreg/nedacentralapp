import '../../features/admin/team_champions/admin_team_champions_entry.dart';
import '../http_client.dart';

class AdminTeamChampionsApi {
  static Future<List<AdminTeamChampionEntry>> fetch() async {
    final res = await HttpClient.get(
        '/services/admin/teams_champions/team_champions.php');
    if (res == null || res is! List) return [];

    return res
        .map((e) =>
            AdminTeamChampionEntry.fromJson(Map<String, dynamic>.from(e)))
        .toList();
  }

  static Future<void> create(AdminTeamChampionEntry entry) async {
    await HttpClient.post(
      '/services/admin/team_champions/team_champions_create.php',
      body: entry.toJson(),
    );
  }

  static Future<void> update(AdminTeamChampionEntry entry) async {
    await HttpClient.post(
      '/services/admin/team_champions/team_champions_update.php',
      body: entry.toJson(),
    );
  }

  static Future<void> delete(AdminTeamChampionEntry entry) async {
    await HttpClient.post(
      '/services/admin/team_champions/team_champions_delete.php',
      body: {'id': entry.id},
    );
  }
}
