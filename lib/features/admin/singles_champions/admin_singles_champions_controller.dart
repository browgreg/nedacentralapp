import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

import '../../../services/api/admin_singles_champions_api.dart';
import '../../../services/http_client.dart';
import 'admin_singles_champions_entry.dart';

class AdminSinglesChampionsController extends GetxController {
  final champions = <AdminSinglesChampionEntry>[].obs;
  final isLoading = false.obs;

  @override
  void onInit() {
    super.onInit();
    load();
  }

  Future<void> load() async {
    isLoading.value = true;
    try {
      champions.assignAll(await AdminSinglesChampionsApi.fetch());
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> add(AdminSinglesChampionEntry entry) async {
    await AdminSinglesChampionsApi.create(entry);
    await load();
  }

  Future<void> updateExisting(
    AdminSinglesChampionEntry oldEntry,
    AdminSinglesChampionEntry updated,
  ) async {
    await AdminSinglesChampionsApi.update(
      updated.copyWith(id: oldEntry.id),
    );
    await load();
  }

  Future<void> remove(AdminSinglesChampionEntry entry) async {
    await AdminSinglesChampionsApi.delete(entry);
    champions.remove(entry);
  }

  /// 🔍 Lookup member name by rego (shared admin lookup)
  Future<String> lookupMemberName(int rego) async {
    final res = await HttpClient.post(
      '/services/admin/member_lookup.php',
      body: {'rego': rego},
    );

    if (res == null || res['name'] == null) {
      throw Exception('Member not found');
    }

    return res['name'].toString();
  }
}
