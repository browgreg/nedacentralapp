import 'package:get/get.dart';

import '../../../../services/api/member_lookup_api.dart';
import '../model/committee_member.dart';
import '../model/committee_role.dart';

class CommitteeController extends GetxController {
  final members = <CommitteeRole, CommitteeMember?>{}.obs;

  @override
  void onInit() {
    super.onInit();
    loadCommittee();
  }

  void loadCommittee() {
    members.assignAll({
      CommitteeRole.president:
          const CommitteeMember(rego: 1001, name: 'Greg Brow'),
      CommitteeRole.secretary:
          const CommitteeMember(rego: 1002, name: 'Lucas Brow'),
      CommitteeRole.treasurer: null,
      CommitteeRole.general: null,
    });
  }

  Future<String> lookupMemberName(int rego) async {
    return MemberLookupApi.lookupName(rego);
  }

  void assignMember(CommitteeRole role, CommitteeMember member) {
    members[role] = member;
    members.refresh();
  }

  void clearRole(CommitteeRole role) {
    members[role] = null;
    members.refresh();
  }
}
