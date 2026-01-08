import '../../features/admin/users/admin_users_entry.dart';
import '../http_client.dart';

class AdminUsersApi {
  static Future<List<AdminUserEntry>> fetch() async {
    final res = await HttpClient.get('/services/admin/users/users_list.php');
    if (res is! List) return [];
    return res.map((e) => AdminUserEntry.fromJson(e)).toList();
  }

  static Future<void> create({
    required int rego,
    required UserRole role,
  }) async {
    await HttpClient.post(
      '/services/admin/users/users_create.php',
      body: {
        'rego': rego,
        'role': role.name.toUpperCase(),
      },
    );
  }

  static Future<void> updateRole(int id, UserRole role) async {
    await HttpClient.post(
      '/services/admin/users/users_update.php',
      body: {
        'id': id,
        'role': role.name.toUpperCase(),
      },
    );
  }

  static Future<void> toggleActive(int id) async {
    await HttpClient.post(
      '/services/admin/users/users_toggle_active.php',
      body: {'id': id},
    );
  }
}
