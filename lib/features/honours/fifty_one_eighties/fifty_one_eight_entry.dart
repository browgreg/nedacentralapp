class FiftyOneEightEntry {
  final String name;
  final int career180;

  const FiftyOneEightEntry({
    required this.name,
    required this.career180,
  });

  factory FiftyOneEightEntry.fromJson(Map<String, dynamic> json) {
    return FiftyOneEightEntry(
      name: json['name'] as String,
      career180: (json['Career180'] as num).toInt(),
    );
  }
}
