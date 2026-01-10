class AdminTeamChampionEntry {
  final int? id;
  final int year;
  final String season;
  final int division;
  final String champion;
  final String runnerUp;

  AdminTeamChampionEntry({
    this.id,
    required this.year,
    required this.season,
    required this.division,
    required this.champion,
    required this.runnerUp,
  });

  factory AdminTeamChampionEntry.fromJson(Map<String, dynamic> json) {
    return AdminTeamChampionEntry(
      id: json['id'],
      year: json['year'],
      season: json['season'],
      division: json['division'],
      champion: json['champion'],
      runnerUp: json['runnerUp'],
    );
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'year': year,
        'season': season,
        'division': division,
        'champion': champion,
        'runnerUp': runnerUp,
      };

  AdminTeamChampionEntry copyWith({int? id}) {
    return AdminTeamChampionEntry(
      id: id ?? this.id,
      year: year,
      season: season,
      division: division,
      champion: champion,
      runnerUp: runnerUp,
    );
  }
}
