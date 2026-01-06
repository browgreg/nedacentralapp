class ClubOneSeventyEntry {
  final String name;
  final String years;
  final int count;

  ClubOneSeventyEntry({
    required this.name,
    required this.years,
    required this.count,
  });

  factory ClubOneSeventyEntry.fromJson(Map<String, dynamic> json) {
    return ClubOneSeventyEntry(
      name: json['name'],
      years: (json['bf_year'] ?? '').toString(),
      count: (json['bf_amount'] as num).toInt(),
    );
  }
}
