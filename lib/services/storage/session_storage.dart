import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class SessionStorage {
  static final _storage = FlutterSecureStorage();

  static Future<void> save(Map<String, String> data) async {
    for (final e in data.entries) {
      await _storage.write(key: e.key, value: e.value);
    }
  }

  static Future<String?> read(String key) {
    return _storage.read(key: key);
  }

  static Future<void> clear() {
    return _storage.deleteAll();
  }
}
