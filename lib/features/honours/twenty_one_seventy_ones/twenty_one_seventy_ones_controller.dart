import 'package:get/get.dart';

import 'twenty_one_seventy_one_entry.dart';
import 'twenty_one_seventy_ones_service.dart';

class TwentyOneSeventyOnesController extends GetxController {
  final entries = <TwentyOneSeventyOneEntry>[].obs;
  final isLoading = true.obs;

  @override
  void onInit() {
    super.onInit();
    load();
  }

  Future<void> load() async {
    isLoading.value = true;
    entries.assignAll(await TwentyOneSeventyOnesService.fetch());
    isLoading.value = false;
  }
}
