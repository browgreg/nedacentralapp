import 'package:get/get.dart';

import '../../stats/model/player_stats.dart';
import '../model/scoring_entry.dart';
import '../model/scoring_game_type.dart';

class ScoringController extends GetxController {
  final scores = <ScoreEntry>[].obs;

  /// Called from UI
  void submitScore({
    required ScoringGameType type,
    required int legsWon,
    required int legsLost,
    int? checkout,
    required int oneEighties,
  }) {
    scores.add(
      ScoreEntry(
        type: type,
        legsWon: legsWon,
        legsLost: legsLost,
        checkout: checkout,
        oneEighties: oneEighties,
      ),
    );
  }

  /// 🔢 AGGREGATION
  PlayerStats get stats {
    if (scores.isEmpty) {
      return PlayerStats(
        gamesPlayed: 0,
        legsWon: 0,
        legsLost: 0,
        winPercentage: 0,
        highestCheckout: 0,
        total180s: 0,
      );
    }

    final games = scores.length;
    final won = scores.fold<int>(0, (t, s) => t + s.legsWon);
    final lost = scores.fold<int>(0, (t, s) => t + s.legsLost);
    final wins = scores.where((s) => s.legsWon > s.legsLost).length;
    final highestCheckout = scores
        .map((s) => s.checkout ?? 0)
        .fold<int>(0, (a, b) => a > b ? a : b);
    final total180s = scores.fold<int>(0, (t, s) => t + s.oneEighties);

    return PlayerStats(
      gamesPlayed: games,
      legsWon: won,
      legsLost: lost,
      winPercentage: (wins / games) * 100,
      highestCheckout: highestCheckout,
      total180s: total180s,
    );
  }
}
