import 'package:flutter/foundation.dart';

import '../../../services/http_client.dart';
import 'fifty_one_eight_entry.dart';

class FiftyOneEightService {
  static Future<List<FiftyOneEightEntry>> fetch() async {
    final res = await HttpClient.get('/services/api/fifty_one_eighties.php');

    debugPrint('🟡 50–99 180s API: $res');

    if (res == null || res is! List) return [];

    return res
        .map((e) => FiftyOneEightEntry.fromJson(
              Map<String, dynamic>.from(e),
            ))
        .toList();
  }
}
