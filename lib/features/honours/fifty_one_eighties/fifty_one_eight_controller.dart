import 'package:get/get.dart';

import 'fifty_one_eight_entry.dart';
import 'fifty_one_eight_service.dart';

class FiftyOneEightController extends GetxController {
  final entries = <FiftyOneEightEntry>[].obs;

  @override
  void onInit() {
    super.onInit();
    _load();
  }

  Future<void> _load() async {
    final data = await FiftyOneEightService.fetch();
    entries.assignAll(data);
  }
}
