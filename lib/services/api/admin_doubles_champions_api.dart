import '../../features/admin/doubles_champions/admin_doubles_champions_entry.dart';
import '../http_client.dart';

class AdminDoublesChampionsApi {
  static Future<List<AdminDoublesChampionEntry>> fetch() async {
    final res = await HttpClient.get(
        '/services/admin/doubles_champions/doubles_champions.php');

    if (res == null || res is! List) return [];

    return res
        .map((e) => AdminDoublesChampionEntry.fromJson(
              Map<String, dynamic>.from(e),
            ))
        .toList();
  }

  static Future<void> create(AdminDoublesChampionEntry entry) async {
    await HttpClient.post(
      '/services/admin/doubles_champions/doubles_champions_create.php',
      body: entry.toJson(),
    );
  }

  static Future<void> update(AdminDoublesChampionEntry entry) async {
    await HttpClient.post(
      '/services/admin/doubles_champions/doubles_champions_update.php',
      body: entry.toJson(),
    );
  }

  static Future<void> delete(AdminDoublesChampionEntry entry) async {
    await HttpClient.post(
      '/services/admin/doubles_champions/doubles_champions_delete.php',
      body: {'id': entry.id},
    );
  }
}
