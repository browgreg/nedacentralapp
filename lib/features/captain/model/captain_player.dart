class CaptainPlayer {
  final int rego;
  final String name;

  CaptainPlayer({
    required this.rego,
    required this.name,
  });

  factory CaptainPlayer.fromJson(Map<String, dynamic> json) {
    return CaptainPlayer(
      rego: json['rego'],
      name: json['name'],
    );
  }
}
