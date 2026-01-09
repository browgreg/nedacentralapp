enum UserRole {
  SUPER_ADMIN,
  ADMIN,
  COMMITTEE,
  CAPTAIN,
  PLAYER,
}

extension UserRoleX on UserRole {
  static UserRole fromString(String value) {
    return UserRole.values.firstWhere(
      (r) => r.name == value,
      orElse: () => UserRole.PLAYER,
    );
  }

  bool get isAdmin => this == UserRole.SUPER_ADMIN || this == UserRole.ADMIN;

  bool get isCommittee => isAdmin || this == UserRole.COMMITTEE;
}
