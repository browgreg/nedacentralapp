import 'package:neda_central/auth/user_role.dart';

class UserSession {
  final String token;
  final int rego;
  final UserRole role;
  final DateTime expiresAt;

  UserSession({
    required this.token,
    required this.rego,
    required this.role,
    required this.expiresAt,
  });

  factory UserSession.fromJson(Map<String, dynamic> json) {
    return UserSession(
      token: json['token'],
      rego: json['rego'],
      role: UserRole.values.firstWhere(
        (r) => r.name == json['role'],
        orElse: () => UserRole.PLAYER,
      ),
      expiresAt: DateTime.parse(json['expiresAt']),
    );
  }

  Map<String, dynamic> toJson() => {
        'token': token,
        'rego': rego,
        'role': role.name,
        'expiresAt': expiresAt.toIso8601String(),
      };
}
