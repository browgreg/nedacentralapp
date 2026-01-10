import 'package:get/get.dart';

import '../../../../services/api/captain_results_api.dart';

class CaptainResultsController extends GetxController {
  final home = RxnInt();
  final away = RxnInt();

  final isLocked = false.obs;
  final isSaving = false.obs;
  final isLoading = false.obs;

  late int fixtureId;

  /// Load existing result + lock state
  Future<void> load(int fixtureId) async {
    this.fixtureId = fixtureId;

    try {
      isLoading.value = true;

      final res = await CaptainResultsApi.fetch(fixtureId);

      home.value = res['home_score'];
      away.value = res['away_score'];
      isLocked.value = res['locked'] == true;
    } finally {
      isLoading.value = false;
    }
  }

  /// Save results
  Future<void> save() async {
    if (isSaving.value) return;
    if (home.value == null || away.value == null) return;

    isSaving.value = true;
    try {
      await CaptainResultsApi.save(
        fixtureId: fixtureId,
        homeScore: home.value!,
        awayScore: away.value!,
      );

      Get.snackbar('Saved', 'Results submitted');
    } finally {
      isSaving.value = false;
    }
  }
}
