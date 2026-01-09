import 'package:get/get.dart';

import '../../model/player_summary.dart';

class PlayerDashboardController extends GetxController {
  final players = <PlayerSummary>[].obs;
  final isLoading = false.obs;

  @override
  void onInit() {
    super.onInit();
    loadPlayers();
  }

  void loadPlayers() {
    // TEMP – replace with API later
    players.assignAll([
      PlayerSummary(rego: 1001, name: 'Greg Brow', isCaptain: true),
      PlayerSummary(rego: 1002, name: 'Lucas Brow'),
      PlayerSummary(rego: 1003, name: 'Heather Brow'),
    ]);
  }
}
