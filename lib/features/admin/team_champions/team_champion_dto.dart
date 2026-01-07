class TeamChampionDto {
  final int year;
  final String season;
  final int division;
  final String champion;
  final String runnerUp;

  TeamChampionDto({
    required this.year,
    required this.season,
    required this.division,
    required this.champion,
    required this.runnerUp,
  });

  factory TeamChampionDto.fromJson(Map<String, dynamic> json) {
    return TeamChampionDto(
      year: (json['year'] as num).toInt(),
      season: (json['season'] ?? '').toString(),
      division: (json['div'] as num).toInt(),
      champion: (json['champion'] ?? '').toString(),
      runnerUp: (json['runnerUp'] ?? '').toString(),
    );
  }
}
