import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:neda_central/features/honours/presidents/president_entry.dart';

import 'presidents_service.dart';

class PresidentsController extends GetxController {
  final presidents = <PresidentsEntry>[].obs;
  final isLoading = true.obs;

  @override
  void onInit() {
    super.onInit();
    _load();
  }

  Future<void> _load() async {
    final dtos = await PresidentsService.fetch();

    presidents.assignAll(
      dtos.map(
        (p) => PresidentsEntry(
          name: p.name,
          term: p.term,
        ),
      ),
    );

    isLoading.value = false;
    if (kDebugMode) {
      print('🟢 Presidents loaded: ${presidents.length}');
    }
  }
}
