import 'scoring_game_type.dart';

class ScoreEntry {
  final ScoringGameType type;
  final int legsWon;
  final int legsLost;
  final int? checkout;
  final int oneEighties;
  final DateTime playedAt;

  ScoreEntry({
    required this.type,
    required this.legsWon,
    required this.legsLost,
    this.checkout,
    required this.oneEighties,
    DateTime? playedAt,
  }) : playedAt = playedAt ?? DateTime.now();
}
