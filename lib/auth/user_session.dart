import 'user_role.dart';

class UserSession {
  final int rego;
  UserRole? role;
  final String token;
  final DateTime expiresAt;

  UserSession({
    required this.rego,
    required this.role,
    required this.token,
    required this.expiresAt,
  });

  factory UserSession.fromJson(Map<String, dynamic> json) {
    return UserSession(
      rego: json['rego'],
      role: UserRole.fromString(json['role']),
      token: json['token'],
      expiresAt: DateTime.parse(json['expiresAt']),
    );
  }
}
