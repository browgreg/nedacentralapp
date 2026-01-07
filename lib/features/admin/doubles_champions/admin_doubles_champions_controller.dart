import 'package:get/get.dart';

import 'doubles_champion_entry.dart';
import 'doubles_champions_service.dart';

class AdminDoublesChampionsController extends GetxController {
  final entries = <DoublesChampionEntry>[].obs;
  final isLoading = true.obs;

  @override
  void onInit() {
    super.onInit();
    load();
  }

  Future<void> load() async {
    isLoading.value = true;
    entries.assignAll(await DoublesChampionsService.fetch());
    isLoading.value = false;
  }
}
