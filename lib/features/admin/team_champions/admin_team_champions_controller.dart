import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

import '../../../services/api/admin_team_champions_api.dart';
import 'admin_team_champions_entry.dart';

class AdminTeamChampionsController extends GetxController {
  final champions = <AdminTeamChampionEntry>[].obs;
  final isLoading = false.obs;

  Future<void> load() async {
    isLoading.value = true;
    champions.assignAll(
      await AdminTeamChampionsApi.fetch(),
    );
    isLoading.value = false;
  }

  Future<void> add(AdminTeamChampionEntry entry) async {
    champions.add(entry);
    await AdminTeamChampionsApi.create(entry);
  }

  Future<void> updateEntry(
    int index,
    AdminTeamChampionEntry entry,
  ) async {
    champions[index] = entry;
    await AdminTeamChampionsApi.update(entry);
  }

  Future<void> remove(AdminTeamChampionEntry entry) async {
    champions.remove(entry);
    await AdminTeamChampionsApi.delete(entry);
  }
}
