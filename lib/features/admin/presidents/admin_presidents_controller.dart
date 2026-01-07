import 'package:flutter/foundation.dart';
import 'package:get/get.dart';

import '../../../services/api/presidents_api.dart';

class AdminPresidentsController extends GetxController {
  final presidents = <PresidentDto>[].obs;
  final isLoading = false.obs;

  @override
  void onInit() {
    super.onInit();
    loadPresidents();
  }

  Future<void> loadPresidents() async {
    try {
      isLoading.value = true;

      final data = await PresidentsApi.fetchPresidents();
      presidents.assignAll(data);

      debugPrint('🟢 Admin Presidents loaded: ${data.length}');
    } catch (e) {
      debugPrint('🔴 Failed to load presidents: $e');
    } finally {
      isLoading.value = false;
    }
  }
}
