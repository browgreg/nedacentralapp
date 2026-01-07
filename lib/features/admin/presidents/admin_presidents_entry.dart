class AdminPresidentEntry {
  final int id;
  final String name;
  final int startYear;
  final int endYear;

  const AdminPresidentEntry({
    required this.id,
    required this.name,
    required this.startYear,
    required this.endYear,
  });

  factory AdminPresidentEntry.fromJson(Map<String, dynamic> j) {
    return AdminPresidentEntry(
      id: (j['id'] as num).toInt(),
      name: (j['name'] ?? '').toString(),
      startYear: (j['startYear'] as num).toInt(),
      endYear: (j['endYear'] as num).toInt(),
    );
  }

  String get period =>
      endYear == 0 ? '$startYear – Present' : '$startYear – $endYear';
}
