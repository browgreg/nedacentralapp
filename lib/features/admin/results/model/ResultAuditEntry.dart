// ignore_for_file: file_names

class ResultAuditEntry {
  final DateTime changedAt;
  final int rego;
  final String role;
  final int? oldHome;
  final int? oldAway;
  final int newHome;
  final int newAway;
  final String? overrideReason;

  ResultAuditEntry({
    required this.changedAt,
    required this.rego,
    required this.role,
    this.oldHome,
    this.oldAway,
    required this.newHome,
    required this.newAway,
    this.overrideReason,
  });

  factory ResultAuditEntry.fromJson(Map<String, dynamic> j) {
    return ResultAuditEntry(
      changedAt: DateTime.parse(j['changed_at']),
      rego: j['changed_by_rego'],
      role: j['changed_by_role'],
      oldHome: j['old_home_score'],
      oldAway: j['old_away_score'],
      newHome: j['new_home_score'],
      newAway: j['new_away_score'],
      overrideReason: j['override_reason'],
    );
  }
}
