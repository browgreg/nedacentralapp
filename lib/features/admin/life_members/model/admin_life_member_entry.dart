class AdminLifeMemberEntry {
  final int? id;
  final int rego;
  final String name;
  final int inductionYear;

  AdminLifeMemberEntry({
    this.id,
    required this.rego,
    required this.name,
    required this.inductionYear,
  });

  factory AdminLifeMemberEntry.fromJson(Map<String, dynamic> json) {
    return AdminLifeMemberEntry(
      id: json['id'] as int?,
      rego: json['rego'] as int,
      name: json['name'] as String,
      inductionYear: json['inductionYear'] as int,
    );
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'rego': rego,
        'inductionYear': inductionYear,
      };

  AdminLifeMemberEntry copyWith({
    int? id,
    int? rego,
    String? name,
    int? inductionYear,
  }) {
    return AdminLifeMemberEntry(
      id: id ?? this.id,
      rego: rego ?? this.rego,
      name: name ?? this.name,
      inductionYear: inductionYear ?? this.inductionYear,
    );
  }
}
