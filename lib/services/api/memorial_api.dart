import 'package:flutter/foundation.dart';

import '../../features/honours/memorial/memorial_entry.dart';
import '../http_client.dart';

class MemorialApi {
  static Future<List<MemorialEntry>> fetchMemorials() async {
    final res = await HttpClient.get('/services/api/neda_life_posthumous.php');

    debugPrint('🟡 Memorial API raw: $res');

    if (res == null || res is! List) return [];

    return res
        .map(
          (e) => MemorialEntry.fromJson(
            Map<String, dynamic>.from(e),
          ),
        )
        .toList();
  }
}
