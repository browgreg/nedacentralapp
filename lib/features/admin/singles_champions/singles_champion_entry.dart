class AdminSinglesChampionEntry {
  final int? id;
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

  AdminSinglesChampionEntry copyWith({
    int? id,
    int? year,
    int? division,
    String? champion,
    String? runnerUp,
  }) {
    return AdminSinglesChampionEntry(
      id: id ?? this.id,
      year: year ?? this.year,
      division: division ?? this.division,
      champion: champion ?? this.champion,
      runnerUp: runnerUp ?? this.runnerUp,
    );
  }

  factory AdminSinglesChampionEntry.fromJson(Map<String, dynamic> json) {
    return AdminSinglesChampionEntry(
      id: json['id'] as int?,
      year: json['year'],
      division: json['division'],
      champion: json['champion'],
      runnerUp: json['runnerUp'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'year': year,
      'division': division,
      'champion': champion,
      'runnerUp': runnerUp,
    };
  }
}
