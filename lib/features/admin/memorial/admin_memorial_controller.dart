import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:neda_central/features/honours/memorial/memorial_entry.dart';

import '../../../services/api/memorial_api.dart';
import 'admin_memorial_entry.dart';

class AdminMemorialController extends GetxController {
  final memorials = <AdminMemorialEntry>[].obs;
  final isLoading = false.obs;

  @override
  void onInit() {
    super.onInit();
    loadMemorials();
  }

  Future<void> loadMemorials() async {
    try {
      isLoading.value = true;

      final List<MemorialEntry> res = await MemorialApi.fetchMemorials();

      memorials.assignAll(
        res.map(
          (m) => AdminMemorialEntry(name: m.name),
        ),
      );

      debugPrint('🟢 Admin memorials loaded: ${memorials.length}');
    } catch (e, s) {
      debugPrint('🔴 Memorial load failed: $e');
      debugPrintStack(stackTrace: s);
    } finally {
      isLoading.value = false;
    }
  }
}
