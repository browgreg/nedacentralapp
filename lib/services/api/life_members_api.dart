import 'package:flutter/foundation.dart';

import '../../features/honours/life_members/life_members_entry.dart';
import '../http_client.dart';

class LifeMembersApi {
  static Future<List<LifeMemberEntry>> fetchLifeMembers() async {
    final res = await HttpClient.get('/services/api/life_members.php');

    debugPrint('🟡 Life Members API raw: $res');

    if (res == null) return <LifeMemberEntry>[];

    final List<dynamic> list =
        res is List ? res : (res['data'] as List<dynamic>? ?? []);

    return list
        .map<LifeMemberEntry>(
          (e) => LifeMemberEntry.fromJson(
            Map<String, dynamic>.from(e as Map),
          ),
        )
        .toList();
  }
}
