enum PosterSource { club, tournament }

class Poster {
  final int id;
  final String title;
  final String imageName;
  final DateTime startDate;
  final DateTime? endDate;
  final int priority;
  final bool isFeatured;
  final PosterSource source;

  final String? subtitle;
  final String? content;
  final String? ctaUrl;

  final String? location;

  Poster({
    required this.id,
    required this.title,
    required this.imageName,
    required this.startDate,
    this.endDate,
    required this.priority,
    required this.isFeatured,
    required this.source,
    this.subtitle,
    this.content,
    this.ctaUrl,
    this.location
  });

  factory Poster.fromJson(Map<String, dynamic> json) {
    return Poster(
      id: int.parse(json['id'].toString()),
      title: json['title'] ?? '',
      subtitle: json['subtitle'],
      content: json['content'],
      imageName: json['image_name'] ?? '',
      startDate: DateTime.parse(json['start_date']),
      endDate: json['end_date'] != null
          ? DateTime.parse(json['end_date'])
          : null,
      priority: int.parse(json['priority'].toString()),
      isFeatured: json['is_featured'].toString() == '1',
      source: json['source'] == 'club'
          ? PosterSource.club
          : PosterSource.tournament,
      ctaUrl: json['cta_url'], // optional backend field
      location: json['location'],
    );
  }
}
extension PosterStatus on Poster {
  bool get isExpired {
    if (endDate == null) return false;
    return endDate!.isBefore(DateTime.now());
  }
}
extension PosterHero on Poster {
  String get heroTag => 'poster-hero-$id';
}