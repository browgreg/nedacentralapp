class PresidentModel {
  final String name;
  final int startYear;
  final int endYear;

  const PresidentModel({
    required this.name,
    required this.startYear,
    required this.endYear,
  });

  factory PresidentModel.fromJson(Map<String, dynamic> json) {
    return PresidentModel(
      name: json['name'],
      startYear: json['startYear'],
      endYear: json['endYear'],
    );
  }

  /// Display term
  String get term {
    if (endYear == 0) {
      return '$startYear – Present';
    }
    return '$startYear – $endYear';
  }
}
