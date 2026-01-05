import 'dart:convert';

import 'package:http/http.dart' as http;

import '../core/config/api_config.dart';

class HttpClient {
  static const _timeout = Duration(seconds: 15);

  // ─────────────────────────
  // GET
  // ─────────────────────────
  static Future<dynamic> get(String path) async {
    final uri = Uri.parse('${ApiConfig.baseUrl}$path');

    final response = await http.get(uri, headers: _headers()).timeout(_timeout);

    // debugPrint(uri.toString());
    // debugPrint('STATUS: ${response.statusCode}');
    // debugPrint('HEADERS: ${response.headers}');
    // debugPrint('BODY RAW: ${response.body}');

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
  // HEADERS
  // ─────────────────────────
  static Map<String, String> _headers() => {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
      };

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
  String toString() => 'HTTP $statusCode\n$responseBody';

  String get responseBody => body;
}
