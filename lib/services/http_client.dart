import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import '../auth/auth_controller.dart';
import '../core/config/api_config.dart';

class HttpClient {
  static const _timeout = Duration(seconds: 15);

  // ─────────────────────────
  // GET
  // ─────────────────────────
  static Future<dynamic> get(String path) async {
    final uri = Uri.parse('${ApiConfig.baseUrl}$path');

    final response = await http.get(uri, headers: _headers()).timeout(_timeout);

    _validate(response);
    return jsonDecode(response.body);
  }

  // ─────────────────────────
  // POST
  // ─────────────────────────
  static Future<dynamic> post(
    String path, {
    Map<String, dynamic>? body,
  }) async {
    final uri = Uri.parse('${ApiConfig.baseUrl}$path');

    final response = await http
        .post(
          uri,
          headers: _headers(),
          body: body == null ? null : jsonEncode(body),
        )
        .timeout(_timeout);

    _validate(response);
    return jsonDecode(response.body);
  }

  // ─────────────────────────
  // HEADERS (AUTH-AWARE)
  // ─────────────────────────
  static Map<String, String> _headers() {
    final headers = <String, String>{
      'Content-Type': 'application/json',
      'Accept': 'application/json',
    };

    try {
      final auth = Get.find<AuthController>();
      final token = auth.session?.token;

      if (token != null && token.isNotEmpty) {
        headers['Authorization'] = 'Bearer $token';
      }
    } catch (_) {
      // AuthController not available yet (startup / public routes)
    }

    return headers;
  }

  // ─────────────────────────
  // ERROR HANDLING
  // ─────────────────────────
  static void _validate(http.Response response) {
    if (response.statusCode >= 200 && response.statusCode < 300) return;

    throw HttpException(
      statusCode: response.statusCode,
      body: response.body,
    );
  }
}

// ─────────────────────────
// CUSTOM EXCEPTION
// ─────────────────────────
class HttpException implements Exception {
  final int statusCode;
  final String body;

  HttpException({
    required this.statusCode,
    required this.body,
  });

  @override
  String toString() => 'HTTP $statusCode\n$body';
}
