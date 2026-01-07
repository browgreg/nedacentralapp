import 'package:get/get.dart';
import 'package:neda_central/features/honours/team_champions/teams_champion_entry.dart';

import 'teams_champions_mapper.dart';
import 'teams_champions_service.dart';

class TeamsChampionsController extends GetxController {
  final champions = <TeamChampionEntry>[].obs;
  final isLoading = true.obs;

  @override
  void onInit() {
    super.onInit();
    loadChampions();
  }

  Future<void> loadChampions() async {
    isLoading.value = true;

    final raw = await TeamsChampionsService.fetch();

    champions.assignAll(
      raw.map(
        (e) => TeamsChampionsMapper.fromJson(
          Map<String, dynamic>.from(e),
        ),
      ),
    );

    isLoading.value = false;
  }
}
