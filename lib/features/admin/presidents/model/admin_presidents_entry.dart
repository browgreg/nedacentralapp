class AdminPresidentEntry {
  final int? id;
  final int rego;
  final String name;
  final int startYear;
  final int endYear;

  AdminPresidentEntry({
    this.id,
    required this.rego,
    required this.name,
    required this.startYear,
    required this.endYear,
  });

  factory AdminPresidentEntry.fromJson(Map<String, dynamic> json) {
    return AdminPresidentEntry(
      id: json['id'] as int?,
      rego: (json['rego'] as num).toInt(),
      name: json['name'].toString(),
      startYear: (json['startYear'] as num).toInt(),
      endYear: (json['endYear'] as num).toInt(),
    );
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'rego': rego,
        'start_year': startYear,
        'end_year': endYear,
      };

  AdminPresidentEntry copyWith({
    int? id,
    int? rego,
    String? name,
    int? startYear,
    int? endYear,
  }) {
    return AdminPresidentEntry(
      id: id ?? this.id,
      rego: rego ?? this.rego,
      name: name ?? this.name,
      startYear: startYear ?? this.startYear,
      endYear: endYear ?? this.endYear,
    );
  }
}
