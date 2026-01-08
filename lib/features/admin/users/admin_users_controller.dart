import 'package:get/get.dart';

import '../../../services/api/admin_users_api.dart';
import 'admin_users_entry.dart';

class AdminUsersController extends GetxController {
  final users = <AdminUserEntry>[].obs;
  final isLoading = false.obs;

  @override
  void onInit() {
    super.onInit();
    load();
  }

  Future<void> load() async {
    isLoading.value = true;
    users.assignAll(await AdminUsersApi.fetch());
    isLoading.value = false;
  }

  Future<void> add(int rego, UserRole role) async {
    await AdminUsersApi.create(rego: rego, role: role);
    await load();
  }

  Future<void> updateRole(AdminUserEntry user, UserRole role) async {
    await AdminUsersApi.updateRole(user.id, role);
    await load();
  }

  Future<void> toggle(AdminUserEntry user) async {
    await AdminUsersApi.toggleActive(user.id);
    await load();
  }
}
