class PlayerSummary {
  final int rego;
  final String name;
  final bool isCaptain;
  final bool isActive;

  PlayerSummary({
    required this.rego,
    required this.name,
    this.isCaptain = false,
    this.isActive = true,
  });
}
