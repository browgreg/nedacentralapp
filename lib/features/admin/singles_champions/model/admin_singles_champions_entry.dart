class AdminSinglesChampionEntry {
  int? id;
  final int year;
  final int division;

  // ✅ rego numbers (these are what admin create/update should use)
  final int winnerRego;
  final int runnerRego;

  // ✅ display names (purely for showing on UI)
  final String championName;
  final String runnerUpName;

  AdminSinglesChampionEntry({
    this.id,
    required this.year,
    required this.division,
    required this.winnerRego,
    required this.runnerRego,
    required this.championName,
    required this.runnerUpName,
  });

  factory AdminSinglesChampionEntry.fromJson(Map<String, dynamic> json) {
    return AdminSinglesChampionEntry(
      id: json['id'] == null ? null : (json['id'] as num).toInt(),
      year: (json['year'] as num).toInt(),
      division: (json['division'] as num).toInt(),
      winnerRego: int.parse(json['winnerRego'].toString()),
      runnerRego: int.parse(json['runnerRego'].toString()),
      championName: json['champion'].toString(),
      runnerUpName: json['runnerUp'].toString(),
    );
  }

  /// ✅ send regos back to PHP (not names)
  Map<String, dynamic> toJson() => {
        'id': id,
        'year': year,
        'division': division,
        'winnerRego': winnerRego,
        'runnerRego': runnerRego,
      };

  AdminSinglesChampionEntry copyWith({int? id}) {
    return AdminSinglesChampionEntry(
      id: id ?? this.id,
      year: year,
      division: division,
      winnerRego: winnerRego,
      runnerRego: runnerRego,
      championName: championName,
      runnerUpName: runnerUpName,
    );
  }
}
