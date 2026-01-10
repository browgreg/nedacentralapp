import '../dashboard/committee_permission.dart';
import '../model/committee_role.dart';

const committeePermissions = {
  CommitteeRole.president: {
    CommitteePermission.manageCommittee,
    CommitteePermission.publishContent,
    CommitteePermission.lockTeams,
    CommitteePermission.enterResults,
  },
  CommitteeRole.secretary: {
    CommitteePermission.publishContent,
    CommitteePermission.manageNoticeboard,
  },
  CommitteeRole.treasurer: {
    CommitteePermission.viewFinancials,
  },
  CommitteeRole.matchSecretary: {
    CommitteePermission.lockTeams,
    CommitteePermission.enterResults,
  },
  CommitteeRole.general: {
    CommitteePermission.viewCommittee,
  },
};
