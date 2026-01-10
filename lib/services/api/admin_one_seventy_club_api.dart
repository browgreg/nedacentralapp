import '../../features/admin/one_seventy_club/model/admin_one_seventy_club_entry.dart';
import '../http_client.dart';

class AdminOneSeventyClubApi {
  static Future<List<AdminOneSeventyClubEntry>> fetch() async {
    final res = await HttpClient.get(
        '/services/admin/one_seventy_club/one_seventy_club.php');
    if (res == null || res is! List) return [];

    return res
        .map((e) =>
            AdminOneSeventyClubEntry.fromJson(Map<String, dynamic>.from(e)))
        .toList();
  }

  static Future<void> create(AdminOneSeventyClubEntry entry) async {
    await HttpClient.post(
      '/services/admin/team_champions/team_champions_create.php',
      body: entry.toJson(),
    );
  }

  static Future<void> update(AdminOneSeventyClubEntry entry) async {
    await HttpClient.post(
      '/services/admin/team_champions/team_champions_update.php',
      body: entry.toJson(),
    );
  }

  static Future<void> delete(AdminOneSeventyClubEntry entry) async {
    await HttpClient.post(
      '/services/admin/team_champions/team_champions_delete.php',
      body: {'id': entry.id},
    );
  }
}
