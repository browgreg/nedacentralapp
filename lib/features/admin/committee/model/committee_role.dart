enum CommitteeRole {
  president,
  vicePresident,
  secretary,
  treasurer,
  matchSecretary,
  publicOfficer,
  fundraising,
  general
}

extension CommitteeRoleX on CommitteeRole {
  String get label {
    switch (this) {
      case CommitteeRole.president:
        return 'President';
      case CommitteeRole.vicePresident:
        return 'Vice President';
      case CommitteeRole.secretary:
        return 'Secretary';
      case CommitteeRole.treasurer:
        return 'Treasurer';
      case CommitteeRole.matchSecretary:
        return 'Match Secretary';
      case CommitteeRole.publicOfficer:
        return 'Public Officer';
      case CommitteeRole.fundraising:
        return 'Fundraising';
      case CommitteeRole.general:
        return 'General Committee';
    }
  }
}
