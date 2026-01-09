import '../../../services/http_client.dart';

class CaptainTeamApi {
  static Future<Map<String, dynamic>?> fetchSelection(int teamId) async {
    final res = await HttpClient.get(
      '/services/captain/team_selection.php?team_id=$teamId',
    );

    if (res == null) return null;
    return res;
  }

  static Future<void> saveSelection({
    required int teamId,
    required List<int> players,
    int? reserve,
  }) async {
    await HttpClient.post(
      '/services/captain/team_selection_save.php',
      body: {
        'team_id': teamId,
        'players': players,
        'reserve': reserve,
      },
    );
  }
}
