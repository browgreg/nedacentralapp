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

  Future<void> addUser(int rego, UserRole role, String pin) async {
    isLoading.value = true;
    try {
      await AdminUsersApi.create(
        rego: rego,
        role: role,
        pin: pin,
      );
      await loadUsers();
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> updateRole(int userId, UserRole role) async {
    await AdminUsersApi.updateRole(userId, role);
    await loadUsers();
  }

  Future<void> resetPin(int userId, String pin) async {
    await AdminUsersApi.resetPin(userId, pin);
  }

  Future<void> toggleActive(int userId, bool active) async {
    await AdminUsersApi.setActive(userId, active);
    await loadUsers();
  }
}
