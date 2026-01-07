import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:neda_central/features/admin/team_champions/team_champion_dto.dart';

import '../../../services/api/team_champions_api.dart';
import 'admin_team_champion_entry.dart';

class AdminTeamChampionsController extends GetxController {
  final champions = <AdminTeamChampionEntry>[].obs;
  final isLoading = false.obs;

  @override
  void onInit() {
    super.onInit();
    loadChampions();
  }

  Future<void> loadChampions() async {
    try {
      isLoading.value = true;

      final List<TeamChampionDto> res = await TeamChampionsApi.fetchChampions();

      champions.assignAll(
        res.map(
          (c) => AdminTeamChampionEntry(
            year: c.year,
            season: c.season,
            division: c.division,
            champion: c.champion,
            runnerUp: c.runnerUp,
          ),
        ),
      );

      debugPrint('🟢 Team champions loaded: ${champions.length}');
    } catch (e, s) {
      debugPrint('🔴 Team champions load failed: $e');
      debugPrintStack(stackTrace: s);
    } finally {
      isLoading.value = false;
    }
  }
}
