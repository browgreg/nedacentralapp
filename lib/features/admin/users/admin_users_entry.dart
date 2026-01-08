enum UserRole {
  superAdmin,
  admin,
  committee,
  captain,
  player,
}

class AdminUserEntry {
  final int id;
  final int rego;
  final UserRole role;
  final bool isActive;
  final String? displayName;

  AdminUserEntry({
    required this.id,
    required this.rego,
    required this.role,
    required this.isActive,
    this.displayName,
  });

  factory AdminUserEntry.fromJson(Map<String, dynamic> json) {
    return AdminUserEntry(
      id: json['id'],
      rego: json['rego'],
      role: UserRole.values.firstWhere(
        (r) => r.name.toUpperCase() == json['role'],
      ),
      isActive: json['is_active'] == 1,
      displayName: json['name'],
    );
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'rego': rego,
        'role': role.name.toUpperCase(),
        'is_active': isActive ? 1 : 0,
      };
}
