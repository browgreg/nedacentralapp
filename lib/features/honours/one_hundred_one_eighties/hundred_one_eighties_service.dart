import 'package:flutter/foundation.dart';

import '../../../services/http_client.dart';
import 'hundred_one_eight_entry.dart';

class HundredOneEightService {
  static Future<List<HundredOneEightEntry>> fetch() async {
    final res =
        await HttpClient.get('/services/api/one_hundred_one_eighties.php');

    debugPrint('🟡 100–179 180s API: $res');

    if (res == null || res is! List) return [];

    return res
        .map((e) => HundredOneEightEntry.fromJson(
              Map<String, dynamic>.from(e),
            ))
        .toList();
  }
}
