class LifeMemberEntry {
  final int id;
  final String name;
  final int inductionYear;

  LifeMemberEntry({
    required this.id,
    required this.name,
    required this.inductionYear,
  });

  factory LifeMemberEntry.fromJson(Map<String, dynamic> json) {
    return LifeMemberEntry(
      id: (json['id'] as num).toInt(),
      name: json['name'] as String,
      inductionYear: (json['inductionYear'] as num).toInt(),
    );
  }
}
