class PosterEvent {
  final int posterId;
  final String type; // impression, tap, dwell
  final String screen; // landing, poster_detail
  final String source; // carousel, detail_sheet
  final DateTime ts;

  PosterEvent({
    required this.posterId,
    required this.type,
    required this.screen,
    required this.source,
    required this.ts,
  });

  Map<String, dynamic> toJson() => {
    'poster_id': posterId,
    'type': type,
    'screen': screen,
    'source': source,
    'ts': ts.toIso8601String(),
  };
}

