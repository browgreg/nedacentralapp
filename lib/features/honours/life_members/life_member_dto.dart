class LifeMemberDto {
  final int id;
  final String name;
  final int inductionYear;

  LifeMemberDto({
    required this.id,
    required this.name,
    required this.inductionYear,
  });

  factory LifeMemberDto.fromJson(Map<String, dynamic> j) {
    return LifeMemberDto(
      id: (j['id'] as num).toInt(),
      name: (j['name'] ?? '').toString(),
      inductionYear: (j['inductionYear'] as num).toInt(),
    );
  }
}
