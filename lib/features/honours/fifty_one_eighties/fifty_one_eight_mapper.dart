import 'fifty_one_eight_entry.dart';

class FiftyOneEightiesMapper {
  static StatEntry fromJson(Map<String, dynamic> json) {
    return StatEntry(
      name: json['name'].toString(),
      total: (json['Career180'] as num).toInt(),
    );
  }
}
