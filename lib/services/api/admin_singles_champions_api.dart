import '../../features/admin/singles_champions/model/admin_singles_champions_entry.dart';
import '../http_client.dart';

class AdminSinglesChampionsApi {
  static Future<List<AdminSinglesChampionEntry>> fetch() async {
    final res = await HttpClient.get(
        '/services/admin/singles_champions/singles_champions.php');

    if (res == null || res is! List) return [];

    return res
        .map((e) => AdminSinglesChampionEntry.fromJson(
              Map<String, dynamic>.from(e),
            ))
        .toList();
  }

  static Future<void> create(AdminSinglesChampionEntry entry) async {
    await HttpClient.post(
      '/services/admin/singles_champions/singles_champions_create.php',
      body: entry.toJson(),
    );
  }

  static Future<void> update(AdminSinglesChampionEntry entry) async {
    await HttpClient.post(
      '/services/admin/singles_champions/singles_champions_update.php',
      body: entry.toJson(),
    );
  }

  static Future<void> delete(AdminSinglesChampionEntry entry) async {
    await HttpClient.post(
      '/services/admin/singles_champions/singles_champions_delete.php',
      body: {'id': entry.id},
    );
  }
}
