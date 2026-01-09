import '../dashboard/committee_permission.dart';
import '../model/committee_role.dart';

const Map<CommitteeRole, Set<CommitteePermission>> committeePermissions = {
  CommitteeRole.president: {
    CommitteePermission.manageCommittee,
    CommitteePermission.manageUsers,
    CommitteePermission.manageLeague,
    CommitteePermission.manageWebsite,
    CommitteePermission.manageFinances,
  },
  CommitteeRole.secretary: {
    CommitteePermission.manageCommittee,
    CommitteePermission.manageWebsite,
  },
  CommitteeRole.treasurer: {
    CommitteePermission.manageFinances,
  },
  CommitteeRole.matchSecretary: {
    CommitteePermission.manageLeague,
    CommitteePermission.publishResults,
  },
  CommitteeRole.general: {
    CommitteePermission.manageWebsite,
  },
};
