enum PosterSource {
  club,
  tournament,
}

class PosterAdmin {
  final int id;
  final String title;
  final String? subtitle;
  final String? content;
  final String imageName;
  final DateTime startDate;
  final DateTime endDate;
  final int priority;

  /// 0 = not featured
  /// 1 = featured
  final bool isFeatured;

  final PosterSource source;
  final DateTime createdAt;
  final DateTime updatedAt;

  PosterAdmin({
    required this.id,
    required this.title,
    this.subtitle,
    this.content,
    required this.imageName,
    required this.startDate,
    required this.endDate,
    required this.priority,
    required this.isFeatured,
    required this.source,
    required this.createdAt,
    required this.updatedAt,
  });

  // ─────────────────────────
  // Derived state (admin UI)
  // ─────────────────────────

  bool get isExpired => DateTime.now().isAfter(endDate);
  bool get isScheduled => DateTime.now().isBefore(startDate);
  bool get isActive => !isExpired && !isScheduled;

  // ─────────────────────────
  // JSON
  // ─────────────────────────

  factory PosterAdmin.fromJson(Map<String, dynamic> json) {
    return PosterAdmin(
      id: int.parse(json['id'].toString()),
      title: json['title'],
      subtitle: json['subtitle'],
      content: json['content'],
      imageName: json['image_name'],
      startDate: DateTime.parse(json['start_date']),
      endDate: DateTime.parse(json['end_date']),
      priority: int.parse(json['priority'].toString()),
      isFeatured: json['is_featured'].toString() == '1',
      source: _parseSource(json['source']),
      createdAt: DateTime.parse(json['created_at']),
      updatedAt: DateTime.parse(json['updated_at']),
    );
  }

  static PosterSource _parseSource(dynamic value) {
    switch (value?.toString()) {
      case 'tournament':
        return PosterSource.tournament;
      default:
        return PosterSource.club;
    }
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'subtitle': subtitle,
      'content': content,
      'image_name': imageName,
      'start_date': startDate.toIso8601String(),
      'end_date': endDate.toIso8601String(),
      'priority': priority,
      'is_featured': isFeatured ? 1 : 0,
      'source': source.name,
    };
  }
}