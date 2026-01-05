// lib/features/landing/model/fixture_model.dart

class Fixture {
  final int id;
  final DateTime date;
  final int round;
  final int division;

  final String homeTeam;
  final String awayTeam;

  final String venueName;
  final String venueAddress;
  final String venuePhone;
  final String? venueNotes;

  Fixture({
    required this.id,
    required this.date,
    required this.round,
    required this.division,
    required this.homeTeam,
    required this.awayTeam,
    required this.venueName,
    required this.venueAddress,
    required this.venuePhone,
    this.venueNotes,
  });

  factory Fixture.fromJson(Map<String, dynamic> json) {
    return Fixture(
      id: json['mf_id'] as int,
      date: DateTime.parse(json['date']),
      round: json['round'] as int,
      division: json['division'] as int,
      homeTeam: json['home_team_name'] as String,
      awayTeam: json['away_team_name'] as String,
      venueName: json['venue_name'] as String,
      venueAddress: json['venue_address'] as String,
      venuePhone: json['venue_phone'] as String,
      venueNotes: (json['venue_notes'] as String?)?.trim().isEmpty == true
          ? null
          : json['venue_notes'],
    );
  }
}
