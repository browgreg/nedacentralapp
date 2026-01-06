import 'package:get/get.dart';

import 'hundred_one_eight_entry.dart';
import 'hundred_one_eighties_service.dart';

class HundredOneEightController extends GetxController {
  final entries = <HundredOneEightEntry>[].obs;

  @override
  void onInit() {
    super.onInit();
    _load();
  }

  Future<void> _load() async {
    final data = await HundredOneEightService.fetch();
    entries.assignAll(data);
  }
}
