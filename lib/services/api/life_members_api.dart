import 'package:flutter/foundation.dart';

import '../http_client.dart'; // your HttpClient wrapper

class PresidentDto {
  final int id;
  final String name;
  final int startYear;
  final int endYear;

  PresidentDto({
    required this.id,
    required this.name,
    required this.startYear,
    required this.endYear,
  });

  factory PresidentDto.fromJson(Map<String, dynamic> j) {
    return PresidentDto(
      id: (j['id'] as num).toInt(),
      name: (j['name'] ?? '').toString(),
      startYear: (j['startYear'] as num).toInt(),
      endYear: (j['endYear'] as num).toInt(),
    );
  }
}

class PresidentsApi {
  static Future<List<PresidentDto>> fetchPresidents() async {
    final res = await HttpClient.get(
        '/services/api/presidents.php'); // whatever path maps to presidents.php

    debugPrint('🟡 Presidents API raw: $res');

    if (res == null) return [];

    final List list = res is List ? res : (res['data'] as List? ?? []);
    return list
        .map((e) => PresidentDto.fromJson(Map<String, dynamic>.from(e)))
        .toList();
  }
}
