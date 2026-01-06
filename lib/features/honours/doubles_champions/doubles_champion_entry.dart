class DoublesChampionEntry {
  final int year;
  final int division;
  final String championA;
  final String championB;
  final String runnerUpA;
  final String runnerUpB;

  const DoublesChampionEntry({
    required this.year,
    required this.division,
    required this.championA,
    required this.championB,
    required this.runnerUpA,
    required this.runnerUpB,
  });

  factory DoublesChampionEntry.fromJson(Map<String, dynamic> json) {
    return DoublesChampionEntry(
      year: json['year'] as int,
      division: json['div'] as int,
      championA: json['champion_name_A'] as String,
      championB: json['champion_name_B'] as String,
      runnerUpA: json['runnerup_name_A'] as String,
      runnerUpB: json['runnerup_name_B'] as String,
    );
  }
}
