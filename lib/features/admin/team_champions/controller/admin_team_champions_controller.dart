import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

import '../../../../services/api/admin_team_champions_api.dart';
import '../model/admin_team_champions_entry.dart';

class AdminTeamChampionsController extends GetxController {
  final champions = <AdminTeamChampionEntry>[].obs;
  final isLoading = false.obs;

  @override
  void onInit() {
    super.onInit();
    load();
  }

  Future<void> load() async {
    isLoading.value = true;
    try {
      champions.assignAll(await AdminTeamChampionsApi.fetch());
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> add(AdminTeamChampionEntry entry) async {
    await AdminTeamChampionsApi.create(entry);
    await load();
  }

  Future<void> updateExisting(
    AdminTeamChampionEntry oldEntry,
    AdminTeamChampionEntry updated,
  ) async {
    await AdminTeamChampionsApi.update(
      updated.copyWith(id: oldEntry.id),
    );
    await load();
  }

  Future<void> remove(AdminTeamChampionEntry entry) async {
    await AdminTeamChampionsApi.delete(entry);
    champions.remove(entry);
  }
}
