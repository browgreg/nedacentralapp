import '../http_client.dart';

class AdminTeamApi {
  /// 🔒 Lock team selection (admin only)
  static Future<void> lock(int teamId) async {
    await HttpClient.post(
      '/services/admin/team_lock.php',
      body: {
        'team_id': teamId,
      },
    );
  }

  /// 🔓 Unlock team selection (admin override)
  static Future<void> unlock(int teamId) async {
    await HttpClient.post(
      '/services/admin/team_unlock.php',
      body: {
        'team_id': teamId,
      },
    );
  }
}
