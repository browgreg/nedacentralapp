import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

import '../../../../services/api/admin_presidents_api.dart';
import '../../../../services/http_client.dart';
import '../model/admin_presidents_entry.dart';

class AdminPresidentsController extends GetxController {
  final presidents = <AdminPresidentEntry>[].obs;
  final isLoading = false.obs;

  @override
  void onInit() {
    super.onInit();
    load();
  }

  Future<void> load() async {
    isLoading.value = true;
    presidents.assignAll(await AdminPresidentsApi.fetch());
    isLoading.value = false;
  }

  Future<void> add(AdminPresidentEntry entry) async {
    await AdminPresidentsApi.create(entry);
    await load();
  }

  Future<void> updateExisting(
    AdminPresidentEntry oldEntry,
    AdminPresidentEntry updated,
  ) async {
    await AdminPresidentsApi.update(
      updated.copyWith(id: oldEntry.id),
    );
    await load();
  }

  Future<void> remove(AdminPresidentEntry entry) async {
    await AdminPresidentsApi.delete(entry);
    presidents.remove(entry);
  }

  /// Used by Add form lookup
  Future<String> lookupMemberName(int rego) async {
    final res = await HttpClient.post(
      '/services/admin/member_lookup.php',
      body: {'rego': rego},
    );

    return res['name'].toString();
  }
}
