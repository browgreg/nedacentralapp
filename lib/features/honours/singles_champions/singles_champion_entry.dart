class SinglesChampionEntry {
  final int year;
  final int division;
  final String champion;
  final String runnerUp;

  const SinglesChampionEntry({
    required this.year,
    required this.division,
    required this.champion,
    required this.runnerUp,
  });

  factory SinglesChampionEntry.fromJson(Map<String, dynamic> json) {
    return SinglesChampionEntry(
      year: json['year'] as int,
      division: json['div'] as int,
      champion: json['champion_name'] as String,
      runnerUp: json['runnerup_name'] as String,
    );
  }
}
