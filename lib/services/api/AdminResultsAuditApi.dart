// ignore_for_file: file_names

import '../../features/admin/results/model/ResultAuditEntry.dart';
import '../http_client.dart';

class AdminResultsAuditApi {
  static Future<List<ResultAuditEntry>> fetch(int fixtureId) async {
    final res = await HttpClient.get(
      '/services/admin/results_audit.php?fixture_id=$fixtureId',
    );

    return (res as List).map((e) => ResultAuditEntry.fromJson(e)).toList();
  }
}
