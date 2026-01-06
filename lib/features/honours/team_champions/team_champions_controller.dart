import 'package:get/get.dart';

import 'team_champion_entry.dart';
import 'team_champion_service.dart';

class TeamChampionsController extends GetxController {
  final champions = <TeamChampionEntry>[].obs;
  final isLoading = true.obs;

  @override
  void onInit() {
    super.onInit();
    load();
  }

  Future<void> load() async {
    isLoading.value = true;
    champions.assignAll(await TeamChampionsService.fetch());
    isLoading.value = false;
  }
}
