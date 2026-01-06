class MemorialEntry {
  final String name;

  MemorialEntry({required this.name});

  factory MemorialEntry.fromJson(Map<String, dynamic> json) {
    return MemorialEntry(
      name: (json['name'] ?? '').toString().trim(),
    );
  }
}
