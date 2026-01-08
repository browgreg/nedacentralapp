class AdminSinglesChampionEntry {
  int? id;
  final int year;
  final int division;
  final String champion;
  final String runnerUp;

  AdminSinglesChampionEntry({
    this.id,
    required this.year,
    required this.division,
    required this.champion,
    required this.runnerUp,
  });

  factory AdminSinglesChampionEntry.fromJson(Map<String, dynamic> json) {
    return AdminSinglesChampionEntry(
      id: json['id'],
      year: json['year'],
      division: json['division'],
      champion: json['champion'],
      runnerUp: json['runnerUp'],
    );
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'year': year,
        'division': division,
        'champion': champion,
        'runnerUp': runnerUp,
      };

  AdminSinglesChampionEntry copyWith({int? id}) {
    return AdminSinglesChampionEntry(
      id: id ?? this.id,
      year: year,
      division: division,
      champion: champion,
      runnerUp: runnerUp,
    );
  }
}
