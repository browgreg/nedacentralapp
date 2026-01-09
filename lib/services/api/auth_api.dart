import '../http_client.dart';

class AuthApi {
  static Future<Map<String, dynamic>> login({
    required int rego,
    required String pin,
  }) async {
    return await HttpClient.post(
      '/auth/login.php',
      body: {
        'rego': rego,
        'pin': pin,
      },
    );
  }
}
