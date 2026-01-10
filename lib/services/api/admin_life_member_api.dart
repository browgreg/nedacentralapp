import '../../features/admin/life_members/model/admin_life_member_entry.dart';
import '../http_client.dart';

class AdminLifeMembersApi {
  static Future<List<AdminLifeMemberEntry>> fetch() async {
    final res =
        await HttpClient.get('/services/admin/life_members/life_members.php');

    if (res == null || res is! List) return [];

    return res
        .map((e) => AdminLifeMemberEntry.fromJson(Map<String, dynamic>.from(e)))
        .toList();
  }

  static Future<void> update(AdminLifeMemberEntry entry) async {
    if (entry.id == null) {
      throw Exception('Cannot update without ID');
    }

    await HttpClient.post(
      '/services/admin/life_members/life_members_update.php',
      body: entry.toJson(),
    );
  }

  static Future<void> create({
    required int rego,
    required int inductionYear,
  }) async {
    await HttpClient.post(
      '/services/admin/life_members_create.php',
      body: {
        'rego': rego,
        'inductionYear': inductionYear,
      },
    );
  }

  static Future<void> delete(AdminLifeMemberEntry entry) async {
    if (entry.id == null) {
      throw Exception('Cannot delete without ID');
    }

    await HttpClient.post(
      '/services/admin/life_members/life_members_delete.php',
      body: {'id': entry.id},
    );
  }
}
