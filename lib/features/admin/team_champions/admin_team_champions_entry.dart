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
      division: json['div'],
      champion: json['champion'],
      runnerUp: json['runnerUp'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'year': year,
      'season': season,
      'div': division,
      'champion': champion,
      'runnerUp': runnerUp,
    };
  }
}
