class AdminOneSeventyClubEntry {
  int? id;
  final int year;
  final int division;
  final String champion1;
  final String runnerUp1;
  final String champion2;
  final String runnerUp2;

  AdminOneSeventyClubEntry({
    this.id,
    required this.year,
    required this.division,
    required this.champion1,
    required this.runnerUp1,
    required this.champion2,
    required this.runnerUp2,
  });

  factory AdminOneSeventyClubEntry.fromJson(Map<String, dynamic> json) {
    return AdminOneSeventyClubEntry(
      id: json['id'],
      year: json['year'],
      division: json['division'],
      champion1: json['champion1'],
      runnerUp1: json['runnerUp1'],
      champion2: json['champion2'],
      runnerUp2: json['runnerUp2'],
    );
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'year': year,
        'division': division,
        'champion1': champion1,
        'runnerUp1': runnerUp1,
        'champion2': champion2,
        'runnerUp2': runnerUp2,
      };

  AdminOneSeventyClubEntry copyWith({int? id}) {
    return AdminOneSeventyClubEntry(
      id: id ?? this.id,
      year: year,
      division: division,
      champion1: champion1,
      runnerUp1: runnerUp1,
      champion2: champion2,
      runnerUp2: runnerUp2,
    );
  }
}
