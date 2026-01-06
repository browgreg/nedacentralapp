import 'package:flutter/foundation.dart';

import '../http_client.dart';

class Club170Dto {
  final int id;
  final String name;
  final int year;

  Club170Dto({
    required this.id,
    required this.name,
    required this.year,
  });

  factory Club170Dto.fromJson(Map<String, dynamic> j) {
    return Club170Dto(
      id: (j['id'] as num).toInt(),
      name: (j['name'] ?? '').toString(),
      year: (j['year'] as num).toInt(),
    );
  }
}

class Club170Api {
  static Future<List<Club170Dto>> fetchClub170() async {
    final res = await HttpClient.get('/services/api/club_170.php');

    debugPrint('🟡 Club 170 API raw: $res');

    if (res == null) return [];

    final List list = res is List ? res : [];
    return list
        .map((e) => Club170Dto.fromJson(Map<String, dynamic>.from(e)))
        .toList();
  }
}
