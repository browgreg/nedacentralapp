import '../http_client.dart';

class AuthApi {
  static Future<Map<String, dynamic>> login(int rego) async {
    return await HttpClient.post(
      '/services/auth/login.php',
      body: {'rego': rego},
    );
  }
}
