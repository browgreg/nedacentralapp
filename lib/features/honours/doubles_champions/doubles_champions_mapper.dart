import 'doubles_champion_entry.dart';

class DoublesChampionsMapper {
  static DoublesChampionEntry fromJson(Map<String, dynamic> json) {
    return DoublesChampionEntry(
      year: (json['year'] as num).toInt(),
      division: (json['div'] as num).toInt(),
      championA: json['champion_name_A'].toString(),
      championB: json['champion_name_B'].toString(),
      runnerUpA: json['runnerup_name_A'].toString(),
      runnerUpB: json['runnerup_name_B'].toString(),
    );
  }
}
