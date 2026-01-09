import 'package:get/get.dart';

import '../../model/captain_team.dart';

class CaptainDashboardController extends GetxController {
  final teams = <CaptainTeam>[].obs;
  final isLoading = false.obs;

  @override
  void onInit() {
    super.onInit();
    loadTeams();
  }

  void loadTeams() {
    // TEMP – replace with API later
    teams.assignAll([
      CaptainTeam(
        id: 1,
        name: 'NEDA A',
        venue: 'City Darts Club',
        isHome: true,
        squad: [],
      ),
      CaptainTeam(
        id: 2,
        name: 'NEDA B',
        venue: 'Northside Hotel',
        squad: [],
      ),
    ]);
  }
}
