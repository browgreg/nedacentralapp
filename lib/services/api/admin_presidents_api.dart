import '../../features/admin/presidents/model/admin_presidents_entry.dart';
import '../http_client.dart';

class AdminPresidentsApi {
  static Future<List<AdminPresidentEntry>> fetch() async {
    final res =
        await HttpClient.get('/services/admin/presidents/presidents.php');

    if (res == null || res is! List) return [];

    return res
        .map((e) => AdminPresidentEntry.fromJson(Map<String, dynamic>.from(e)))
        .toList();
  }

  static Future<void> create(AdminPresidentEntry entry) async {
    await HttpClient.post(
      '/services/admin/presidents/president_create.php',
      body: entry.toJson(),
    );
  }

  static Future<void> update(AdminPresidentEntry entry) async {
    if (entry.id == null) {
      throw Exception('Cannot update without ID');
    }

    await HttpClient.post(
      '/services/admin/presidents/president_update.php',
      body: entry.toJson(),
    );
  }

  static Future<void> delete(AdminPresidentEntry entry) async {
    if (entry.id == null) {
      throw Exception('Cannot delete without ID');
    }

    await HttpClient.post(
      '/services/admin/presidents/president_delete.php',
      body: {'id': entry.id},
    );
  }
}
