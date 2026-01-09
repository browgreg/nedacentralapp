import '../../../../auth/user_role.dart';
import '../../../../services/http_client.dart';
import '../../features/admin/users/model/admin_users_entry.dart';

class AdminUsersApi {
  static Future<List<AdminUserEntry>> fetchUsers() async {
    final res = await HttpClient.get('/services/admin/users/list.php');
    return (res as List).map((e) => AdminUserEntry.fromJson(e)).toList();
  }

  static Future<void> updateRole(int id, UserRole role) async {
    await HttpClient.post(
      '/services/admin/users/update_role.php',
      body: {
        'id': id,
        'role': role.name,
      },
    );
  }

  static Future<void> setActive(int id, bool active) async {
    await HttpClient.post(
      '/services/admin/users/set_active.php',
      body: {
        'id': id,
        'is_active': active ? 1 : 0,
      },
    );
  }
}
