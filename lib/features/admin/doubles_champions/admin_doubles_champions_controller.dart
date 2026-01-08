import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

import '../../../services/api/admin_doubles_champions_api.dart';
import 'admin_doubles_champions_entry.dart';

class AdminDoublesChampionsController extends GetxController {
  final champions = <AdminDoublesChampionEntry>[].obs;
  final isLoading = false.obs;

  @override
  void onInit() {
    super.onInit();
    load();
  }

  Future<void> load() async {
    isLoading.value = true;
    try {
      champions.assignAll(await AdminDoublesChampionsApi.fetch());
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> add(AdminDoublesChampionEntry entry) async {
    await AdminDoublesChampionsApi.create(entry);
    await load();
  }

  Future<void> updateExisting(
    AdminDoublesChampionEntry oldEntry,
    AdminDoublesChampionEntry updated,
  ) async {
    await AdminDoublesChampionsApi.update(
      updated.copyWith(id: oldEntry.id),
    );
    await load();
  }

  Future<void> remove(AdminDoublesChampionEntry entry) async {
    await AdminDoublesChampionsApi.delete(entry);
    champions.remove(entry);
  }
}
