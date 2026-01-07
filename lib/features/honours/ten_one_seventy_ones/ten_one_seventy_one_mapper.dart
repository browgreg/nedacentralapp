import 'package:neda_central/features/honours/ten_one_seventy_ones/ten_one_seventy_one_entry.dart';

class TenOneSeventyOnesMapper {
  static Stat171Entry fromJson(Map<String, dynamic> json) {
    return Stat171Entry(
      name: json['name'].toString(),
      total: (json['Career171'] as num).toInt(),
    );
  }
}
