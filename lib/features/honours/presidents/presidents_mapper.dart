import 'package:neda_central/features/honours/presidents/president_entry.dart';

class PresidentsMapper {
  static PresidentsEntry fromJson(Map<String, dynamic> json) {
    final int startYear = (json['startYear'] as num).toInt();
    final int endYear = (json['endYear'] as num).toInt();

    final String term =
        endYear == 0 ? '$startYear – Present' : '$startYear – $endYear';

    return PresidentsEntry(
      name: json['name'].toString(),
      term: term,
    );
  }
}
