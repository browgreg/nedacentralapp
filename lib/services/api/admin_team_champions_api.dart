import 'package:flutter/foundation.dart';

import '../../features/admin/team_champions/admin_team_champions_entry.dart';
import '../http_client.dart';

class AdminTeamChampionsApi {
  /// 🔹 Fetch all team champions for admin
  static Future<List<AdminTeamChampionEntry>> fetch() async {
    final res = await HttpClient.get(
      '/services/admin/team_champions.php',
    );

    if (kDebugMode) {
      debugPrint('🟡 Admin Team Champions API raw: $res');
    }

    if (res == null || res is! List) return [];

    return res
        .map(
          (e) => AdminTeamChampionEntry.fromJson(
            Map<String, dynamic>.from(e),
          ),
        )
        .toList();
  }

  /// 🔹 Create
  static Future<void> create(AdminTeamChampionEntry entry) async {
    if (kDebugMode) {
      debugPrint('🟢 Creating team champion: ${entry.toJson()}');
    }

    await HttpClient.post(
      '/services/admin/team_champions_create.php',
      body: entry.toJson(),
    );
  }

  /// 🔹 Update
  static Future<void> update(AdminTeamChampionEntry entry) async {
    if (entry.id == null) {
      throw Exception('Cannot update TeamChampion without an ID');
    }

    if (kDebugMode) {
      debugPrint('🟠 Updating team champion: ${entry.toJson()}');
    }

    await HttpClient.post(
      '/services/admin/team_champions_update.php',
      body: entry.toJson(),
    );
  }

  /// 🔹 Delete
  static Future<void> delete(AdminTeamChampionEntry entry) async {
    if (entry.id == null) {
      throw Exception('Cannot delete TeamChampion without an ID');
    }

    if (kDebugMode) {
      debugPrint('🔴 Deleting team champion ID: ${entry.id}');
    }

    await HttpClient.post(
      '/services/admin/team_champions_delete.php',
      body: {'id': entry.id},
    );
  }
}
