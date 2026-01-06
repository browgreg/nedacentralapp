import 'package:get/get.dart';

import 'club_one_seventy_entry.dart';
import 'one_seventy_one_service.dart';

class ClubOneSeventyController extends GetxController {
  final entries = <ClubOneSeventyEntry>[].obs;
  final isLoading = true.obs;

  @override
  void onInit() {
    super.onInit();
    load();
  }

  Future<void> load() async {
    isLoading.value = true;
    entries.assignAll(await ClubOneSeventyService.fetch());
    isLoading.value = false;
  }
}
