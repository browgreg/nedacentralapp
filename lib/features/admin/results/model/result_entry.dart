class ResultEntry {
  final int fixtureId;
  final int round;
  final int division;
  final String homeTeam;
  final String awayTeam;
  final int homeScore;
  final int awayScore;
  final bool isLocked;

  ResultEntry({
    required this.fixtureId,
    required this.round,
    required this.division,
    required this.homeTeam,
    required this.awayTeam,
    required this.homeScore,
    required this.awayScore,
    required this.isLocked,
  });

  factory ResultEntry.fromJson(Map<String, dynamic> json) {
    return ResultEntry(
      fixtureId: json['fixture_id'],
      round: json['round'],
      division: json['division'],
      homeTeam: json['home_team'],
      awayTeam: json['away_team'],
      homeScore: json['home_score'],
      awayScore: json['away_score'],
      isLocked: json['is_locked'] == 1,
    );
  }
}
