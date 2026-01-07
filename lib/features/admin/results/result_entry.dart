class ResultEntry {
  final int round;
  final int division;
  final String homeTeam;
  final String awayTeam;
  final int homeScore;
  final int awayScore;
  final String date;

  ResultEntry({
    required this.round,
    required this.division,
    required this.homeTeam,
    required this.awayTeam,
    required this.homeScore,
    required this.awayScore,
    required this.date,
  });

  factory ResultEntry.fromJson(Map<String, dynamic> json) {
    return ResultEntry(
      round: json['round'],
      division: json['division'],
      homeTeam: json['homeTeam'],
      awayTeam: json['awayTeam'],
      homeScore: json['homeScore'],
      awayScore: json['awayScore'],
      date: json['date'],
    );
  }
}
