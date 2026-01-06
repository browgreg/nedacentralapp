import 'president_entry.dart';

class PresidentsMapper {
  static PresidentEntry fromJson(Map<String, dynamic> json) {
    return PresidentEntry(
      name: json['name'],
      startYear: json['startYear'],
      endYear: json['endYear'],
    );
  }
}
