enum CommitteeRole {
  president,
  vicePresident,
  secretary,
  treasurer,
  matchSecretary,
  publicOfficer,
  general,
  fundraising,
}

extension CommitteeRoleX on CommitteeRole {
  /// UI label
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
      case CommitteeRole.general:
        return 'General Committee';
      case CommitteeRole.fundraising:
        return 'Fundraising';
    }
  }

  /// ✅ BACKEND / DB VALUE
  String get apiName {
    switch (this) {
      case CommitteeRole.president:
        return 'PRESIDENT';
      case CommitteeRole.vicePresident:
        return 'VICE_PRESIDENT';
      case CommitteeRole.secretary:
        return 'SECRETARY';
      case CommitteeRole.treasurer:
        return 'TREASURER';
      case CommitteeRole.matchSecretary:
        return 'MATCH_SECRETARY';
      case CommitteeRole.publicOfficer:
        return 'PUBLIC_OFFICER';
      case CommitteeRole.general:
        return 'GENERAL';
      case CommitteeRole.fundraising:
        return 'FUNDRAISING';
    }
  }

  /// ✅ STRING → ENUM
  static CommitteeRole fromName(String value) {
    return CommitteeRole.values.firstWhere(
      (r) => r.apiName == value,
      orElse: () => throw Exception('Unknown CommitteeRole: $value'),
    );
  }
}
