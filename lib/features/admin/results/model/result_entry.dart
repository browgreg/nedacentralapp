class ResultEntry {
  final int fixtureId; // ✅ REQUIRED
  final int round;
  final int division;

  final String homeTeam;
  final String awayTeam;

  final int homeScore;
  final int awayScore;

  final String date;
  final bool isLocked; // ✅ REQUIRED

  ResultEntry({
    required this.fixtureId,
    required this.round,
    required this.division,
    required this.homeTeam,
    required this.awayTeam,
    required this.homeScore,
    required this.awayScore,
    required this.date,
    required this.isLocked,
  });

  factory ResultEntry.fromJson(Map<String, dynamic> json) {
    return ResultEntry(
      fixtureId: json['fixture_id'],
      // 🔑 MUST come from API
      round: json['round'],
      division: json['division'],
      homeTeam: json['home_team'],
      awayTeam: json['away_team'],
      homeScore: json['home_score'],
      awayScore: json['away_score'],
      date: json['date'],
      isLocked: json['is_locked'] == 1, // or true/false
    );
  }
}
