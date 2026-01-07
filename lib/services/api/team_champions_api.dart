import 'package:flutter/foundation.dart';

import '../../features/admin/team_champions/admin_team_champions_entry.dart';
import '../../features/honours/team_champions/teams_champion_entry.dart';
import '../http_client.dart';

class TeamChampionsApi {
  /// 🔹 PUBLIC (frontend + admin)
  static Future<List<AdminTeamChampionEntry>> fetchAll() async {
    final res = await HttpClient.get('/services/api/team_champions.php');

    debugPrint('🟡 Team Champions API raw: $res');

    if (res == null || res is! List) return [];

    return res.map<AdminTeamChampionEntry>((e) {
      final json = Map<String, dynamic>.from(e);

      return AdminTeamChampionEntry(
        year: (json['year'] as num).toInt(),
        season: json['season'].toString(),
        division: (json['div'] as num).toInt(),
        champion: json['champion'].toString(),
        runnerUp: json['runnerUp'].toString(),
      );
    }).toList();
  }

  /// 🔹 ADMIN – ADD
  static Future<void> add(TeamChampionEntry entry) async {
    await HttpClient.post(
      '/services/api/team_champions_add.php',
      body: {
        'year': entry.year,
        'season': entry.season,
        'division': entry.division,
        'champion': entry.champion,
        'runnerUp': entry.runnerUp,
      },
    );
  }

  /// 🔹 ADMIN – UPDATE
  static Future<void> update(TeamChampionEntry entry) async {
    await HttpClient.post(
      '/services/api/team_champions_update.php',
      body: {
        'year': entry.year,
        'season': entry.season,
        'division': entry.division,
        'champion': entry.champion,
        'runnerUp': entry.runnerUp,
      },
    );
  }

  /// 🔹 ADMIN – DELETE
  static Future<void> delete(TeamChampionEntry entry) async {
    await HttpClient.post(
      '/services/api/team_champions_delete.php',
      body: {
        'year': entry.year,
        'season': entry.season,
        'division': entry.division,
      },
    );
  }
}
