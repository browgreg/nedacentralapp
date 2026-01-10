import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

import '../../../../services/api/admin_one_seventy_club_api.dart';
import '../model/admin_one_seventy_club_entry.dart';

class AdminOneSeventyClubsController extends GetxController {
  final champions = <AdminOneSeventyClubEntry>[].obs;
  final isLoading = false.obs;

  @override
  void onInit() {
    super.onInit();
    load();
  }

  Future<void> load() async {
    isLoading.value = true;
    try {
      champions.assignAll(await AdminOneSeventyClubApi.fetch());
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> add(AdminOneSeventyClubEntry entry) async {
    await AdminOneSeventyClubApi.create(entry);
    await load();
  }

  Future<void> updateExisting(
    AdminOneSeventyClubEntry oldEntry,
    AdminOneSeventyClubEntry updated,
  ) async {
    await AdminOneSeventyClubApi.update(
      updated.copyWith(id: oldEntry.id),
    );
    await load();
  }

  Future<void> remove(AdminOneSeventyClubEntry entry) async {
    await AdminOneSeventyClubApi.delete(entry);
    champions.remove(entry);
  }
}
