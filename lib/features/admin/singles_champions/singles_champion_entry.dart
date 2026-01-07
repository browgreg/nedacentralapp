class SinglesChampionEntry {
  final int year;
  final int division;
  final String champion;
  final String runnerUp;

  SinglesChampionEntry({
    required this.year,
    required this.division,
    required this.champion,
    required this.runnerUp,
  });

  factory SinglesChampionEntry.fromJson(Map<String, dynamic> json) {
    return SinglesChampionEntry(
      year: json['year'],
      division: json['div'],
      champion: json['champion_name'],
      runnerUp: json['runnerup_name'],
    );
  }
}
