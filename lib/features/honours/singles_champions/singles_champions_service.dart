import 'package:flutter/foundation.dart';

import '../../../services/http_client.dart';
import 'singles_champion_entry.dart';

class SinglesChampionsService {
  static Future<List<SinglesChampionEntry>> fetch() async {
    final res = await HttpClient.get('/services/api/singles_champions.php');

    debugPrint('🟡 Singles Champions API raw: $res');

    if (res == null || res is! List) return [];

    return res
        .map(
          (e) => SinglesChampionEntry.fromJson(
            Map<String, dynamic>.from(e),
          ),
        )
        .toList();
  }
}
