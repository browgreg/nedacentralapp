import 'dart:convert';

import '../../features/landing/model/fixture_model.dart';
import '../http_client.dart';

class FixturesApi {
  static Future<Map<int, List<Fixture>>> fetchUpcomingByDivision() async {
    final raw = await HttpClient.get('/services/api/upcoming_fixtures.php');

    //debugPrint('FIXTURES RAW RESPONSE: $raw');

    if (raw == null) {
      throw Exception('API returned null');
    }

    // ✅ Ensure we are working with decoded JSON
    final Map<String, dynamic> res =
        raw is String ? jsonDecode(raw) : Map<String, dynamic>.from(raw);

    if (!res.containsKey('fixtures')) {
      throw Exception('API missing "fixtures" key');
    }

    final List fixturesJson = res['fixtures'] as List;

    //debugPrint('FIXTURES COUNT: ${fixturesJson.length}');

    final fixtures = fixturesJson
        .map((e) => Fixture.fromJson(Map<String, dynamic>.from(e)))
        .toList();

    final Map<int, List<Fixture>> grouped = {};

    for (final f in fixtures) {
      grouped.putIfAbsent(f.division, () => []).add(f);
    }

    return grouped;
  }
}
