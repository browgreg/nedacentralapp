import 'package:neda_central/features/honours/singles_champions/singles_champion_entry.dart';

class SinglesChampionsMapper {
  static SinglesChampionEntry fromJson(Map<String, dynamic> json) {
    return SinglesChampionEntry(
      year: (json['year'] as num).toInt(),
      division: (json['div'] as num).toInt(),
      champion: json['champion_name'].toString(),
      runnerUp: json['runnerup_name'].toString(),
    );
  }
}
