import 'package:get/get.dart';

import 'singles_champion_entry.dart';
import 'singles_champions_service.dart';

class AdminSinglesChampionsController extends GetxController {
  final entries = <SinglesChampionEntry>[].obs;
  final isLoading = true.obs;

  @override
  void onInit() {
    super.onInit();
    load();
  }

  Future<void> load() async {
    isLoading.value = true;
    entries.assignAll(await SinglesChampionsService.fetch());
    isLoading.value = false;
  }
}
