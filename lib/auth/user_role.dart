enum UserRole {
  SUPER_ADMIN,
  ADMIN,
  COMMITTEE,
  CAPTAIN,
  PLAYER;

  static UserRole? fromString(String? v) {
    if (v == null) return null;
    return UserRole.values.firstWhere(
      (e) => e.name == v,
      orElse: () => UserRole.PLAYER,
    );
  }
}
