class TwentyOneSeventyOneEntry {
  final String name;
  final int career171;

  TwentyOneSeventyOneEntry({
    required this.name,
    required this.career171,
  });

  factory TwentyOneSeventyOneEntry.fromJson(Map<String, dynamic> json) {
    return TwentyOneSeventyOneEntry(
      name: json['name'],
      career171: json['Career171'],
    );
  }
}
