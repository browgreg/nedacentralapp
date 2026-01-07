import 'package:get/get.dart';

import 'team_champion_entry.dart';
import 'team_champions_service.dart';

class AdminTeamChampionsController extends GetxController {
  final entries = <TeamChampionEntry>[].obs;
  final isLoading = true.obs;

  @override
  void onInit() {
    super.onInit();
    load();
  }

  Future<void> load() async {
    isLoading.value = true;
    entries.assignAll(await TeamChampionsService.fetch());
    isLoading.value = false;
  }
}
