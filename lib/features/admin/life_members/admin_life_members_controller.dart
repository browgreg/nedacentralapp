import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

import '../../../services/api/admin_life_member_api.dart';
import '../../../services/http_client.dart';
import 'admin_life_member_entry.dart';

class AdminLifeMembersController extends GetxController {
  final lifeMembers = <AdminLifeMemberEntry>[].obs;
  final isLoading = false.obs;

  @override
  void onInit() {
    super.onInit();
    load();
  }

  Future<void> load() async {
    isLoading.value = true;
    try {
      lifeMembers.assignAll(await AdminLifeMembersApi.fetch());
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> addLifeMember({
    required int rego,
    required int inductionYear,
  }) async {
    await AdminLifeMembersApi.create(
      rego: rego,
      inductionYear: inductionYear,
    );
    await load();
  }

  Future<void> add(AdminLifeMemberEntry entry) async {
    await AdminLifeMembersApi.create(
      rego: entry.rego,
      inductionYear: entry.inductionYear,
    );
    await load();
  }

  Future<void> updateExisting(
    AdminLifeMemberEntry oldEntry,
    AdminLifeMemberEntry updated,
  ) async {
    await AdminLifeMembersApi.update(
      updated.copyWith(id: oldEntry.id),
    );
    await load();
  }

  Future<void> remove(AdminLifeMemberEntry entry) async {
    await AdminLifeMembersApi.delete(entry);
    lifeMembers.remove(entry);
  }

  /// 🔎 Rego lookup (shared logic!)
  Future<String> lookupMemberName(int rego) async {
    final res = await HttpClient.post(
      '/services/admin/member_lookup.php',
      body: {'rego': rego},
    );

    return res['name'].toString();
  }
}
