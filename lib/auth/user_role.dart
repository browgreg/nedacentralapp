enum UserRole {
  SUPER_ADMIN,
  ADMIN,
  COMMITTEE,
  CAPTAIN,
  PLAYER;

  /// Convert API string → enum
  static UserRole fromName(String value) {
    return UserRole.values.firstWhere(
      (r) => r.name == value,
      orElse: () {
        throw Exception('Unknown UserRole: $value');
      },
    );
  }
}
