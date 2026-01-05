class PosterEvent {
  final int posterId;
  final String type; // impression | tap
  final String source;
  final String screen;
  final DateTime ts;

  PosterEvent({
    required this.posterId,
    required this.type,
    required this.source,
    required this.screen,
    required this.ts,
  });

  Map<String, dynamic> toJson() => {
    'poster_id': posterId,
    'type': type,
    'source': source,
    'screen': screen,
    'platform': 'ios', // later dynamic
    'app_version': '1.0.0',
    'ts': ts.toIso8601String(),
  };
}