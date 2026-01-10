import '../http_client.dart';
import '../../features/admin/committee/model/committee_member.dart';
import '../../features/admin/committee/model/committee_role.dart';

class CommitteeApi {
  /// Fetch all committee roles
  static Future<Map<CommitteeRole, CommitteeMember?>> fetch() async {
    final res = await HttpClient.get('/services/admin/committee/list.php');

    final map = <CommitteeRole, CommitteeMember?>{};
    for (final r in res) {
      final role = CommitteeRoleX.fromName(r['role']);
      if (r['rego'] == null) {
        map[role] = null;
      } else {
        map[role] = CommitteeMember(
          rego: r['rego'],
          name: r['name'],
        );
      }
    }
    return map;
  }

  /// Assign member
  static Future<void> assign(CommitteeRole role, int rego) async {
    await HttpClient.post(
      '/services/admin/committee/assign.php',
      body: {
        'role': role.name,
        'rego': rego,
      },
    );
  }

  /// Clear role
  static Future<void> clear(CommitteeRole role) async {
    await HttpClient.post(
      '/services/admin/committee/clear.php',
      body: {
        'role': role.name,
      },
    );
  }
}
