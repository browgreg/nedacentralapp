import 'captain_player.dart';

class CaptainTeam {
  final int id;
  final String name;
  final String venue;
  final bool isHome;
  final List<CaptainPlayer> squad;

  CaptainTeam({
    required this.id,
    required this.name,
    required this.venue,
    required this.squad,
    this.isHome = false,
  });

  factory CaptainTeam.fromJson(Map<String, dynamic> json) {
    return CaptainTeam(
      id: json['id'],
      name: json['name'],
      venue: json['venue'],
      isHome: json['is_home'] == 1,
      squad: (json['squad'] as List)
          .map((p) => CaptainPlayer.fromJson(p))
          .toList(),
    );
  }
}
