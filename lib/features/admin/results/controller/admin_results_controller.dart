import 'package:get/get.dart';

import '../../../../services/api/admin_results_api.dart';
import '../../../../services/api/admin_results_list_api.dart';
import '../model/result_entry.dart';

class AdminResultsController extends GetxController {
  final results = <ResultEntry>[].obs;
  final isLoading = false.obs;

  @override
  void onInit() {
    super.onInit();
    fetch();
  }

  // ─────────────────────────
  // LOAD RESULTS LIST
  // ─────────────────────────
  Future<void> fetch() async {
    if (isLoading.value) return;

    try {
      isLoading.value = true;
      final data = await AdminResultsListApi.fetch();
      results.assignAll(data);
    } finally {
      isLoading.value = false;
    }
  }

  // ─────────────────────────
  // ADMIN UNLOCK (WITH REASON)
  // ─────────────────────────
  Future<void> unlock({
    required int fixtureId,
    required String reason,
  }) async {
    final trimmed = reason.trim();
    if (trimmed.isEmpty) {
      Get.snackbar('Required', 'Please provide a reason');
      return;
    }

    if (isLoading.value) return;

    try {
      isLoading.value = true;

      await AdminResultsApi.unlock(fixtureId);

      // refresh results after unlock
      final refreshed = await AdminResultsListApi.fetch();
      results.assignAll(refreshed);
    } catch (_) {
      Get.snackbar(
        'Error',
        'Unable to unlock fixture',
        snackPosition: SnackPosition.BOTTOM,
      );
    } finally {
      isLoading.value = false;
    }
  }
}
