class HundredOneEightEntry {
  final String name;
  final int career180;

  const HundredOneEightEntry({
    required this.name,
    required this.career180,
  });

  factory HundredOneEightEntry.fromJson(Map<String, dynamic> json) {
    return HundredOneEightEntry(
      name: json['name'] as String,
      career180: (json['Career180'] as num).toInt(),
    );
  }
}
