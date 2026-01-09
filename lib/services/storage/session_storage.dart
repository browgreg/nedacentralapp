import 'dart:convert';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import '../../auth/user_session.dart';

class SessionStorage {
  static const _storage = FlutterSecureStorage();
  static const _key = 'user_session';

  static Future<void> write(UserSession session) async {
    await _storage.write(
      key: _key,
      value: jsonEncode(session.toJson()),
    );
  }

  static Future<UserSession?> read() async {
    final raw = await _storage.read(key: _key);
    if (raw == null) return null;

    return UserSession.fromJson(jsonDecode(raw));
  }

  static Future<void> clear() async {
    await _storage.delete(key: _key);
  }
}
