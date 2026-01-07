import 'package:get/get.dart';
import 'package:neda_central/features/admin/singles_champions/singles_champion_entry.dart';

import '../../../services/api/admin_singles_champions_api.dart';

class AdminSinglesChampionsController extends GetxController {
  final champions = <AdminSinglesChampionEntry>[].obs;
  final isLoading = false.obs;

  @override
  void onInit() {
    super.onInit();
    load();
  }

  /// 🔹 Load all singles champions
  Future<void> load() async {
    try {
      isLoading.value = true;
      final data = await AdminSinglesChampionsApi.fetch();
      champions.assignAll(data);
    } finally {
      isLoading.value = false;
    }
  }

  /// 🔹 Add new entry
  Future<void> add(AdminSinglesChampionEntry entry) async {
    await AdminSinglesChampionsApi.create(entry);
    await load();
  }

  /// 🔹 Update existing entry
  Future<void> updateExisting(
    AdminSinglesChampionEntry oldEntry,
    AdminSinglesChampionEntry updated,
  ) async {
    if (oldEntry.id == null) {
      throw Exception('Cannot update entry without ID');
    }

    await AdminSinglesChampionsApi.update(
      updated.copyWith(id: oldEntry.id),
    );

    await load();
  }

  /// 🔹 Delete entry
  Future<void> remove(AdminSinglesChampionEntry entry) async {
    if (entry.id == null) {
      throw Exception('Cannot delete entry without ID');
    }

    await AdminSinglesChampionsApi.delete(entry);
    champions.remove(entry);
  }
}
