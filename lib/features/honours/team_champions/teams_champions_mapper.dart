import 'package:neda_central/features/honours/team_champions/teams_champion_entry.dart';

class TeamsChampionsMapper {
  static TeamChampionEntry fromJson(Map<String, dynamic> json) {
    return TeamChampionEntry(
      year: (json['year'] as num).toInt(),
      division: (json['div'] as num).toInt(),
      season: json['season'].toString(),
      champion: json['champion'].toString(),
      runnerUp: json['runnerUp'].toString(),
    );
  }
}
