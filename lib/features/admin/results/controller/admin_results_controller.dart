import 'package:get/get.dart';

import '../../../../auth/auth_controller.dart';
import '../../../../auth/user_role.dart';
import '../../../../services/api/admin_results_api.dart';
import '../model/result_entry.dart';

class AdminResultsController extends GetxController {
  final results = <ResultEntry>[].obs;
  final isLoading = false.obs;

  bool get canUnlock {
    final auth = Get.find<AuthController>();
    final role = auth.role;
    return role == UserRole.SUPER_ADMIN || role == UserRole.ADMIN;
  }

  @override
  void onInit() {
    super.onInit();
    reload();
  }

  Future<void> reload() async {
    try {
      isLoading.value = true;
      final data =
          await AdminResultsApi.list(); // must return List<ResultEntry>
      results.assignAll(data);
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> unlockFixture(int fixtureId) async {
    await AdminResultsApi.unlock(fixtureId);
    await reload();
  }
}
