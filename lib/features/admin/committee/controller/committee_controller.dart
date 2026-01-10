import 'package:get/get.dart';

import '../../../../auth/auth_controller.dart';
import '../../../../services/api/member_lookup_api.dart';
import '../../../../services/api/committee_api.dart';
import '../dashboard/committee_permission.dart';
import '../model/committee_member.dart';
import '../model/committee_role.dart';
import '../permissions/committee_permissions_map.dart';

class CommitteeController extends GetxController {
  final members = <CommitteeRole, CommitteeMember?>{}.obs;
  final isLoading = false.obs;

  @override
  void onInit() {
    super.onInit();
    loadCommittee();
  }

  // ─────────────────────────
  // LOAD COMMITTEE FROM API
  // ─────────────────────────
  Future<void> loadCommittee() async {
    try {
      isLoading.value = true;
      final data = await CommitteeApi.fetch();
      members.assignAll(data);
    } finally {
      isLoading.value = false;
    }
  }

  // ─────────────────────────
  // MEMBER LOOKUP
  // ─────────────────────────
  Future<String> lookupMemberName(int rego) async {
    return MemberLookupApi.lookupName(rego);
  }

  // ─────────────────────────
  // ASSIGN ROLE (OPTIMISTIC)
  // ─────────────────────────
  Future<void> assignMember(
    CommitteeRole role,
    CommitteeMember member,
  ) async {
    members[role] = member;
    members.refresh();

    try {
      await CommitteeApi.assign(role, member.rego);
    } catch (_) {
      await loadCommittee(); // rollback
      rethrow;
    }
  }

  // ─────────────────────────
  // CLEAR ROLE
  // ─────────────────────────
  Future<void> clearRole(CommitteeRole role) async {
    members[role] = null;
    members.refresh();

    try {
      await CommitteeApi.clear(role);
    } catch (_) {
      await loadCommittee(); // rollback
      rethrow;
    }
  }

  // ─────────────────────────
  // CURRENT USER COMMITTEE ROLE (COMPUTED)
  // ─────────────────────────
  CommitteeRole? get currentCommitteeRole {
    final auth = Get.find<AuthController>();
    final rego = auth.session?.rego;
    if (rego == null) return null;

    for (final entry in members.entries) {
      if (entry.value?.rego == rego) {
        return entry.key;
      }
    }
    return null;
  }

  // ─────────────────────────
  // PERMISSION CHECK
  // ─────────────────────────
  bool hasPermission(CommitteePermission permission) {
    final role = currentCommitteeRole;
    if (role == null) return false;

    return committeePermissions[role]?.contains(permission) ?? false;
  }
}
