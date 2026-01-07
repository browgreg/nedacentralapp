import 'package:flutter/foundation.dart';

import '../../../services/http_client.dart';

class PresidentDto {
  final String name;
  final int startYear;
  final int endYear;

  PresidentDto({
    required this.name,
    required this.startYear,
    required this.endYear,
  });

  factory PresidentDto.fromJson(Map<String, dynamic> json) {
    return PresidentDto(
      name: json['name'].toString(),
      startYear: (json['startYear'] as num).toInt(),
      endYear: (json['endYear'] as num).toInt(),
    );
  }

  String get term {
    if (endYear == 0) return '$startYear – Present';
    return '$startYear – $endYear';
  }
}

class PresidentsService {
  static Future<List<PresidentDto>> fetch() async {
    final res = await HttpClient.get('/services/api/presidents.php');

    debugPrint('🟡 Presidents API raw: $res');

    if (res == null || res is! List) return [];

    return res
        .map((e) => PresidentDto.fromJson(Map<String, dynamic>.from(e)))
        .toList();
  }
}
