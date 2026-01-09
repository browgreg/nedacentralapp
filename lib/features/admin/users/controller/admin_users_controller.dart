import 'package:get/get.dart';

import '../../../../auth/user_role.dart';
import '../../../../services/api/admin_users_api.dart';
import '../model/admin_users_entry.dart';

class AdminUsersController extends GetxController {
  final users = <AdminUserEntry>[].obs;
  final isLoading = false.obs;

  @override
  void onInit() {
    super.onInit();
    loadUsers();
  }

  Future<void> loadUsers() async {
    try {
      isLoading.value = true;
      users.value = await AdminUsersApi.fetchUsers();
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> updateRole(int userId, UserRole role) async {
    await AdminUsersApi.updateRole(userId, role);
    await loadUsers();
  }

  Future<void> toggleActive(int userId, bool active) async {
    await AdminUsersApi.setActive(userId, active);
    await loadUsers();
  }
}
