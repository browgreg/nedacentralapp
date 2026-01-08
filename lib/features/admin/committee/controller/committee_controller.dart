import 'package:get/get.dart';

import '../model/committee_role.dart';

class CommitteeController extends GetxController {
  final members = <CommitteeRole, String?>{}.obs;

  @override
  void onInit() {
    super.onInit();
    loadCommittee();
  }

  void loadCommittee() {
    // TEMP – replace with API
    members.assignAll({
      CommitteeRole.president: 'Greg Brow',
      CommitteeRole.secretary: 'Lucas Brow',
      CommitteeRole.treasurer: null,
      CommitteeRole.general: 'Multiple',
    });
  }

  void assignMember(CommitteeRole role, String name) {
    members[role] = name;
    members.refresh();
  }
}
