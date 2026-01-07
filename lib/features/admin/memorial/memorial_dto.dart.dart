class MemorialDto {
  final String name;

  MemorialDto({required this.name});

  factory MemorialDto.fromJson(Map<String, dynamic> json) {
    return MemorialDto(
      name: (json['name'] ?? '').toString(),
    );
  }
}
