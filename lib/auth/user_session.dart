import 'user_role.dart';

class UserSession {
  final int rego;
  final UserRole role;

  UserSession({
    required this.rego,
    required this.role,
  });

  factory UserSession.fromJson(Map<String, dynamic> json) {
    return UserSession(
      rego: json['rego'],
      role: UserRole.values.firstWhere(
        (r) => r.name == json['role'],
        orElse: () => UserRole.PLAYER,
      ),
    );
  }
}
