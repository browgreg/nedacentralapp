import 'dart:convert';

import 'package:http/http.dart' as http;

import 'president_entry.dart';
import 'presidents_mapper.dart';

class PresidentsService {
  static const _url = 'https://neda.club/BackEnd/services/api/presidents.php';

  static Future<List<PresidentEntry>> fetchPresidents() async {
    final res = await http.get(Uri.parse(_url));

    if (res.statusCode != 200) {
      throw Exception('Failed to load presidents');
    }

    final List data = json.decode(res.body);

    return data.map((e) => PresidentsMapper.fromJson(e)).toList();
  }
}
