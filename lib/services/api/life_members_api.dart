import 'package:flutter/foundation.dart';

import '../../features/honours/life_members/life_member_dto.dart';
import '../http_client.dart';

class LifeMembersApi {
  static Future<List<LifeMemberDto>> fetchLifeMembers() async {
    final res = await HttpClient.get('/services/api/life_members.php');

    debugPrint('🟡 Life Members API raw: $res');

    if (res == null) return [];

    final List list = res is List ? res : (res['data'] as List? ?? []);

    return list
        .map((e) => LifeMemberDto.fromJson(Map<String, dynamic>.from(e)))
        .toList();
  }
}
