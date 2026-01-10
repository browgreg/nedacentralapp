import '../../services/http_client.dart';

class AuthApi {
  static Future<Map<String, dynamic>> login({
    required int rego,
    required String pin,
  }) async {
    return await HttpClient.post(
      '/services/auth/login.php',
      body: {
        'rego': rego,
        'pin': pin,
      },
    );
  }

  static Future<void> changePin(String pin) async {
    await HttpClient.post(
      '/services/auth/change_pin.php',
      body: {'pin': pin},
    );
  }
}
