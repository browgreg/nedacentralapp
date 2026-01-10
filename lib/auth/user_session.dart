import 'package:neda_central/auth/user_role.dart';

class UserSession {
  final String token;
  final int rego;
  final UserRole role;
  final bool mustChangePin;
  final DateTime expiresAt;

  UserSession({
    required this.token,
    required this.rego,
    required this.role,
    required this.mustChangePin,
    required this.expiresAt,
  });

  factory UserSession.fromJson(Map<String, dynamic> json) {
    return UserSession(
      token: json['token'],
      rego: json['rego'],
      role: UserRole.fromName(json['role']),
      mustChangePin: json['must_change_pin'] == 1,
      expiresAt: DateTime.parse(json['expires_at']),
    );
  }

  Map<String, dynamic> toJson() => {
        'token': token,
        'rego': rego,
        'role': role.name,
        'must_change_pin': mustChangePin ? 1 : 0,
        'expires_at': expiresAt.toIso8601String(),
      };

  UserSession copyWith({bool? mustChangePin}) {
    return UserSession(
      token: token,
      rego: rego,
      role: role,
      mustChangePin: mustChangePin ?? this.mustChangePin,
      expiresAt: expiresAt,
    );
  }
}
