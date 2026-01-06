class TeamChampionEntry {
  final int year;
  final String season;
  final int division;
  final String champion;
  final String runnerUp;

  TeamChampionEntry({
    required this.year,
    required this.season,
    required this.division,
    required this.champion,
    required this.runnerUp,
  });

  factory TeamChampionEntry.fromJson(Map<String, dynamic> json) {
    return TeamChampionEntry(
      year: json['year'],
      season: json['season'],
      division: json['div'],
      champion: json['champion'],
      runnerUp: json['runnerUp'],
    );
  }
}
