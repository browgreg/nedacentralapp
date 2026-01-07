class DoublesChampionEntry {
  final int year;
  final int division;
  final String championA;
  final String championB;
  final String runnerUpA;
  final String runnerUpB;

  DoublesChampionEntry({
    required this.year,
    required this.division,
    required this.championA,
    required this.championB,
    required this.runnerUpA,
    required this.runnerUpB,
  });

  factory DoublesChampionEntry.fromJson(Map<String, dynamic> json) {
    return DoublesChampionEntry(
      year: json['year'],
      division: json['div'],
      championA: json['champion_name_A'],
      championB: json['champion_name_B'],
      runnerUpA: json['runnerup_name_A'],
      runnerUpB: json['runnerup_name_B'],
    );
  }
}
