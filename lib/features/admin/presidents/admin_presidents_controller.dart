import 'package:flutter/foundation.dart';
import 'package:get/get.dart';

import '../../../services/api/presidents_api.dart';
import 'admin_presidents_entry.dart';

class AdminPresidentsController extends GetxController {
  final presidents = <AdminPresidentEntry>[].obs;
  final isLoading = false.obs;

  @override
  void onInit() {
    super.onInit();
    loadPresidents();
  }

  Future<void> loadPresidents() async {
    try {
      isLoading.value = true;

      final List<PresidentDto> res = await PresidentsApi.fetchPresidents();

      presidents.assignAll(
        res.map(
          (p) => AdminPresidentEntry(
            id: p.id,
            name: p.name,
            startYear: p.startYear,
            endYear: p.endYear,
          ),
        ),
      );
      ever(presidents, (_) {
        debugPrint('🧪 Presidents RX updated: ${presidents.length}');
      });

      debugPrint('🟢 Admin presidents loaded: ${presidents.length}');
    } catch (e, s) {
      debugPrint('🔴 Failed to load presidents: $e');
      debugPrintStack(stackTrace: s);
    } finally {
      isLoading.value = false;
    }
  }
}
