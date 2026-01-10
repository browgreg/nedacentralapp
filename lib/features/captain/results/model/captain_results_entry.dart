class CaptainResultEntry {
  final int matchId;
  final int homeScore;
  final int awayScore;
  final bool locked;

  CaptainResultEntry({
    required this.matchId,
    required this.homeScore,
    required this.awayScore,
    required this.locked,
  });

  factory CaptainResultEntry.fromJson(Map<String, dynamic> json) {
    return CaptainResultEntry(
      matchId: json['match_id'],
      homeScore: json['home_score'],
      awayScore: json['away_score'],
      locked: json['locked'] == true,
    );
  }

  Map<String, dynamic> toJson() => {
        'match_id': matchId,
        'home_score': homeScore,
        'away_score': awayScore,
      };
}
