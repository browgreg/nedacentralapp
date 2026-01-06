class PresidentEntry {
  final String name;
  final int startYear;
  final int endYear;

  const PresidentEntry({
    required this.name,
    required this.startYear,
    required this.endYear,
  });

  String get term =>
      endYear == 0 ? '$startYear – Present' : '$startYear – $endYear';
}
