import 'package:flutter/foundation.dart';

import '../../features/admin/team_champions/team_champion_dto.dart';
import '../http_client.dart';

class TeamChampionsApi {
  static Future<List<TeamChampionDto>> fetchChampions() async {
    final res = await HttpClient.get('/services/api/team_champions.php');

    debugPrint('🟡 Team Champions API raw: $res');

    if (res == null) return [];

    final List list = res is List ? res : [];
    return list
        .map((e) => TeamChampionDto.fromJson(Map<String, dynamic>.from(e)))
        .toList();
  }
}
