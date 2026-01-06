import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

class PresidentsApi {
  static const _url = 'https://neda.club/BackEnd/services/api/presidents.php';

  static Future<List<Map<String, dynamic>>> fetchPresidents() async {
    final res = await http.get(Uri.parse(_url));

    if (kDebugMode) {
      print('🟡 Presidents API status: ${res.statusCode}');
    }
    if (kDebugMode) {
      print('🟡 Presidents API body: ${res.body}');
    }

    if (res.statusCode != 200) {
      throw Exception('Failed to load presidents');
    }

    return List<Map<String, dynamic>>.from(jsonDecode(res.body));
  }
}
