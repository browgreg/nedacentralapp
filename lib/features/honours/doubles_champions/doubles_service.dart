import 'package:flutter/foundation.dart';

import '../../../services/http_client.dart';
import 'doubles_champion_entry.dart';

class DoublesChampionsService {
  static Future<List<DoublesChampionEntry>> fetch() async {
    final res = await HttpClient.get('/services/api/doubles_champions.php');

    debugPrint('🟡 Doubles API raw: $res');

    if (res == null) return [];

    final List list = res is List ? res : [];

    return list
        .map(
          (e) => DoublesChampionEntry.fromJson(
            Map<String, dynamic>.from(e),
          ),
        )
        .toList();
  }
}
