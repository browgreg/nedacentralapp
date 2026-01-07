import 'hundred_one_eight_entry.dart';

class HundredOneEightiesMapper {
  static Stat100Entry fromJson(Map<String, dynamic> json) {
    return Stat100Entry(
      name: json['name'].toString(),
      total: (json['Career180'] as num).toInt(),
    );
  }
}
