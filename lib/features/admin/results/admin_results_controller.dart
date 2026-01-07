import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:neda_central/features/admin/results/result_entry.dart';
import 'package:neda_central/features/admin/results/results_service.dart';

class AdminResultsController extends GetxController {
  final RxList<ResultEntry> results = <ResultEntry>[].obs;
  final RxBool isLoading = true.obs;

  @override
  void onInit() {
    super.onInit();
    loadResults();
  }

  Future<void> loadResults() async {
    try {
      isLoading.value = true;

      final fetched = await ResultsService.fetch();

      results.assignAll(fetched); // ← LINE 17 (this is correct)
    } catch (e) {
      results.clear();
      debugPrint('❌ Results load failed: $e');
    } finally {
      isLoading.value = false;
    }
  }
}
